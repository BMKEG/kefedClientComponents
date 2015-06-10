// $Id: DataEntryLongEditorFactory.as 1482 2010-12-15 02:02:49Z tom $
//
//  $Date: 2010-12-14 18:02:49 -0800 (Tue, 14 Dec 2010) $
//  $Revision: 1482 $
//
package edu.isi.bmkeg.kefed.component.view.ui
{
	import edu.isi.bmkeg.kefed.component.view.elements.KefedBaseValueTemplate;
	
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