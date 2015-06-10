package edu.isi.bmkeg.kefed.component.view.store.events
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import edu.isi.bmkeg.kefed.component.view.elements.KefedModel;
	
	public class TriggerSaveKefedDataEvent extends Event
	{
		public static const TRIGGER_SAVE_KEFED_DATA:String = "triggerSaveKefedData";

		public var data:KefedModel;

		// Constructor
		public function TriggerSaveKefedDataEvent(data:KefedModel, 
												  bubbles:Boolean=false, 
												  cancelable:Boolean=false)
		{
			super(TRIGGER_SAVE_KEFED_DATA, bubbles, cancelable);
			this.data = data;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new TriggerSaveKefedDataEvent(data, bubbles, cancelable);
		}

	}

}