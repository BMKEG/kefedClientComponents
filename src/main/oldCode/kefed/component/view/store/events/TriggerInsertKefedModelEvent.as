package edu.isi.bmkeg.kefed.component.view.store.events
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import edu.isi.bmkeg.kefed.component.view.elements.KefedModel;
	
	public class TriggerInsertKefedModelEvent extends Event
	{
		public static const TRIGGER_INSERT_KEFED_MODEL:String = "triggerInsertKefedModels";

		public var model:KefedModel;

		// Constructor
		public function TriggerInsertKefedModelEvent(model:KefedModel, 
													 bubbles:Boolean=false, 
													 cancelable:Boolean=false)
		{
			super(TRIGGER_INSERT_KEFED_MODEL, bubbles, cancelable);
			this.model = model;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new TriggerInsertKefedModelEvent(model, bubbles, cancelable);
		}

	}

}