// $Id: KefedFieldTemplate.as 1524 2011-01-04 01:05:27Z tom $
//
//  $Date: 2011-01-03 17:05:27 -0800 (Mon, 03 Jan 2011) $
//  $Revision: 1524 $
//

package edu.isi.bmkeg.kefed.component.view.elements
{
	import mx.collections.ArrayCollection;
	import mx.utils.UIDUtil;
	
	/**  Description of a field element for a multi-slot Kefed Variable
	 *   Value.
	 * 
	 * @author University of Southern California
	 * @date $Date: 2011-01-03 17:05:27 -0800 (Mon, 03 Jan 2011) $
	 * @version $Revision: 1524 $
	 * 
	 *   NOTE: There is a need to also update 
	 *   KefedPersevereInterface.deserializeKefedObject
	 *   for structural changes here.
	 * 
	 */
	[Bindable]
	public class KefedFieldTemplate implements IKefedNamedObject, IKefedAnnotatedObject
	{
		private var _nameValue:String;
		private var _ontologyIds:ArrayCollection = new ArrayCollection();
		private var _notes:String;

		public var uid:String = UIDUtil.createUID();
		public var valueType:KefedBaseValueTemplate = new KefedBaseValueTemplate();
		
		public function get nameValue ():String {
			return _nameValue;
		}

		public function set nameValue (newName:String):void {
			_nameValue = newName;
		}
		
		public function get ontologyIds ():ArrayCollection {
			return _ontologyIds;
		}

		public function set ontologyIds (newIds:ArrayCollection):void {
			_ontologyIds = newIds;
		}
		
		public function get notes ():String {
			return _notes;
		}

		public function set notes (newNotes:String):void {
			_notes = newNotes;
		}		
				 
		/** Update the UID of this object, and recursively update the
		 *   UID of any fields.
		 */
		 public function updateUID():void {
		 	uid = UIDUtil.createUID();
		 }

	}
}