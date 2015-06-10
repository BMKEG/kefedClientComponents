// $Id: DataEntryEditorFactory.as 1180 2010-09-22 17:19:40Z tom $
//
//  $Date: 2010-09-22 10:19:40 -0700 (Wed, 22 Sep 2010) $
//  $Revision: 1180 $
//
package edu.isi.bmkeg.kefed.component.view.ui
{
	import edu.isi.bmkeg.kefed.component.view.elements.KefedBaseValueTemplate;
	
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