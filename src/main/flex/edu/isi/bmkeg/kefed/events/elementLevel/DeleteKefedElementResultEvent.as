package edu.isi.bmkeg.kefed.events.elementLevel
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class DeleteKefedElementResultEvent extends Event
	{
		public static const DELETE_KEFED_ELEMENT_RESULT:String = "deleteKefedElementResult";

		public var success:ArrayCollection = new ArrayCollection();

		// Constructor
		public function DeleteKefedElementResultEvent(success:ArrayCollection, 
											 bubbles:Boolean=false, 
											 cancelable:Boolean=false)
		{
			super(DELETE_KEFED_ELEMENT_RESULT, bubbles, cancelable);
			this.success = success;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new DeleteKefedElementResultEvent(success, bubbles, cancelable);
		}

	}

}