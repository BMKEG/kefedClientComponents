package edu.isi.bmkeg.kefed.events
{
	import edu.isi.bmkeg.kefed.model.design.*;
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.rpc.events.FaultEvent;
	
	public class RetrieveCompleteKefedModelFromUuidEvent extends Event 
	{
		
		public static const RETRIEVE_COMPLETE_KEFED_MODEL_FROM_UUID:String = "retrieveCompleteKefedModelFromUuid";
		
		public var uuid:String;
			
		public function RetrieveCompleteKefedModelFromUuidEvent(uuid:String,
										 bubbles:Boolean=false, 
										 cancelable:Boolean=false )
		{
			this.uuid = uuid;
			super(RetrieveCompleteKefedModelFromUuidEvent.RETRIEVE_COMPLETE_KEFED_MODEL_FROM_UUID, bubbles, cancelable);
		}
		
		override public function clone() : Event
		{
			return new RetrieveCompleteKefedModelFromUuidEvent(uuid, bubbles, cancelable);
		}
		
	}
	
}
