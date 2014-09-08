package edu.isi.bmkeg.kefed.events.elementLevel
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class DeleteKefedElementEvent extends Event
	{
		public static const REMOVE_KEFED_ELEMENT:String = "removeKefedElement";

		public var uid:String;
		public var xml:XML;

		// Constructor
		public function DeleteKefedElementEvent(uid:String,
												xml:XML, 
												bubbles:Boolean=false, 
												cancelable:Boolean=false)
		{
			super(REMOVE_KEFED_ELEMENT, bubbles, cancelable);
			this.uid = uid;
			this.xml = xml;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new DeleteKefedElementEvent(uid, xml, bubbles, cancelable);
		}

	}

}