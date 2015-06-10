package edu.isi.bmkeg.kefed.events
{
	import edu.isi.bmkeg.kefed.model.design.*;
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.rpc.events.FaultEvent;
	
	public class RetrieveCompleteKefedModelResultEvent extends Event 
	{
		
		public static const RETRIEVE_COMPLETE_KEFED_MODEL_RESULT:String = 
			"retrieveCompleteKefedModelResult";
		
		public var kefedModel:KefedModel;
			
		public function RetrieveCompleteKefedModelResultEvent(kefedModel:KefedModel,
										 bubbles:Boolean=false, 
										 cancelable:Boolean=false )
		{
			this.kefedModel = kefedModel;
			super(RETRIEVE_COMPLETE_KEFED_MODEL_RESULT, bubbles, cancelable);
		}
		
		override public function clone() : Event
		{
			return new RetrieveCompleteKefedModelResultEvent(kefedModel, bubbles, cancelable);
		}
		
	}
	
}
