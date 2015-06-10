package edu.isi.bmkeg.kefed.events.modelLevel
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class DisableOoevvElementSetChangesEvent extends Event
	{
		public static const DISABLE_OOEVV_ELEMENT_SET_CHANGES:String = "disableOoevvElementSetChanges";


		// Constructor
		public function DisableOoevvElementSetChangesEvent()
		{
			super(DISABLE_OOEVV_ELEMENT_SET_CHANGES);
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new DisableOoevvElementSetChangesEvent();
		}

	}

}