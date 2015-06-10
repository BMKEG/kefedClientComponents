package edu.isi.bmkeg.kefed.component.view.store.events
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class TriggerDeleteKefedModelEvent extends Event
	{
		public static const TRIGGER_DELETE_KEFED_MODELS:String = "triggerDeleteKefedModels";

		public var uid:String;

		// Constructor
		public function TriggerDeleteKefedModelEvent(uid:String, 
													 bubbles:Boolean=false, 
													 cancelable:Boolean=false)
		{
			super(TRIGGER_DELETE_KEFED_MODELS, bubbles, cancelable);
			this.uid = uid;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new TriggerDeleteKefedModelEvent(uid, bubbles, cancelable);
		}

	}

}