package edu.isi.bmkeg.kefed.events
{
	import edu.isi.bmkeg.kefed.model.design.*;
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.rpc.events.FaultEvent;
	
	public class RetrieveKefedModelTreeEvent extends Event 
	{
		
		public static const RETRIEVE_KEFED_MODEL_TREE:String = "retrieveKefedModelTree";
			
		public var acId:Number;
		
		public function RetrieveKefedModelTreeEvent(acId:Number, 
													bubbles:Boolean=false, 
										 cancelable:Boolean=false )
		{
			this.acId = acId;
			super(RETRIEVE_KEFED_MODEL_TREE, bubbles, cancelable);
		}
		
		override public function clone() : Event
		{
			return new RetrieveKefedModelTreeEvent(acId, bubbles, cancelable);
		}
		
	}
	
}
