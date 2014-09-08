package edu.isi.bmkeg.kefed.data.view.subElements
{
	import edu.isi.bmkeg.ooevv.model.scale.*;
	
	import mx.containers.BoxDirection;
	import mx.core.ClassFactory;

	public class DataEntryRelativeRegionFactory extends ClassFactory	{
	
		private var _template:MeasurementScale;
				
		public function DataEntryRelativeRegionFactory(vTemplate:MeasurementScale) {
			super(RelativeRegionEditor);
			this._template = vTemplate;
		}
		
		override public function newInstance():* {
			var ed:RelativeRegionEditor = super.newInstance();
			var tempData:Array = new Array();
			// Is this copying really needed?
			/*for each (var v:String in _template.allowedValues) { 
				tempData.push(v);
			}
			// Currently allowedRelations is fixed.
			ed.direction = BoxDirection.VERTICAL;
			ed.allowOtherRegions = _template.allowFreeValueInput;
			ed.allowedRegions = _template.allowedValues;*/		
			return ed;
		}
		
	}

}