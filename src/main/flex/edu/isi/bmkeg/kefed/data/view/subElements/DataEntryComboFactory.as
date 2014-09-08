package edu.isi.bmkeg.kefed.data.view.subElements
{
	import edu.isi.bmkeg.ooevv.model.scale.*;
	
	import mx.controls.ComboBox;
	import mx.controls.Label;
	import mx.core.ClassFactory;

	public class DataEntryComboFactory extends ClassFactory	{
	
		private var _template:MeasurementScale;
				
		public function DataEntryComboFactory(vTemplate:MeasurementScale) {
			super(DataGridComboBox);
			this._template = vTemplate;
		}
		
		override public function newInstance():* {
			var cb:ComboBox = super.newInstance();
			var tempData:Array = new Array();

			// Is this copying really needed?
			//
			// TODO: Fill this in.
			//
			/*for each (var v:String in _template.allowedValues) { 
				tempData.push(v);
			}
			cb.height = 20;
			cb.editable = _template.allowFreeValueInput;*/
			
			cb.dataProvider = tempData;
			cb.itemRenderer = new ClassFactory(Label);
			return cb;
		}
		
	}

}