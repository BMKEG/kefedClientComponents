package edu.isi.bmkeg.kefed.events
{
	import edu.isi.bmkeg.ftd.model.*;
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.rpc.events.FaultEvent;
	
	public class SaveCompleteKefedModelResultEvent extends Event 
	{
		
		public static const SAVE_COMPLETE_KEFED_MODEL_RESULT:String = "saveCompleteKefedModelResult";
		
		public var success:Boolean;
			
		public function SaveCompleteKefedModelResultEvent(success:Boolean,
										 bubbles:Boolean=false, 
										 cancelable:Boolean=false )
		{
			this.success = success;
			super(SAVE_COMPLETE_KEFED_MODEL_RESULT, bubbles, cancelable);
		}
		
		override public function clone() : Event
		{
			return new SaveCompleteKefedModelResultEvent(success, bubbles, cancelable);
		}
		
	}
	
}
