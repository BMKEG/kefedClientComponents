package edu.isi.bmkeg.kefed.events
{
	import edu.isi.bmkeg.kefed.model.design.*;
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.rpc.events.FaultEvent;
	
	public class DeleteCompleteKefedModelEvent extends Event 
	{
		
		public static const DELETE_COMPLETE_KEFED_MODEL:String = "deleteCompleteKefedModel";
		
		public var id:Number;
			
		public function DeleteCompleteKefedModelEvent(id:Number,
										 bubbles:Boolean=false, 
										 cancelable:Boolean=false )
		{
			this.id = id;
			super(DELETE_COMPLETE_KEFED_MODEL, bubbles, cancelable);
		}
		
		override public function clone() : Event
		{
			return new DeleteCompleteKefedModelEvent(id, bubbles, cancelable);
		}
		
	}
	
}
