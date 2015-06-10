package edu.isi.bmkeg.kefed.events
{
	import edu.isi.bmkeg.kefed.model.design.*;
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.rpc.events.FaultEvent;
	
	public class DeleteCompleteKefedModelFromUidEvent extends Event 
	{
		
		public static const DELETE_COMPLETE_KEFED_MODEL_FROM_UID:String = 
				"deleteCompleteKefedModelFromUid";
		
		public var uid:String;
			
		public function DeleteCompleteKefedModelFromUidEvent(uid:String,
										 bubbles:Boolean=false, 
										 cancelable:Boolean=false )
		{
			this.uid = uid;
			super(DELETE_COMPLETE_KEFED_MODEL_FROM_UID, bubbles, cancelable);
		}
		
		override public function clone() : Event
		{
			return new DeleteCompleteKefedModelFromUidEvent(uid, bubbles, cancelable);
		}
		
	}
	
}
