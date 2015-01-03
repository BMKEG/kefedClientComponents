// $Id: KefedObject.as 2057 2011-03-30 01:12:31Z tom $
//
//  $Date: 2011-03-29 18:12:31 -0700 (Tue, 29 Mar 2011) $
//  $Revision: 2057 $
//
package edu.isi.bmkeg.kefed.model.flare
{
	import edu.isi.bmkeg.kefed.diagram.view.DiagramMappings;
	
	import flare.vis.data.NodeSprite;
	
	import mx.collections.ArrayCollection;
	import mx.utils.UIDUtil;
				
	/**  General KefedObject for representing Kefed model elements.
	 * 
	 * @author University of Southern California
	 * @date $Date: 2011-03-29 18:12:31 -0700 (Tue, 29 Mar 2011) $
	 * @version $Revision: 2057 $
	 * 
	 *   NOTE: There is a need to also update 
	 *   KefedPersevereInterface.deserializeKefedObject
	 *   for structural changes here.
	 * 
	 */

	public class FlareNode extends NodeSprite
	{
		
		[Bindable]
		public var type:String;

		[Bindable]
		public var pos:Number;

		[Bindable]
		public var spriteid:String;

		[Bindable]
		public var valueDomain:String;

		[Bindable]
		public var did:String;

		private var _nameValue:String
		[Bindable]
		public function get nameValue ():String {
			return _nameValue;
		}

		public function set nameValue (newName:String):void {
			_nameValue = newName;
		}
		
		private var _ontologyIds:ArrayCollection = new ArrayCollection();
		[Bindable]
		public function get ontologyIds ():ArrayCollection {
			return _ontologyIds;
		}

		public function set ontologyIds (newIds:ArrayCollection):void {
			_ontologyIds = newIds;
		}
		
		private var _notes:String
		[Bindable]
		public function get notes ():String {
			return _notes;
		}

		public function set notes (newNotes:String):void {
			_notes = newNotes;
		}
		
		//[Bindable]
		//public var valueType:KefedFullValueTemplate;	
		
		[Bindable]
		public var uid:String;
		
		[Bindable]
		public var compositions:Number;

		[Bindable]
		public var master:String;
		
		[Bindable]
		public var oldDataTable:ArrayCollection;

		public var xx:Number;
		public var yy:Number;
		public var ww:Number;
		public var hh:Number;
		public var xLabel:Number;
		public var yLabel:Number;
		
		public function FlareNode()
		{
            oldDataTable = new ArrayCollection();  // Moved down into valueType object.
            ontologyIds = new ArrayCollection();
            //valueType = new KefedFullValueTemplate();
			super();
		}
		
		/** Tests whether this object represents a variable in KEfED.
		 * 
		 * @return True if this is a variable
		 *
		public function isVariable():Boolean {
			return isParameter() || isConstant() || isMeasurement();
		}*/
		
		/** Tests whether this object represents a region variable in KEfED.
		 * 
		 * @return True if this is a region variable
		 *
		public function isRegionVariable():Boolean {
			return isVariable() && valueType.valueTypeName == "Region";
		}*/
		
		/** Tests whether this object represents a table variable in KEfED.
		 * 
		 * @return True if this is a table variable.
		 *
		public function isTableVariable():Boolean {
			 return isVariable() && valueType.valueTypeName == "Table";
		}*/

		/** Tests whether this object represents a fork icon.
		 * 
		 * @return True if this is a parameter variable
		 */
		public function isFork():Boolean {
			return spriteid == DiagramMappings.FORK_SPRITE_ID;
		}

		
		/** Tests whether this object represents a branch icon.
		 * 
		 * @return True if this is a parameter variable
		 */
		public function isBranch():Boolean {
			return spriteid == DiagramMappings.BRANCH_SPRITE_ID;
		}
		
		/** Tests whether this object represents a parameter icon.
		 * 
		 * @return True if this is a parameter variable
		 */
		public function isParameter():Boolean {
			return spriteid == DiagramMappings.PARAMETER_SPRITE_ID;
		}
		
		/** Tests whether this object represents a constant icon.
		 * 
		 * @return True if this is a constant variable
		 */
		public function isConstant():Boolean {
			return spriteid == DiagramMappings.CONSTANT_SPRITE_ID;
		}
		
		/** Tests whether this object represents a measurement icon.
		 * 
		 * @return True if this is a measurement variable
		 */
		 public function isMeasurement():Boolean {
			return spriteid == DiagramMappings.MEASUREMENT_SPRITE_ID;
		}
		
		/** Tests whether this object represents an activity icon.
		 * 
		 * @return True if this is an activity node
		 */
		 public function isActivity():Boolean {
		 	return spriteid == DiagramMappings.ACTIVITY_SPRITE_ID;
		 }
		
		/** Tests whether this object represents an entity icon.
		 * 
		 * @return True if this is an entity node
		 */		
		 public function isEntity():Boolean {
		 	return spriteid == DiagramMappings.ENTITY_SPRITE_ID;
		 }
		 				 
		 /** Update the UID of this object, and recursively update the
		 *   UID of the value type.
		 * 
		 * @return the old UID value
		 */
		 public function updateUID():String {
		 	var oldUID:String = uid;
		 	uid = UIDUtil.createUID();
		 	//valueType.updateUID();
		 	return oldUID;
		 }
	}
	
}