// $Id$
//
//  $Date$
//  $Revision$
//
package edu.isi.bmkeg.kefed.editor.ui
{
	import edu.isi.bmkeg.kefed.editor.elements.KefedBaseValueTemplate;
	
	import mx.controls.TextArea;
	import mx.core.ClassFactory;

	public class DataEntryLongEditorFactory extends ClassFactory
	{
	
		private var _template:KefedBaseValueTemplate;
				
		public function DataEntryLongEditorFactory(vTemplate:KefedBaseValueTemplate) {
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