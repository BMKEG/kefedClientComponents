package edu.isi.bmkeg.kefed.data.view.subElements
{
	import edu.isi.bmkeg.ooevv.model.scale.*;
	
	import mx.controls.CheckBox;
	import mx.controls.ComboBox;
	import mx.controls.TextInput;
	import mx.core.ClassFactory;

	public class DataEntryCheckBoxFactory extends ClassFactory
	{
	
		private var _template:MeasurementScale;
				
		public function DataEntryCheckBoxFactory(vTemplate:MeasurementScale) {
			super(CheckBox);
			this._template = vTemplate;
		}
		
		override public function newInstance():* {
			var ed:CheckBox = super.newInstance();
			return ed;
		}
		
	}

}