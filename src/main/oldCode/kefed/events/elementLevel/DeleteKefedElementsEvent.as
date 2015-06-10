package edu.isi.bmkeg.kefed.events.elementLevel
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class DeleteKefedElementsEvent extends Event
	{
		public static const REMOVE_KEFED_ELEMENTS:String = "removeKefedElements";

		public var uids:ArrayCollection = new ArrayCollection();

		// Constructor
		public function DeleteKefedElementsEvent(uids:ArrayCollection,
												bubbles:Boolean=false, 
												cancelable:Boolean=false)
		{
			super(REMOVE_KEFED_ELEMENTS, bubbles, cancelable);
			this.uids = uids;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new DeleteKefedElementsEvent(uids, bubbles, cancelable);
		}

	}

}