package edu.isi.bmkeg.kefed.events.elementLevel
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class RenameKefedElementEvent extends Event
	{
		public static const RENAME_KEFED_ELEMENT:String = "renameKefedElement";

		public var uid:String;
		public var newName:String;
		public var xml:XML;

		// Constructor
		public function RenameKefedElementEvent(uid:String, 
												newName:String,
												xml:XML,
												bubbles:Boolean=false,
												cancelable:Boolean=false)
		{
			super(RENAME_KEFED_ELEMENT);
			this.uid = uid;
			this.newName = newName;
			this.xml = xml;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new RenameKefedElementEvent(uid, newName, xml, bubbles, cancelable);
		}

	}

}