// $Id: HtmlCellRenderer.as 2057 2011-03-30 01:12:31Z tom $

package edu.isi.bmkeg.kefed.component.view.ui {
	import mx.controls.Text;
	import mx.events.FlexEvent;
	
	/** Cell renderer that will render HTML text instead of plain
	 *  text.  Extension of the standard Text component to set the
	 *  htmlText field instead of text field when the data is changed.
	 * 
	 *  Thanks to ActionScript Forum post by nirth
	 *  http://www.actionscript.org/forums/archive/index.php3/t-107897.html
	 *
	 * @date $Date: 2011-03-29 18:12:31 -0700 (Tue, 29 Mar 2011) $
	 * @version $Revision: 2057 $
	 */	
	public class HtmlCellRenderer extends Text {
		
		public function HtmlCellRenderer() {
			super();
		}

		private var _data:Object;

		[Bindable("dataChange")]
		[Inspectable(environment="none")]
		override public function get data():Object {
			return _data;
		}
		
		override public function set data(value:Object):void {
			_data = value;
		
			if (listData) {
				htmlText = listData.label;
			} else if (_data != null) {
				if (_data is String) {
					htmlText = String(_data);
				} else {
					htmlText = _data.toString();
				}
			}	
			dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
		}		
	}
}