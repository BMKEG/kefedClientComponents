package edu.isi.bmkeg.kefed.component.view.store.events
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class TriggerListKefedModelsEvent extends Event
	{
		public static const TRIGGER_LIST_KEFED_MODELS:String = "triggerListKefedModels";

		public var startIndex:int;
		public var pageSize:int;
		public var queryString:String;

		// Constructor
		public function TriggerListKefedModelsEvent(startIndex:int, pageSize:int, queryString:String, 
													bubbles:Boolean=false, 
													cancelable:Boolean=false)
		{
			super(TRIGGER_LIST_KEFED_MODELS, bubbles, cancelable);
			this.startIndex = startIndex;
			this.pageSize = pageSize;
			this.queryString = queryString;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new TriggerListKefedModelsEvent(startIndex, pageSize, queryString, bubbles, cancelable);
		}

	}

}