package edu.isi.bmkeg.kefed.events.modelLevel
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class ListKefedModelsEvent extends Event
	{
		public static const LIST_KEFED_MODELS:String = "listKefedModels";

		public var startIndex:int;
		public var pageSize:int;
		public var queryString:String;

		// Constructor
		public function ListKefedModelsEvent(startIndex:int, pageSize:int, queryString:String)
		{
			super(LIST_KEFED_MODELS);
			this.startIndex = startIndex;
			this.pageSize = pageSize;
			this.queryString = queryString;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new ListKefedModelsEvent(startIndex, pageSize, queryString);
		}

	}

}