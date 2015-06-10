// $Id$
//
//  $Date$
//  $Revision$
//
package edu.isi.bmkeg.kefed.editor.ui
{
	import edu.isi.bmkeg.kefed.editor.elements.KefedBaseValueTemplate;
	
	import mx.containers.BoxDirection;
	import mx.core.ClassFactory;

	public class DataEntryRelativeRegionFactory extends ClassFactory	{
	
		private var _template:KefedBaseValueTemplate;
				
		public function DataEntryRelativeRegionFactory(vTemplate:KefedBaseValueTemplate) {
			super(RelativeRegionEditor);
			this._template = vTemplate;
		}
		
		override public function newInstance():* {
			var ed:RelativeRegionEditor = super.newInstance();
			var tempData:Array = new Array();
			// Is this copying really needed?
			for each (var v:String in _template.allowedValues) { 
				tempData.push(v);
			}
			// Currently allowedRelations is fixed.
			ed.direction = BoxDirection.VERTICAL;
			ed.allowOtherRegions = _template.allowFreeValueInput;
			ed.allowedRegions = _template.allowedValues;		
			return ed;
		}
		
	}

}