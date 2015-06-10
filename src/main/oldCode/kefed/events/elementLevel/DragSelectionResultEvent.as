package edu.isi.bmkeg.kefed.events.elementLevel
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class DragSelectionResultEvent extends Event
	{
		public static const DRAG_SELECTION_RESULT:String = "dragSelectionResult";

		public var success:Boolean;

		// Constructor
		public function DragSelectionResultEvent(success:Boolean)
		{
			super(DRAG_SELECTION_RESULT);
			this.success = success;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new DragSelectionResultEvent(success);
		}

	}

}