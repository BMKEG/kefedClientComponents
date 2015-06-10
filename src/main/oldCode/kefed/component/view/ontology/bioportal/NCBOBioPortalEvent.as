// $Id: NCBOBioPortalEvent.as 1180 2010-09-22 17:19:40Z tom $
//
//  $Date: 2010-09-22 10:19:40 -0700 (Wed, 22 Sep 2010) $
//  $Revision: 1180 $
//
package edu.isi.bmkeg.kefed.component.view.ontology.bioportal
{

	import flash.events.Event;
	import mx.collections.ArrayCollection;
		
	public class NCBOBioPortalEvent extends Event
	{
		public static const NCBO_SEARCH:String = "ncbo-search";
		public static const NCBO_LIST_ONTOLOGIES:String = "ncbo-list-ontologies";
		public static const SET_ONTOLOGY_IDS:String = "set_ontology_ids";
		public static const ADD_ONTOLOGY_IDS:String = "add_ontology_ids";

		public var searchResults:ArrayCollection;
		
		public function NCBOBioPortalEvent(type:String, searchResults:ArrayCollection)
		{
			super(type);
			this.searchResults = searchResults;
		}
		
	}
	
}