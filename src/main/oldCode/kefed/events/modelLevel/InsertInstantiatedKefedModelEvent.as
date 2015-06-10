package edu.isi.bmkeg.kefed.events.modelLevel
{
	import edu.isi.bmkeg.kefed.model.design.KefedModel;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class InsertInstantiatedKefedModelEvent extends Event
	{
		public static const INSERT_INSTANTIATED_KEFED_MODEL:String = "insertInstantiatedKefedModel";

		public var completeModel:KefedModel;

		// Constructor
		public function InsertInstantiatedKefedModelEvent(completeModel:KefedModel,
														  bubbles:Boolean=false, 
														  cancelable:Boolean=false)
		{
			super(INSERT_INSTANTIATED_KEFED_MODEL, bubbles, cancelable);
			this.completeModel = completeModel;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new InsertInstantiatedKefedModelEvent(completeModel, bubbles, cancelable);
		}

	}

}