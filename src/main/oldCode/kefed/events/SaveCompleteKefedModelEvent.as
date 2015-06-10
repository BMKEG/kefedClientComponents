package edu.isi.bmkeg.kefed.events
{
	import edu.isi.bmkeg.kefed.model.design.*;
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.rpc.events.FaultEvent;
	
	public class SaveCompleteKefedModelEvent extends Event 
	{
		
		public static const SAVE_COMPLETE_KEFED_MODEL:String = "saveCompleteKefedModel";
		
		public var kefedModel:KefedModel;
			
		public function SaveCompleteKefedModelEvent(kefedModel:KefedModel,
										 bubbles:Boolean=false, 
										 cancelable:Boolean=false )
		{
			this.kefedModel = kefedModel;
			super(SAVE_COMPLETE_KEFED_MODEL, bubbles, cancelable);
		}
		
		override public function clone() : Event
		{
			return new SaveCompleteKefedModelEvent(kefedModel, bubbles, cancelable);
		}
		
	}
	
}
