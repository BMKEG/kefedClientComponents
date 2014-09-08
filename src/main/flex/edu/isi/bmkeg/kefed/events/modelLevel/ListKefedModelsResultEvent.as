package edu.isi.bmkeg.kefed.events.modelLevel
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class ListKefedModelsResultEvent extends Event
	{
		public static const LIST_KEFED_MODELS_RESULT:String = "listKefedModelsResult";

		public var result:ArrayCollection;

		// Constructor
		public function ListKefedModelsResultEvent(result:ArrayCollection)
		{
			super(LIST_KEFED_MODELS_RESULT);
			this.result = result;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new ListKefedModelsResultEvent(result);
		}

	}

}