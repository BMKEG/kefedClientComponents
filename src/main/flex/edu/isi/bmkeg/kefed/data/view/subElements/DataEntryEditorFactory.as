package edu.isi.bmkeg.kefed.data.view.subElements 
{
	import edu.isi.bmkeg.ooevv.model.scale.*;
	
	import mx.controls.TextInput;
	import mx.core.ClassFactory;

	public class DataEntryEditorFactory extends ClassFactory
	{
	
		private var _template:MeasurementScale;
				
		public function DataEntryEditorFactory(vTemplate:MeasurementScale) {
			super(TextInput);
			this._template = vTemplate;
		}
		
		override public function newInstance():* {
			var ed:TextInput = super.newInstance();
			ed.editable = true;
			// TODO: Add some validation for ranges and unit expressions
			return ed;
		}
		
	}

}