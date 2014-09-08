package edu.isi.bmkeg.kefed.events
{
	import edu.isi.bmkeg.kefed.model.design.*;
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.rpc.events.FaultEvent;
	
	public class RetrieveKefedModelTreeResultEvent extends Event 
	{
		
		public static const RETRIEVE_KEFED_MODEL_TREE_RESULT:String = 
			"retrieveKefedModelTreeResult";
		
		public var kefedModelTree:XML;
			
		public function RetrieveKefedModelTreeResultEvent(kefedModelTree:XML,
										 bubbles:Boolean=false, 
										 cancelable:Boolean=false )
		{
			this.kefedModelTree = kefedModelTree;
			super(RETRIEVE_KEFED_MODEL_TREE_RESULT, bubbles, cancelable);
		}
		
		override public function clone() : Event
		{
			return new RetrieveKefedModelTreeResultEvent(kefedModelTree, bubbles, cancelable);
		}
		
	}
	
}
