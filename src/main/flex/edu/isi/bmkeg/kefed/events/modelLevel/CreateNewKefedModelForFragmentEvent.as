package edu.isi.bmkeg.kefed.events.modelLevel
{
	import edu.isi.bmkeg.kefed.model.design.KefedModel;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class CreateNewKefedModelForFragmentEvent extends Event
	{
		public static const CREATE_NEW_KEFED_MODEL_FOR_FRAGMENT:String = "createNewKefedModelForFragment";

		public var fgrId:Number;

		// Constructor
		public function CreateNewKefedModelForFragmentEvent(fgrId:Number,
															bubbles:Boolean=false, 
															cancelable:Boolean=false)
		{
			super(CREATE_NEW_KEFED_MODEL_FOR_FRAGMENT, bubbles, cancelable);
			this.fgrId = fgrId;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new CreateNewKefedModelForFragmentEvent(fgrId, bubbles, cancelable);
		}

	}

}