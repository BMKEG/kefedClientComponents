package edu.isi.bmkeg.kefed.editor.ui
{
	import edu.isi.bmkeg.kefed.editor.elements.KefedBaseValueTemplate;
	
	import mx.controls.TextInput;
	import mx.core.ClassFactory;

	public class DataEntryEditorFactory extends ClassFactory
	{
	
		private var _template:KefedBaseValueTemplate;
				
		public function DataEntryEditorFactory(vTemplate:KefedBaseValueTemplate) {
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