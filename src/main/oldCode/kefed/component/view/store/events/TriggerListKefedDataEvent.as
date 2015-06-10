package edu.isi.bmkeg.kefed.component.view.store.events
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class TriggerListKefedDataEvent extends Event
	{
		public static const TRIGGER_LIST_KEFED_DATA:String = "triggerListKefedData";

		public var startIndex:int;
		public var pageSize:int;
		public var queryString:String;

		// Constructor
		public function TriggerListKefedDataEvent(startIndex:int, pageSize:int, queryString:String, 
												  bubbles:Boolean=false, 
												  cancelable:Boolean=false)
		{
			super(TRIGGER_LIST_KEFED_DATA, bubbles, cancelable);
			this.startIndex = startIndex;
			this.pageSize = pageSize;
			this.queryString = queryString;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new TriggerListKefedDataEvent(startIndex, pageSize, queryString, bubbles, cancelable);
		}

	}

}