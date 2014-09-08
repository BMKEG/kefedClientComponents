package edu.isi.bmkeg.kefed.events.elementLevel
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class LoadKefedElementEvent extends Event
	{
		public static const LOAD_KEFED_ELEMENT:String = "loadKefedElement";


		// Constructor
		public function LoadKefedElementEvent()
		{
			super(LOAD_KEFED_ELEMENT);
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new LoadKefedElementEvent();
		}

	}

}