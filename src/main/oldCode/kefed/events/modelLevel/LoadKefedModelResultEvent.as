package edu.isi.bmkeg.kefed.events.modelLevel
{
	import edu.isi.bmkeg.kefed.model.design.KefedModel;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class LoadKefedModelResultEvent extends Event
	{
		public static const LOAD_KEFED_MODEL_RESULT:String = "loadKefedModelResult";

		public var result:KefedModel;

		// Constructor
		public function LoadKefedModelResultEvent(result:KefedModel)
		{
			super(LOAD_KEFED_MODEL_RESULT);
			this.result = result;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new LoadKefedModelResultEvent(result);
		}

	}

}