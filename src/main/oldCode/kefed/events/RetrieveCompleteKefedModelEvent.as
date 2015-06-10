package edu.isi.bmkeg.kefed.events
{
	import edu.isi.bmkeg.kefed.model.design.*;
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.rpc.events.FaultEvent;
	
	public class RetrieveCompleteKefedModelEvent extends Event 
	{
		
		public static const RETRIEVE_COMPLETE_KEFED_MODEL:String = "retrieveCompleteKefedModel";
		
		public var id:Number;
			
		public function RetrieveCompleteKefedModelEvent(id:Number,
										 bubbles:Boolean=false, 
										 cancelable:Boolean=false )
		{
			this.id = id;
			super(RETRIEVE_COMPLETE_KEFED_MODEL, bubbles, cancelable);
		}
		
		override public function clone() : Event
		{
			return new RetrieveCompleteKefedModelEvent(id, bubbles, cancelable);
		}
		
	}
	
}
