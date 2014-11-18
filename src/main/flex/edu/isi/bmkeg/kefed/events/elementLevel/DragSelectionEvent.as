package edu.isi.bmkeg.kefed.events.elementLevel
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class DragSelectionEvent extends Event
	{
		public static const DRAG_SELECTION:String = "dragSelection";

		public var uid:String;
		public var newX:int;
		public var newY:int;
		public var refUid:String;
		public var refX:int;
		public var refY:int;

		// Constructor
		public function DragSelectionEvent(uid:String, newX:int, newY:int,
										   refUid:String, refX:int, refY:int)
		{
			super(DRAG_SELECTION);
			this.uid = uid;
			this.newX = newX;
			this.newY = newY;
			this.refUid = refUid;
			this.refX = refX;
			this.refY = refY;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new DragSelectionEvent(uid, newX, newY, refUid, refX, refY);
		}

	}

}