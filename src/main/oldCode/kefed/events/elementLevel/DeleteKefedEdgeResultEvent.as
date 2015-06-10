package edu.isi.bmkeg.kefed.events.elementLevel
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class DeleteKefedEdgeResultEvent extends Event
	{
		public static const DELETE_KEFED_EDGE_RESULT:String = "deleteKefedEdgeResult";

		public var success:Boolean;

		// Constructor
		public function DeleteKefedEdgeResultEvent(success:Boolean, 
											 bubbles:Boolean=false, 
											 cancelable:Boolean=false)
		{
			super(DELETE_KEFED_EDGE_RESULT, bubbles, cancelable);
			this.success = success;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new DeleteKefedEdgeResultEvent(success, bubbles, cancelable);
		}

	}

}