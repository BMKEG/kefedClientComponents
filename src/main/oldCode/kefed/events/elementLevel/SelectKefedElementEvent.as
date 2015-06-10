package edu.isi.bmkeg.kefed.events.elementLevel
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class SelectKefedElementEvent extends Event
	{
		public static const SELECT_KEFED_ELEMENT:String = "selectKefedElement";

		public var uid:String;

		// Constructor
		public function SelectKefedElementEvent(uid:String)
		{
			super(SELECT_KEFED_ELEMENT);
			this.uid = uid;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new SelectKefedElementEvent(uid);
		}

	}

}