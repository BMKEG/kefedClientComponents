package edu.isi.bmkeg.kefed.data.view.subElements
{
	import edu.isi.bmkeg.ooevv.model.scale.*;
	
	import mx.controls.TextArea;
	import mx.core.ClassFactory;

	public class DataEntryLongEditorFactory extends ClassFactory
	{
	
		private var _template:MeasurementScale;
				
		public function DataEntryLongEditorFactory(vTemplate:MeasurementScale) {
			super(TextArea);
			this._template = vTemplate;
		}
		
		override public function newInstance():* {
			var ed:TextArea = super.newInstance();
			ed.editable = true;
			// TODO: Add some validation for ranges and unit expressions
			return ed;
		}
		
	}

}