// $Id: OntologySearchInterface.as 2057 2011-03-30 01:12:31Z tom $
//
//  $Date: 2011-03-29 18:12:31 -0700 (Tue, 29 Mar 2011) $
//  $Revision: 2057 $
//
package edu.isi.bmkeg.kefed.component.view.ontology {
	import edu.isi.bmkeg.kefed.component.view.elements.IKefedNamedObject;
	
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	/** Interface describing the search interface for ontology search
	 *  Web services.  This class operates by accepting requests to
	 *  list ontologies or search for terms.  The requests are processed
	 *  asynchronously and upon completion an event of the appropriate
	 *  type will be dispatched, containing the results.
	 * 
	 *  This is intended to be an abstract class that provides common
	 *  storage and some support routines for classes that implement
	 *  access to particular ontology repositories.
	 * 
	 * @author University of Southern California
	 * @date $Date: 2011-03-29 18:12:31 -0700 (Tue, 29 Mar 2011) $
	 * @version $Revision: 2057 $
	 */
	public class OntologySearchInterface extends EventDispatcher {
		
		/** Name of the ontology search interface */
		public function get name():String {
			throw new Error("Internal error:\nOntologySearchInterface.get name() must be overridden in subclasses.");
		}
		
		/** Collection of ontology names that this Interface will
	 	 *  accept.  May be <code>null</code>, in which case all
	 	 *  ontologies will be accepted.  An empty collection will
	 	 *  accept no ontologies.
	 	 */
		public static var allowedOntologyList:ArrayCollection = null;


		/** Perform any required initialization.  This allows for
		 *  asynchronous initialization and loading of external
		 *  resources if needed by a particular service.  This
		 *  method must be called on the service before using it.
		 *  Once the service is ready, it will dispatch an 
		 *  OntologySearchEvent of type
		 *  OntologySearchEvent.SEARCH_SERVICE_READY.
		 */
		public function initialize():void {
			// Default implementation presumes that the service needs no
			// additional initialization and dispatches the event.
			// Override this in services that require later initialization.
			dispatchEvent(new OntologySearchEvent(OntologySearchEvent.SEARCH_SERVICE_READY, null));
		}


		/** Perform a search for a term string and return a list of
		 *  ontology items that match.  The Kefed object is used to
		 *  pre-select already present terms from among those that
		 *  will be presented to the user in a dialog.  The search
		 *  terms will be included in an OntologySearchEvent of the
		 *  type OntologySearchEvent.FIND_ONTOLOGY_TERMS.
		 *  The KEfED object is provided for cases where a search interface
		 *  may have a particular special means of searching based on the
		 *  KEfED object itself.
		 *  TODO: The latter will need expansion to account for values
		 *        that are terms but not KEfED objects.
		 * 
		 * @param term The string to use for term search in the ontology
		 * @param exact If an exact match is required.  Otherwise, a substring suffices.
		 * @param prop If properties or relations are also considered.  Otherwise just classes and instances.
		 * @param kefedObj The KEfED object that this search is for. (may be null).
		 */
		public function search(term:String, exact:Boolean, prop:Boolean, kefedObj:IKefedNamedObject):void {
			throw new Error("Internal error:\nOntologySearchInterface.search must be overridden in subclasses.");
		}
		
		/** List the ontologies that this particular service can search
		 *  over.  Results will be included in an OntologySearchEvent of
		 *  type OntologySearchEvent.LIST_ONTOLOGIES.   If listing ontologis
		 *  is not supported, then a search result of <code>null</code>
		 *  will be returned in the event.
		 */
		public function listOntologies():void {
			throw new Error("Internal error:\nOntologySearchInterface.listOntologies must be overridden in subclasses.");
		}
		
		/** Cancel any pending search or listOntologies requests
		 */
		public function cancel():void {
			throw new Error("Internal error:\nOntologySearchInterface.cancel must be overridden in subclasses.");
		}
	}
}