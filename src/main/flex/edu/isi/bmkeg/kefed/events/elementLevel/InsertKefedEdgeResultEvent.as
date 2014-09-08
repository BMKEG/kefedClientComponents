package edu.isi.bmkeg.kefed.events.elementLevel
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class InsertKefedEdgeResultEvent extends Event
	{
		public static const INSERT_KEFED_EDGE_RESULT:String = "insertKefedEdgeResult";

		public var success:Boolean;

		// Constructor
		public function InsertKefedEdgeResultEvent(success:Boolean, 
											 bubbles:Boolean=false, 
											 cancelable:Boolean=false)
		{
			super(INSERT_KEFED_EDGE_RESULT, bubbles, cancelable);
			this.success = success;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new InsertKefedEdgeResultEvent(success, bubbles, cancelable);
		}

	}

}