// $Id: DataEntryComboFactory.as 2500 2011-06-17 00:00:05Z tom $
//
//  $Date: 2011-06-16 17:00:05 -0700 (Thu, 16 Jun 2011) $
//  $Revision: 2500 $
//
package edu.isi.bmkeg.kefed.component.view.ui
{
	import edu.isi.bmkeg.kefed.component.view.elements.KefedBaseValueTemplate;
	import edu.isi.bmkeg.utils.NullList;
	
	import mx.controls.ComboBox;
	import mx.controls.Label;
	import mx.controls.List;
	import mx.core.ClassFactory;

	public class DataEntryComboFactory extends ClassFactory	{
	
		private var _template:KefedBaseValueTemplate;
				
		public function DataEntryComboFactory(vTemplate:KefedBaseValueTemplate) {
			super(DataGridComboBox);
			this._template = vTemplate;
		}
		
		override public function newInstance():* {
			var cb:ComboBox = super.newInstance();
			cb.dropdownFactory = new ClassFactory(NullList);
			var tempData:Array = new Array();
			
			tempData.push(null); // Allow no answer!
			// TODO: Note that at least for editable combo boxes,
			//  the null value gets replaced by "" if it is ever
			//  selected in the editing box.  ;-(
			for each (var v:String in _template.allowedValues) { 
				tempData.push(v);
			}
			cb.height = 20;
			cb.editable = _template.allowFreeValueInput;
			cb.dataProvider = tempData;
			cb.itemRenderer = new ClassFactory(Label);
			return cb;
		}
		
	}

}