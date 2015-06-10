package edu.isi.bmkeg.kefed.events.modelLevel
{
	import edu.isi.bmkeg.kefed.model.design.KefedModel;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class SaveKefedModelResultEvent extends Event
	{
		public static const SAVE_KEFED_MODEL_RESULT:String = "saveKefedModelResult";

		public var success:Boolean;

		// Constructor
		public function SaveKefedModelResultEvent(success:Boolean,
												  bubbles:Boolean=false, 
												  cancelable:Boolean=false)
		{
			super(SAVE_KEFED_MODEL_RESULT, bubbles, cancelable);
			this.success = success;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new SaveKefedModelResultEvent(success, bubbles, cancelable);
		}

	}

}