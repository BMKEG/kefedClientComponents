package edu.isi.bmkeg.kefed.events.modelLevel
{
	import edu.isi.bmkeg.kefed.model.design.KefedModel;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class InsertInstantiatedKefedModelResultEvent extends Event
	{
		public static const INSERT_INSTANTIATED_KEFED_MODEL_RESULT:String = "insertInstantiatedKefedModelResult";

		public var success:Boolean;

		// Constructor
		public function InsertInstantiatedKefedModelResultEvent(success:Boolean,
																bubbles:Boolean=false, 
																cancelable:Boolean=false)
		{
			super(INSERT_INSTANTIATED_KEFED_MODEL_RESULT, bubbles, cancelable);
			this.success = success;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new InsertInstantiatedKefedModelResultEvent(success, bubbles, cancelable);
		}

	}

}