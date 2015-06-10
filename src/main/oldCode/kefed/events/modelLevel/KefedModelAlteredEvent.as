package edu.isi.bmkeg.kefed.events.modelLevel
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class KefedModelAlteredEvent extends Event
	{
		public static const KEFED_MODEL_ALTERED:String = "kefedModelAltered";


		// Constructor
		public function KefedModelAlteredEvent(bubbles:Boolean=false, 
											   cancelable:Boolean=false )
		{
			super(KEFED_MODEL_ALTERED, bubbles, cancelable);
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new KefedModelAlteredEvent(bubbles, cancelable);
		}

	}

}