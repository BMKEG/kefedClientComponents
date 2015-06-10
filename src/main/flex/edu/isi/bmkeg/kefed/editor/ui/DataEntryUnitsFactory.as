// $Id$
//
//  $Date$
//  $Revision$
//
package edu.isi.bmkeg.kefed.editor.ui
{
	import edu.isi.bmkeg.kefed.editor.elements.KefedBaseValueTemplate;
	
	import mx.controls.ComboBox;
	import mx.core.ClassFactory;

	public class DataEntryUnitsFactory extends ClassFactory	{
	
		private var _template:KefedBaseValueTemplate;
				
		public function DataEntryUnitsFactory(vTemplate:KefedBaseValueTemplate) {
			super(UnitEditor);
			this._template = vTemplate;
		}
		
		override public function newInstance():* {
			var ed:UnitEditor = super.newInstance();
			var tempData:Array = new Array();
			// Is this copying really needed?
			for each (var v:String in _template.allowedUnits) { 
				tempData.push(v);
			}
			ed.allowOtherUnits = _template.allowFreeUnitInput;
			ed.allowedUnits = _template.allowedUnits;
			ed.data	
			return ed;
		}
		
		private function unitsDataTipFunction(data:Object):String {
        	return data.value + " " + data.units;
        }
		
	}

}