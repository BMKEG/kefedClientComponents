package edu.isi.bmkeg.kefed.component.view.store.events
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class TriggerRetrieveKefedModelEvent extends Event
	{
		public static const TRIGGER_RETRIEVE_KEFED_MODELS:String = "triggerRetrieveKefedModels";

		public var uid:String;

		// Constructor
		public function TriggerRetrieveKefedModelEvent(uid:String, 
													   bubbles:Boolean=false, 
													   cancelable:Boolean=false)
		{
			super(TRIGGER_RETRIEVE_KEFED_MODELS, bubbles, cancelable);
			this.uid = uid;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new TriggerRetrieveKefedModelEvent(uid, bubbles, cancelable);
		}

	}

}