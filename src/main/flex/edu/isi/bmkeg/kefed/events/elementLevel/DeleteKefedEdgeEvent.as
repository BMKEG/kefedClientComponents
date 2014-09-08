package edu.isi.bmkeg.kefed.events.elementLevel
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class DeleteKefedEdgeEvent extends Event
	{
		public static const DELETE_KEFED_EDGE:String = "removeKefedEdge";

		public var edgeUId:String;
		public var xml:XML;

		// Constructor
		public function DeleteKefedEdgeEvent(edgeUId:String, 
											 xml:XML, 
											 bubbles:Boolean=false,
											 cancelable:Boolean=false)
		{
			super(DELETE_KEFED_EDGE);
			this.edgeUId = edgeUId;
			this.xml = xml;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new DeleteKefedEdgeEvent(edgeUId, xml, bubbles, cancelable);
		}

	}

}