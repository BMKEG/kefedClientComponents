// $Id: KefedAppEvent.as 1482 2010-12-15 02:02:49Z tom $
//
//  $Date: 2010-12-14 18:02:49 -0800 (Tue, 14 Dec 2010) $
//  $Revision: 1482 $
//
package edu.isi.bmkeg.kefed.component.view.app {
	
	import edu.isi.bmkeg.kefed.component.view.elements.KefedModel;
	
	import flash.events.Event;

	public class KefedAppEvent extends Event {
		
		public static const EDIT_DESIGN:String = "edit-design";
		public static const CANCEL_DESIGN_EDIT:String = "cancel-edit-design";
		public static const SAVE_DESIGN_EDIT:String = "save-edit-design";
		public static const DONE_EDIT_DESIGN:String = "done-edit-design";
		public static const EDIT_DATA:String = "edit-data";
		public static const CANCEL_DATA_EDIT:String = "cancel-edit-data";
		public static const SAVE_DATA_EDIT:String = "save-edit-data";
		public static const DONE_EDIT_DATA:String = "done-edit-data";
		
		public static const ONTOLOGY_LIST_LOADED:String = "ontology-list-loaded";

		public var activeModel:KefedModel;
				
		public function KefedAppEvent(type:String, activeModel:KefedModel) {
			super(type);
			this.activeModel = activeModel;
		}

	}
}