package edu.isi.bmkeg.kefed.events.elementLevel
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class EditKefedElementEvent extends Event
	{
		public static const EDIT_KEFED_ELEMENT:String = "editKefedElement";


		// Constructor
		public function EditKefedElementEvent()
		{
			super(EDIT_KEFED_ELEMENT);
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new EditKefedElementEvent();
		}

	}

}