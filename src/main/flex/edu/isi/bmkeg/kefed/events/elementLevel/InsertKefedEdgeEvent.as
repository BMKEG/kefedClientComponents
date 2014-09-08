package edu.isi.bmkeg.kefed.events.elementLevel
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class InsertKefedEdgeEvent extends Event
	{
		public static const INSERT_KEFED_EDGE:String = "insertKefedEdge";

		public var sourceUid:String;
		public var targetUid:String;
		public var edgeUid:String;
		public var xml:XML;
		

		// Constructor
		public function InsertKefedEdgeEvent(sourceUid:String, 
											 targetUid:String, 
											 edgeUid:String,
											 xml:XML, 
											 bubbles:Boolean=false, 
											 cancelable:Boolean=false)
		{
			super(INSERT_KEFED_EDGE, bubbles, cancelable);
			this.sourceUid = sourceUid;
			this.targetUid = targetUid;
			this.edgeUid = edgeUid;
			this.xml = xml;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new InsertKefedEdgeEvent(sourceUid, targetUid, edgeUid,
					xml, bubbles, cancelable);
		}

	}

}