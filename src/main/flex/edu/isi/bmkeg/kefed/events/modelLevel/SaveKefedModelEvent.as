package edu.isi.bmkeg.kefed.events.modelLevel
{
	import edu.isi.bmkeg.kefed.model.design.KefedModel;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class SaveKefedModelEvent extends Event
	{
		public static const SAVE_KEFED_MODEL:String = "saveKefedModel";

		public var completeModel:KefedModel;

		// Constructor
		public function SaveKefedModelEvent(completeModel:KefedModel)
		{
			super(SAVE_KEFED_MODEL);
			this.completeModel = completeModel;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new SaveKefedModelEvent(completeModel);
		}

	}

}