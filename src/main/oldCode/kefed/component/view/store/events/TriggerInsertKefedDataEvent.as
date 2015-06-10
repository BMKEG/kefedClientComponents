package edu.isi.bmkeg.kefed.component.view.store.events
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import edu.isi.bmkeg.kefed.component.view.elements.KefedExperiment;
	
	public class TriggerInsertKefedDataEvent extends Event
	{
		public static const TRIGGER_INSERT_KEFED_DATA:String = "triggerInsertKefedData";

		public var data:KefedExperiment;

		// Constructor
		public function TriggerInsertKefedDataEvent(data:KefedExperiment, 
													bubbles:Boolean=false, 
													cancelable:Boolean=false)
		{
			super(TRIGGER_INSERT_KEFED_DATA, bubbles, cancelable);
			this.data = data;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new TriggerInsertKefedDataEvent(data, bubbles, cancelable);
		}

	}

}