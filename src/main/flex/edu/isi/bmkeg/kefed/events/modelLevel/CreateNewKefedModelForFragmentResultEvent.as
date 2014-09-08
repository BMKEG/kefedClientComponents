package edu.isi.bmkeg.kefed.events.modelLevel
{
	import edu.isi.bmkeg.kefed.model.design.KefedModel;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class CreateNewKefedModelForFragmentResultEvent extends Event
	{
		public static const CREATE_NEW_KEFED_MODEL_FOR_FRAGMENT_RESULT:String = "createNewKefedModelForFragmentResult";

		public var model:KefedModel;

		// Constructor
		public function CreateNewKefedModelForFragmentResultEvent(model:KefedModel,
															bubbles:Boolean=false, 
															cancelable:Boolean=false)
		{
			super(CREATE_NEW_KEFED_MODEL_FOR_FRAGMENT_RESULT, bubbles, cancelable);
			this.model = model;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new CreateNewKefedModelForFragmentResultEvent(model, bubbles, cancelable);
		}

	}

}