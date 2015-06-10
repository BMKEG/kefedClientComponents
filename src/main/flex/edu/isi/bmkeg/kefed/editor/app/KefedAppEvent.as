// $Id$
//
//  $Date$
//  $Revision$
//
package edu.isi.bmkeg.kefed.editor.app {
	
	import edu.isi.bmkeg.kefed.editor.elements.KefedModel;
	
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