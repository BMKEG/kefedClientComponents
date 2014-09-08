package edu.isi.bmkeg.kefed.data.view.subElements
{
	import edu.isi.bmkeg.ooevv.model.scale.*;
	
	import mx.controls.ComboBox;
	import mx.core.ClassFactory;

	public class DataEntryUnitsFactory extends ClassFactory	{
	
		private var _template:MeasurementScale;
				
		public function DataEntryUnitsFactory(vTemplate:MeasurementScale) {
			super(UnitEditor);
			this._template = vTemplate;
		}
		
		override public function newInstance():* {
			var ed:UnitEditor = super.newInstance();
			var tempData:Array = new Array();
			// Is this copying really needed?
			/*for each (var v:String in _template.allowedUnits) { 
				tempData.push(v);
			}
			ed.allowOtherUnits = _template.allowFreeUnitInput;
			ed.allowedUnits = _template.allowedUnits;
			ed.data*/	
			return ed;
		}
		
		private function unitsDataTipFunction(data:Object):String {
        	return data.value + " " + data.units;
        }
		
	}

}