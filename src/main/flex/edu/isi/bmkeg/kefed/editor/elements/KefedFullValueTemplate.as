// $Id$
//
//  $Date$
//  $Revision$
//

package edu.isi.bmkeg.kefed.editor.elements
{
	import mx.collections.ArrayCollection;
	import mx.utils.UIDUtil;
	
	/**  Template for describing the constraints and descriptions for
	 *   a Kefed variable's value.  This extends the base value template
	 *   to also allow for multiple-slot composite values.
	 * 
	 * @author University of Southern California
	 * @date $Date$
	 * @version $Revision$
	 * 
	 */	
	public class KefedFullValueTemplate extends KefedBaseValueTemplate
	{
		/** Collection of KefedFieldTemplate objects that form
		 *  the slots of this multiple-slot object.  May be empty.
		 */
		[Bindable]
		public var multipleSlotFields:ArrayCollection;
		public var uid:String = UIDUtil.createUID();

		
		public function KefedFullValueTemplate()
		{
			super();
			multipleSlotFields = new ArrayCollection();
		}
		
		
		 /** Gets the field with the supplied name, or null if no
		 *   such field is present.
		 * 
		 * @param name The name to search for
		 * @return The KefedFieldTemplate for the matching slot or null
		 */
		 public function getFieldTemplate (name:String):KefedFieldTemplate {
		 	for each (var f:KefedFieldTemplate in this.multipleSlotFields) {
				if (f.nameValue == name) {
					return f;
				}
			}
			return null;
		 }
		 
		 /** Update the UID of this object, and recursively update the
		 *   UID of any fields.
		 */
		 public function updateUID():void {
		 	uid = UIDUtil.createUID();
		 	for each (var f:KefedFieldTemplate in this.multipleSlotFields) {
		 		f.updateUID();
		 	}
		 }
		
	}
}