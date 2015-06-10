// $Id: NullList.as 2500 2011-06-17 00:00:05Z tom $
package edu.isi.bmkeg.utils {
	import mx.controls.List;
	
	/**  NullList class developed by Hrundik on stackoverflow as described in
	 *   http://stackoverflow.com/questions/949180/null-in-flex-combobox 
	 * 
	 *   Used to provide a List drop-down box that allows the selection of null
	 *   as a value in the list.  Usage like
	 *   <pre>
	 *     &lt;mx:ComboBox id="cb" 
	 *         dataProvider="{[null, 'foo', 'bar']}"
	 *         dropdownFactory="{new ClassFactory(NullList)}" /&gt;
	 *   </pre>
	 * 
	 * @author Hrundik
	 * @date June 4, 2009
	 * @version $Revision: 2500 $
	 */
	public class NullList extends List
	{
		public function NullList() {
			super();
		}
		
		override public function isItemSelectable(data:Object):Boolean {
			if (!selectable)
				return false;
			return true;
		}
	}
}