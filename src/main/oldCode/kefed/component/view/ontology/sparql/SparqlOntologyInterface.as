// $Id: SparqlOntologyInterface.as 2057 2011-03-30 01:12:31Z tom $

package edu.isi.bmkeg.kefed.component.view.ontology.sparql {
	import edu.isi.bmkeg.kefed.component.view.elements.IKefedNamedObject;
	import edu.isi.bmkeg.kefed.component.view.elements.KefedObject;
	import edu.isi.bmkeg.kefed.component.view.ontology.OntologySearchEvent;
	import edu.isi.bmkeg.kefed.component.view.ontology.OntologySearchInterface;
	import edu.isi.bmkeg.kefed.component.view.ui.UiUtil;
	import edu.isi.bmkeg.utils.UriUtil;
	import edu.isi.bmkeg.utils.sparql.SparqlUtil;
	
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.xml.XMLDocument;
	
	import mx.collections.ArrayCollection;
	import mx.collections.Sort;
	import mx.controls.Alert;
	import mx.events.CollectionEvent;
	import mx.events.CollectionEventKind;
	import mx.managers.CursorManager;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	import mx.utils.URLUtil;
	
	/** Search interface for RDF stores that implement a SPARQL endpoint
	 *  and store OWL ontologies.
	 *
	 * @author University of Southern California
	 * @date $Date: 2011-03-29 18:12:31 -0700 (Tue, 29 Mar 2011) $
	 * @version $Revision: 2057 $
	 */	
	public class SparqlOntologyInterface extends OntologySearchInterface {
		
		// TODO: Make this a parameter?
		private static const QUERY_FILE:String = "sparqlTermQueries.xml";
		private static var PREFIXES:String = "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> "
											+ "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> "
											+ "PREFIX owl: <http://www.w3.org/2002/07/owl#>"
											+ "PREFIX dc: <http://purl.org/dc/elements/1.1/>";
		private static var GENERAL_FILTER:String = "FILTER (?type != owl:Ontology)";							
		private static var PROPERTY_FILTER:String = "FILTER (?type != owl:Property "
													+ "&& ?type != rdf:Property "
													+ "&& ?type != owl:Property "
													+ "&& ?type != owl:AnnotationProperty "
													+ "&& ?type != owl:ObjectProperty "
													+ "&& ?type != owl:DatatypeProperty "
													+ "&& ?type != owl:FunctionalProperty "
													+ "&& ?type != owl:TransitiveProperty "
													+ "&& ?type != owl:SymmetricProperty "
													+ ")";
		private static const LIST_QUERY:String = PREFIXES 
												+ " SELECT ?ontologyId ?fullName ?versionNumber ?description "
												+ " WHERE {"
												+ "   ?ontologyId rdf:type owl:Ontology . "
												+ "   OPTIONAL { ?ontologyId rdfs:comment ?description } . "
												+ "   OPTIONAL { {?ontologyId rdfs:label ?fullName} "
												+ "              UNION {?ontologyId dc:title ?fullName}} . " 
												+ "   OPTIONAL { ?ontologyId owl:versionInfo ?versionNumber } ."
												+ "} ORDER BY (?ontologyId)";
													
		/** Hash to hold the ontologies from this endpoint.
		 *  Keeps the ontology by its URI and records
		 *  the name and namespaceUri for it.
		 */					
		private var ontologyTable:Object = new Object();
		
		
		/** Flag to indicate whether to get the ontologies from the
		 *  SPARQL endpoint or to use the supplied values.  This allows
		 *  us to use this class for both cases.
		 *  TODO: Consider splitting this into two classes?
		 */
		 private var getOntologiesFromService:Boolean = true;
				
		/** Endpoint for the SPARQL query interface. */
		[Bindable]
		public var endpointUrl:String = null;
		
		private var _name:String = null;
		private var _ontologyId:String = null;
		private var serverSideFileName:String = null;
		
		private var searchService:HTTPService;
		private var initialService:HTTPService;
		private var listOntologiesService:HTTPService;
		
		private var listOntolgiesQuery:String;
		
		private var variable_exact_label_query:String;
		private var variable_exact_documentation_query:String;
		private var variable_partial_label_query:String;
		private var variable_partial_documentation_query:String;
		private var activity_exact_label_query:String;
		private var activity_exact_documentation_query:String;
		private var activity_partial_label_query:String;
		private var activity_partial_documentation_query:String;
		private var entity_exact_label_query:String;
		private var entity_exact_documentation_query:String;
		private var entity_partial_label_query:String;
		private var entity_partial_documentation_query:String;
		private var default_exact_label_query:String;
		private var default_exact_documentation_query:String;
		private var default_partial_label_query:String;
		private var default_partial_documentation_query:String;
		
		protected var currentSearchTerm:String = null;
		protected var currentSearchResults:ArrayCollection = null;
		
		/** Constructor for a SPARQL ontology search interface.
		 *  
		 *  TODO:  Right now we don't have a way to figure out the ontology
		 *  that a particular term belongs to, so we make the temporary
		 *  and almost certainly incorrec assumption that all of the endpoint
		 *  information is from a single ontology, and so we supply that
		 *  ontologyId when we create this endpoint.
		 * 
		 * @param ontologyId Id for the ontology of this endpoint. TEMPORARY!
		 * @param endpointUrl The url for the SPARQL endpoint of the repository.
		 * @param name The name of this service.  Optional.
		 * @param queryFileName The name of the server-side file containing the queries.
		 */
		public function SparqlOntologyInterface(ontologyId:String,
											    endpointUrl:String,
											    name:String=null,
											    queryFileName:String=QUERY_FILE
											    ) {
			
			this.endpointUrl = endpointUrl;
			this._name = name;
			if (ontologyId==null) {
				this.getOntologiesFromService = true;
				this._ontologyId = endpointUrl;				
			} else {
				this._ontologyId = ontologyId;
				this.getOntologiesFromService = false;
			}
			if (queryFileName) serverSideFileName = queryFileName;
			initSearchService();
			initOntologiesService();
			setupOntologiesList();
		}
		
		private function createSparqlService ():HTTPService {
			var useProxy:Boolean = true;
			var service:HTTPService = new HTTPService();
		 	service.useProxy = useProxy;
		 	if (useProxy) {
				service.destination= (URLUtil.getProtocol(endpointUrl) == "https") ? "DefaultHTTPS" : "DefaultHTTP";
			}
		 	service.resultFormat = "xml";
			service.contentType = "application/javascript";
			service.method = "GET";
			return service;
		}
		
		private function initSearchService():void {
			searchService = createSparqlService();
			searchService.addEventListener(ResultEvent.RESULT, searchResultEventHandler);
			searchService.addEventListener(FaultEvent.FAULT, faultEventHandler);
		}
		
		private function initOntologiesService():void {
			if (getOntologiesFromService) {
				listOntologiesService = createSparqlService();
				listOntologiesService.addEventListener(ResultEvent.RESULT, listOntologiesResultEventHandler);
				listOntologiesService.addEventListener(FaultEvent.FAULT, faultEventHandler);
			}
		}
		
		private function setupOntologiesList():void {
			if (getOntologiesFromService) {
				initialService = createSparqlService();
				initialService.url = endpointUrl + "?format=xml&query=" + encodeURIComponent(LIST_QUERY);
				initialService.addEventListener(ResultEvent.RESULT, initialOntologiesResultEventHandler);
				initialService.addEventListener(FaultEvent.FAULT, faultEventHandler);
				initialService.send();
			}
		}
		
		override public function get name():String {
			if (_name) {
				return _name;
			} else {
				return endpointUrl;
			}
		}
	
		/** Loads basic query strings from a file on the server.
		 *  This start the loading process and return.  When
		 *  asynchronous initialization is complete, it will
		 *  dispatch OntologySearchEvent.SEARCH_SERVICE_READY.
		 */
		override public function initialize():void {
			var request:URLRequest = new URLRequest(serverSideFileName);
			var header:URLRequestHeader = new URLRequestHeader("pragma", "no-cache");
 	        var queryLoader:URLLoader = new URLLoader();
 	        request.requestHeaders.push(header);
	        queryLoader.dataFormat = URLLoaderDataFormat.TEXT;
	        queryLoader.addEventListener(Event.COMPLETE, handleQueryLoad);
	        queryLoader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
	        try {
	            queryLoader.load(request);
	        } catch (error:Error) {
	            trace("Unable to load URL: " + error);
	            Alert.show("Unable to load query file URL: " + error);
	        }
		}
		
		/** Handle the loading of the file with the query
		 *  strings.
		 */
		private function handleQueryLoad(evt:Event):void {
			// Get result 
			var dataXML:XML = XML(evt.target.data);
			listOntolgiesQuery = dataXML.listOntologiesQuery.text();
			variable_exact_label_query = dataXML["variable-exact-label"].text();
			variable_exact_documentation_query = dataXML["variable-exact-documentation"].text();
			variable_partial_label_query = dataXML["variable-partial-label"].text();
			variable_partial_documentation_query = dataXML["variable-partial-documentation"].text();
			activity_exact_label_query = dataXML["activity-exact-label"].text();
			activity_exact_documentation_query = dataXML["activity-exact-documentation"].text();
			activity_partial_label_query = dataXML["activity-partial-label"].text();
			activity_partial_documentation_query = dataXML["activity-partial-documentation"].text();
			entity_exact_label_query = dataXML["entity-exact-label"].text();
			entity_exact_documentation_query = dataXML["entity-exact-documentation"].text();
			entity_partial_label_query = dataXML["entity-partial-label"].text();
			entity_partial_documentation_query = dataXML["entity-partial-documentation"].text();
			default_exact_label_query = dataXML["default-exact-label"].text();
			default_exact_documentation_query = dataXML["default-exact-documentation"].text();
			default_partial_label_query = dataXML["default-partial-label"].text();
			default_partial_documentation_query = dataXML["default-partial-documentation"].text();

			
			if (getOntologiesFromService) {
				listOntologiesService.url = endpointUrl + "?format=xml&query=" + encodeURIComponent(listOntolgiesQuery);
				initialService.url = endpointUrl + "?format=xml&query=" + encodeURIComponent(listOntolgiesQuery);
				initialService.send();
			} else {
				dispatchEvent(new OntologySearchEvent(OntologySearchEvent.SEARCH_SERVICE_READY, null));
			}
		}

		
		override public function search(term:String, exact:Boolean, prop:Boolean, kefedObj:IKefedNamedObject):void {
			if (term == null) return;
			currentSearchTerm = term;
			// Need to use escape characters for the URL.
			/*
			var typeFilter:String = (prop) ? GENERAL_FILTER : GENERAL_FILTER + " " + PROPERTY_FILTER;
			var filterCode:String;
			if (exact) {
				filterCode = 'FILTER ( str(?termId) = "' + term + '" '
									+ '|| str(?displayName) = "' + term + '" '
									+ '|| str(?description) = "' + term + '" '
									+ ') ';
			} else {
				filterCode = 'FILTER (regex(str(?termId), "' + term + '", "i" ) '
									+ '|| regex(str(?displayName), "' + term + '", "i" ) '
									+ '|| regex(str(?description), "' + term + '", "i" ) '
									+ ') ';
			}
			var query:String = PREFIXES
								+ " SELECT ?termId ?displayName ?description "
								+ " WHERE {"
								+ "   ?termId rdf:type ?type . "
								+ "   OPTIONAL { ?termId rdfs:comment ?description } . "
								+ "   OPTIONAL { ?termId rdfs:label ?displayName } . "
								+ filterCode + " " + typeFilter
								+ "}";
			*/
			var query:String = null;
			var theObj:KefedObject = (kefedObj && kefedObj is KefedObject) ? kefedObj as KefedObject : null;
			var qtype:String = null;
			var match:String = (exact) ? "exact" : "partial";
			var scope:String = (prop) ? "documentation" : "label";
			// Placeholders for expansion.
			if (theObj && theObj.isVariable()) {
				qtype = "variable";
			} else if (theObj && theObj.isActivity()) {
				qtype = "activity";
			} else if (theObj && theObj.isEntity()) {
				qtype = "entity";
			} else { // Default case, includes theObj == null.
				qtype = "default";
			}
			var queryTag:String = qtype + "_" + match + "_" + scope + "_query";
			query = this[queryTag];
			if (query) {
				var pattern:RegExp = /\$SEARCH_STRING/g;
				query = query.replace(pattern, term);
				trace("search query = " + query);
				// Alert.show("tarm = " + term + "\nquery = " + query);
			 	searchService.url = endpointUrl + "?format=xml&query=" + encodeURIComponent(query); 	 	
				// Alert.show("Search URL = " + searchService.url);
			 	CursorManager.setBusyCursor();
				searchService.send();
			} else {
				Alert.show("No query string found to match Ontology query tag\n" + queryTag);
			}
		}
		

		/** Takes the results from the web service query and puts them
		 *  into an array
		 *  Takes care to select any search results that are already 
		 *  present in the current Kefed object's onologyId field.
		 * 
		 *  Receives ?termId ?displayName ?description
		 *  where there can be multiple values because ?label or ?description
		 *     can have multiple values.
		 * 
		 *  Need to turn into
		 * 		ontologyId: An ID for the ontology.  This may be a universal
		 *                    id or relative to the search engine.
		 *      termId: An ID for the term in the ontology.  This may also be a 
		 *                    universal or relative id.
		 *      shortName: The short name of the term
		 *      displayName: The name of the term for display purposes
		 *      description: A description of the term (long)
		 * 
		 * @param event The result event for the web service query
		 */
		private function searchResultEventHandler(event:ResultEvent):void {
		
			var xmlDoc:XMLDocument =  new XMLDocument(XML(event.result));	
			
		 	CursorManager.removeBusyCursor();
			currentSearchResults = processSearchResultsXml(XML(event.result));
			var sort:Sort = new Sort();
			sort.compareFunction = compareResults;
			currentSearchResults.sort = sort;
			currentSearchResults.addEventListener(CollectionEventKind.REFRESH, sortCompleteHandler);
			if (currentSearchResults.refresh()) {
			// Alert.show(searchResults.length + " items from\n" + XML(event.result).toXMLString());
				trace("Sorted " + currentSearchResults.length + " items immediately");
  				var outputEvent:OntologySearchEvent = 
					new OntologySearchEvent(OntologySearchEvent.FIND_ONTOLOGY_TERMS, currentSearchResults);
				dispatchEvent(outputEvent);			
			}
		}
		
		/** Used if we need to wait for sorting to complete.
		 */
		private function sortCompleteHandler(event:CollectionEvent):void {
			trace("Sorted " + currentSearchResults.length + " items delayed.");
 			var outputEvent:OntologySearchEvent = 
					new OntologySearchEvent(OntologySearchEvent.FIND_ONTOLOGY_TERMS, currentSearchResults);
			dispatchEvent(outputEvent);	
		}
		
		/**
		 *  Receives ?termId ?displayName ?description
		 *  where there can be multiple values because ?label or ?description
		 *     can have multiple values.
		 * 
		 *  Need to turn into
		 *      termId:  An ID for the term.  This may be a universal
		 *                    id or relative to the ontology.
		 *      shortName:  A short version of the ID.
		 *      displayName: The preferred human readable name for the term
		 *      description: A longer description or definition of the term
		 *      ontologyId: An ID for the ontology.  This may be a universal
		 *                    id or relative to the search engine.
		 *      ontologyDisplayName: Ontology name for display purposes.
		 * 
		 * @param xmlDoc The search results as an XML document
		 * @return ArrayCollection of objects with fields filled in.
		 */
		private function processSearchResultsXml(xmlDoc:XML):ArrayCollection {
			var resultsHash:Object = new Object; // Collect the items and resolve multiple values.
			var resultCollection:ArrayCollection = new ArrayCollection();
			// Process each result item, filtering for allowedOntologies.
			// - Set the ontologyId and ontologyDisplayName the first time the term is found.
			// - Keep the shortest displayName.
			// - Combine multiple description fields into a single large field.
			for each (var result:Object in SparqlUtil.getResultsAsObjects(xmlDoc)) {
				var termOntologyId:String = getTermOntologyId(result.termId);
				if (true) { // (allowedOntologyList == null || allowedOntologyList.contains(termOntologyId)) {
					var match:Object = resultsHash[result.termId];
					if (match == null) {
						result.ontologyId = termOntologyId;
						result.ontologyDisplayName = getTermOntologyName(result.termId);
						resultsHash[result.termId] = result;				
					} else {
						keepShortest(match, result, "displayName");
						concatenateFields(match, result, "description");
					}
				}
			}
			
			var searchExp:RegExp = new RegExp("(" + currentSearchTerm + ")","gi");
			var replaceExp:String = "<b>$1</b>";
			for each (result in resultsHash) {
				// Set shortName to the smaller of the displayName or the Uri name.
				var uriName:String = UriUtil.getUriName(result.termId);
				if (result.displayName && result.displayName.length  < uriName.length) {
					result.shortName = result.displayName;
				} else {
					result.shortName = uriName;
				}
				if (result.displayName) { // Highlight the name and add the htmlDisplayName field
					result.htmlDisplayName = (result.displayName as String).replace(searchExp, replaceExp);
				}
				if (result.description) { // Highlight the description and add htmlDescription field
					result.htmlDescription = (result.description as String).replace(searchExp, replaceExp);
				}
				resultCollection.addItem(result);
			}
			return resultCollection;
		}
		
		private function getTermOntologyId(termId:String):String {
			// Return the ontologyId for the term.
			// TODO: This is currently a hack.
			if (getOntologiesFromService) {
				var ontology:Object  = ontologyTable[UriUtil.getUriHead(termId)];
				return (ontology) ? ontology.ontologyId : null;
			} else {
				return this._ontologyId;
			}
		}
		
		private function getTermOntologyName(termId:String):String {
			// Return the ontologyName for the term.
			// TODO: This is currently a hack.
			if (getOntologiesFromService) {
				var ontology:Object  = ontologyTable[UriUtil.getUriHead(termId)];
				return (ontology) ? ontology.fullName : null;
			} else {
				return this.name;
			}
		}
		
		
		/** Keeps the shortest real string value for field.
		 *  Executed for side effect on mainItem
		 * 
		 * @param mainItem The main item accumulating values.  Modified.
		 * @param newItem The new item to use as field source.
		 * @param field The field to update
		 */
		private function keepShortest(mainItem:Object, newItem:Object, field:String):void {
			if (mainItem[field]) {
				if (newItem[field] 
				    && mainItem[field].length > newItem[field].length
				    && newItem[field].length > 0) {
				   mainItem[field] = newItem[field];
				}
				// Otherwise the main item is smallest, so do nothing.
				
			} else {
				// No value, so use the new one (which may be null).
				mainItem[field] = newItem[field];
			}
		}
		
		/** Keeps the longest real string value for field.
		 *  Executed for side effect on mainItem
		 * 
		 * @param mainItem The main item accumulating values.  Modified.
		 * @param newItem The new item to use as field source.
		 * @param field The field to update
		 */
		private function keepLongest(mainItem:Object, newItem:Object, field:String):void {
			if (mainItem[field]) {
				if (newItem[field] 
				    && mainItem[field].length < newItem[field].length) {
				   mainItem[field] = newItem[field];
				}
				// Otherwise the main item is biggest, so do nothing.
				
			} else {
				// No value, so use the new one (which may be null).
				mainItem[field] = newItem[field];
			}
		}
		
		/** Concatenates the field values.
		 *  Executed for side effect on mainItem.
		 * 
		 * @param mainItem The main item accumulating values.  Modified.
		 * @param newItem The new item to use as field source.
		 * @param field The field to update
		 */		
		 private function concatenateFields(mainItem:Object, newItem:Object, field:String):void {
			if (mainItem[field]) {
				if (newItem[field] 
				 	 && newItem[field].length > 0
				 	 && (mainItem[field] as String).indexOf(newItem[field]) < 0) {
					// newItem has a value that isn't already present,
					// so add it to the existing value.
					mainItem[field] += " " + newItem[field];
				}
			} else {
				// No value in mainItem, use the newItem value (which may be null)
				mainItem[field] = newItem[field];
			}
		}
		
		/** Comparison function for sorting results.  Orders matches based on
		 *  the displayName ahead of those based on the description field.
		 *  TODO: Consider termId as well?
		 *  As a secondary criterion, the results are ordered based on the
		 *  closest location in the string where the search term match occurs.
		 *
		 * @param a First object to compare
		 * @param b Second object to compare
		 * @param fields Array of fields.  Not used.
		 * @return -1, 0 or 1 if A is less than, equal or greater than B.
		 */  
		protected function compareResults (a:Object, b:Object, fields:Array = null):int {
			var searchTerm:RegExp = new RegExp(currentSearchTerm, "i");
			var aNamePos:int = positionInField(searchTerm, a, "displayName"); 
			var bNamePos:int = positionInField(searchTerm, b, "displayName");
			if (aNamePos < 0) {
				if (bNamePos < 0) { // Not in either displayName field
					var aDescriptionPosition:int = positionInField(searchTerm, a, "description");
					var bDescriptionPosition:int = positionInField(searchTerm, b, "description");
					if (bDescriptionPosition < 0) { // Not in b, so sort a first.
						return -1;
					} else if (aDescriptionPosition < 0) { // Not in a, so sort b first.
						return 1;
					} else {
						return compareInts(aDescriptionPosition, bDescriptionPosition);
					}
				} else { // In b displayName position only
					return 1;
				}
			} else { // In a displayName field
				if (bNamePos < 0) { // Only in a displayName field
					return -1;
				} else { // In both displayName fields
					return compareInts(aNamePos, bNamePos);
				}
			}		
		}
		
		/** Helper function for sorting.  Returns the position of the
		 *  search string in the given field of an object.  -1 is returned
		 *  if the search string isn't present, including if there is not
		 *  value for the field in question.
		 * 
		 * @param s The RegExp to find.
		 * @param obj The object to check
		 * @param field The field of the object to check
		 */
		protected function positionInField (s:RegExp, obj:Object, field:String):int {
			if (obj[field]) {
				return obj[field].toString().search(s);
			} else {
				return -1;
			}
		}
		
		protected function compareInts (a:int, b:int):int {
			if (a < b) return -1;
			if (a > b) return 1;
			return 0;
		}
		
		
		override public function listOntologies():void {
			if (getOntologiesFromService) {
			 	CursorManager.setBusyCursor();
			 	trace("Sending URL",listOntologiesService.url);
				listOntologiesService.send();
			} else {
				var searchResults:ArrayCollection = new ArrayCollection();
				var ontology:Object = new Object;
				ontology.ontologyId = this._ontologyId;
				ontology.fullName = this.name;
				ontology.shortName = this.name;
				ontology.description = "";
				ontology.versionNumber = null;
				searchResults.addItem(ontology);
				var outputEvent:OntologySearchEvent = 
					new OntologySearchEvent(OntologySearchEvent.LIST_ONTOLOGIES, searchResults);
				dispatchEvent(outputEvent);
			}
		}
		
		/** Receives ?ontologyId ?fullName ?versionNumber ?description
		 *  where there can be multiple values because ?displayName or ?description
		 *     can have multiple values.
		 *  Need to turn into
		 * 		ontologyId: An ID for the ontology.  This may be a universal
		 *                    id or relative to the search engine.
		 *      fullName: The name of the ontology for display purposes
		 *      ? shortName: An abbreviated name for the ontology (hack)
		 *      description: A description of the ontology (long)
		 *      versionNumber: Ontology version number
		 * 		nameSpace: The ontology Id (hack)
		 * 
		 *  And add to the ontologyTable for this interface.
		 *  TODO: Handle multiple return values for a single ontology!
		 */
		private function initialOntologiesResultEventHandler (event:ResultEvent):void {
			var xmlDoc:XML =  XML(event.result);	
			for each (var ontologyElement:Object in SparqlUtil.getResultsAsObjects(xmlDoc)) {
				if (!ontologyElement.fullName) ontologyElement.fullName = UriUtil.getUriName(ontologyElement.ontologyId);
				ontologyElement.nameSpace = ontologyElement.ontologyId;
				ontologyTable[ontologyElement.ontologyId] = ontologyElement;
			}
			initialService = null; // No longer needed.
			dispatchEvent(new OntologySearchEvent(OntologySearchEvent.SEARCH_SERVICE_READY, null));
		}
		
		
		/** Receives ?ontologyId ?fullName ?versionNumber ?description
		 *  where there can be multiple values because ?displayName or ?description
		 *     can have multiple values.
		 *  Need to turn into
		 * 		ontologyId: An ID for the ontology.  This may be a universal
		 *                    id or relative to the search engine.
		 *      fullName: The name of the ontology for display purposes
		 *      shortName: An abbreviated name for the ontology
		 *      description: A description of the ontology (long)
		 *      versionNumber: Ontology version number
		 * 
		 *  TODO: Handle multiple return values for a single ontology!
		 * 
		 */
		 private function listOntologiesResultEventHandler (event:ResultEvent):void {
			CursorManager.removeBusyCursor();
			var searchResults:ArrayCollection = processListOntologiesXml(XML(event.result));
			var outputEvent:OntologySearchEvent = 
					new OntologySearchEvent(OntologySearchEvent.LIST_ONTOLOGIES, searchResults);
			dispatchEvent(outputEvent);
		}
		
		private function processListOntologiesXml(xmlDoc:XML):ArrayCollection {
			var resultsHash:Object = new Object; // Collect the items and resolve multiple values.
			var resultCollection:ArrayCollection = new ArrayCollection();
			// Process each result item, filtering for allowedOntologies.
			// - Keep the longest fullName
			// - keep the longest versionNumber
			// - Combine multiple description fields into a single large field.
			for each (var result:Object in SparqlUtil.getResultsAsObjects(xmlDoc)) {
				var match:Object = resultsHash[result.ontologyId];
				if (match == null) {
					resultsHash[result.ontologyId] = result;	
				} else {
					keepLongest(match, result, "fullName");
					keepLongest(match, result, "versionNumber");
					concatenateFields(match, result, "description");
				}

			}
			
			// Update names.
			for each (result in resultsHash) {
				// Set shortName to the Uri name.
				result.shortName = UriUtil.getUriName(result.ontologyId);
				result.elementNamespace = result.ontologyId;
				if (result.fullName == null || result.fullName.length == 0) {
					result.fullName = result.shortName;
				}
				resultCollection.addItem(result);
			}
			return resultCollection;
		}
		
		private function ioErrorHandler(event:IOErrorEvent):void {
			Alert.show(event.toString());			
			CursorManager.removeBusyCursor();
			dispatchEvent(event);		
		}

		
		private function faultEventHandler(event:FaultEvent):void {
		       // TODO: Should this be done here?  Or in the higher handler instead?
			Alert.show(UiUtil.getFaultURL(event) + "\n" + event.toString());			
			CursorManager.removeBusyCursor();
			dispatchEvent(event);		
		}
		/** Cancel pending search or listOntologies requests..
		 */
		override public function cancel():void {
			if (this.listOntologiesService) this.listOntologiesService.cancel();
			if (this.searchService) this.searchService.cancel();
			CursorManager.removeBusyCursor();
		}		
	}
}
