package edu.isi.bmkeg.kefed.component.view.store.events
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import edu.isi.bmkeg.kefed.component.view.elements.KefedModel;
	
	public class TriggerSaveKefedModelEvent extends Event
	{
		public static const TRIGGER_SAVE_KEFED_MODEL:String = "triggerSaveKefedModels";

		public var model:KefedModel;

		// Constructor
		public function TriggerSaveKefedModelEvent(model:KefedModel, 
												   bubbles:Boolean=false, 
												   cancelable:Boolean=false)
		{
			super(TRIGGER_SAVE_KEFED_MODEL, bubbles, cancelable);
			this.model = model;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new TriggerSaveKefedModelEvent(model, bubbles, cancelable);
		}

	}

}