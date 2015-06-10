package edu.isi.bmkeg.kefed.events.elementLevel
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class DeleteKefedEdgesEvent extends Event
	{
		public static const DELETE_KEFED_EDGE:String = "removeKefedEdge";

		public var uids:ArrayCollection = new ArrayCollection();

		// Constructor
		public function DeleteKefedEdgesEvent(uids:ArrayCollection, 
											 bubbles:Boolean=false,
											 cancelable:Boolean=false)
		{
			super(DELETE_KEFED_EDGE);
			this.uids = uids;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new DeleteKefedEdgesEvent(uids, bubbles, cancelable);
		}

	}

}