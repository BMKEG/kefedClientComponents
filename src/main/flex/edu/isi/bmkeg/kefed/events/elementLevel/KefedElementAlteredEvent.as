package edu.isi.bmkeg.kefed.events.elementLevel
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class KefedElementAlteredEvent extends Event
	{
		public static const KEFED_ELEMENT_ALTERED:String = "kefedElementAltered";


		// Constructor
		public function KefedElementAlteredEvent()
		{
			super(KEFED_ELEMENT_ALTERED);
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new KefedElementAlteredEvent();
		}

	}

}