package edu.isi.bmkeg.kefed.component.view.store.events
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class TriggerRetrieveKefedDataEvent extends Event
	{
		public static const TRIGGER_RETRIEVE_KEFED_DATA:String = "triggerRetrieveKefedData";

		public var uid:String;

		// Constructor
		public function TriggerRetrieveKefedDataEvent(uid:String, 
													  bubbles:Boolean=false, 
													  cancelable:Boolean=false)
		{
			super(TRIGGER_RETRIEVE_KEFED_DATA, bubbles, cancelable);
			this.uid = uid;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new TriggerRetrieveKefedDataEvent(uid, bubbles, cancelable);
		}

	}

}