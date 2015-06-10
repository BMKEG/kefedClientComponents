// $Id$
//
//  $Date$
//  $Revision$
//
package edu.isi.bmkeg.kefed.editor.ui
{
	import edu.isi.bmkeg.kefed.editor.elements.KefedBaseValueTemplate;
	
	import mx.controls.CheckBox;
	import mx.controls.ComboBox;
	import mx.controls.TextInput;
	import mx.core.ClassFactory;

	public class DataEntryCheckBoxFactory extends ClassFactory
	{
	
		private var _template:KefedBaseValueTemplate;
				
		public function DataEntryCheckBoxFactory(vTemplate:KefedBaseValueTemplate) {
			super(CheckBox);
			this._template = vTemplate;
		}
		
		override public function newInstance():* {
			var ed:CheckBox = super.newInstance();
			return ed;
		}
		
	}

}