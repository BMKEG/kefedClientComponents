package edu.isi.bmkeg.kefed.component.view.store.events
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class TriggerDeleteKefedDataEvent extends Event
	{
		public static const TRIGGER_DELETE_KEFED_DATA:String = "triggerDeleteKefedData";

		public var uid:String;

		// Constructor
		public function TriggerDeleteKefedDataEvent(uid:String, 
													bubbles:Boolean=false, 
													cancelable:Boolean=false)
		{
			super(TRIGGER_DELETE_KEFED_DATA, bubbles, cancelable);
			this.uid = uid;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new TriggerDeleteKefedDataEvent(uid, bubbles, cancelable);
		}

	}

}