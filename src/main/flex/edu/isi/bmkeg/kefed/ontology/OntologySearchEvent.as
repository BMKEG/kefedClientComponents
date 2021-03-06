// $Id: OntologySearchEvent.as 1219 2010-10-06 22:05:32Z tom $
//
//  $Date: 2010-10-06 15:05:32 -0700 (Wed, 06 Oct 2010) $
//  $Revision: 1219 $
//
package edu.isi.bmkeg.kefed.ontology {
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	/** Class for events generated by using web services to
	 *  search for ontology terms.
	 * 
	 * @author University of Southern California
	 * @date $Date: 2010-10-06 15:05:32 -0700 (Wed, 06 Oct 2010) $
	 * @version $Revision: 1219 $
	 */
	public class OntologySearchEvent extends Event {
		public static const FIND_ONTOLOGY_TERMS:String = "find-ontology-terms";
		public static const LIST_ONTOLOGIES:String = "list-ontologies";
		public static const SET_ONTOLOGY_IDS:String = "set-ontology-ids";
		public static const ADD_ONTOLOGY_IDS:String = "add-ontology-ids";
		
		public var searchResults:ArrayCollection;
		
		public function OntologySearchEvent(type:String, results:ArrayCollection) {
			super(type);
			this.searchResults = results;
		}		
	}
}