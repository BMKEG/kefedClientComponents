package edu.isi.bmkeg.kefed.events.elementLevel
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class SelectKefedEdgeEvent extends Event
	{
		public static const SELECT_KEFED_EDGE:String = "selectKefedEdge";

		public var sourceUid:String;
		public var targetUid:String;

		// Constructor
		public function SelectKefedEdgeEvent(sourceUid:String, targetUid:String)
		{
			super(SELECT_KEFED_EDGE);
			this.sourceUid = sourceUid;
			this.targetUid = targetUid;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new SelectKefedEdgeEvent(sourceUid, targetUid);
		}

	}

}