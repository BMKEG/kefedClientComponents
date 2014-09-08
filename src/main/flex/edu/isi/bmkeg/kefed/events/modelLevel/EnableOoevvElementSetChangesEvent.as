package edu.isi.bmkeg.kefed.events.modelLevel
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class EnableOoevvElementSetChangesEvent extends Event
	{
		public static const ENABLE_OOEVV_ELEMENT_SET_CHANGES:String = "enableOoevvElementSetChanges";


		// Constructor
		public function EnableOoevvElementSetChangesEvent()
		{
			super(ENABLE_OOEVV_ELEMENT_SET_CHANGES);
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new EnableOoevvElementSetChangesEvent();
		}

	}

}