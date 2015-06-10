// $Id: DataEntryUnitsFactory.as 1524 2011-01-04 01:05:27Z tom $
//
//  $Date: 2011-01-03 17:05:27 -0800 (Mon, 03 Jan 2011) $
//  $Revision: 1524 $
//
package edu.isi.bmkeg.kefed.component.view.ui
{
	import edu.isi.bmkeg.kefed.component.view.elements.KefedBaseValueTemplate;
	
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