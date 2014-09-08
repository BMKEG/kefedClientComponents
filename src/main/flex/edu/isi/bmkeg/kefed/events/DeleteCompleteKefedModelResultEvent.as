package edu.isi.bmkeg.kefed.events
{
	import edu.isi.bmkeg.kefed.model.design.*;
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.rpc.events.FaultEvent;
	
	public class DeleteCompleteKefedModelResultEvent extends Event 
	{
		
		public static const DELETE_COMPLETE_KEFED_MODEL_RESULT:String = 
			"deleteCompleteKefedModelResult";
		
		public var complete:Boolean;
			
		public function DeleteCompleteKefedModelResultEvent(complete:Boolean,
										 bubbles:Boolean=false, 
										 cancelable:Boolean=false )
		{
			this.complete = complete;
			super(DELETE_COMPLETE_KEFED_MODEL_RESULT, bubbles, cancelable);
		}
		
		override public function clone() : Event
		{
			return new DeleteCompleteKefedModelResultEvent(complete, bubbles, cancelable);
		}
		
	}
	
}
