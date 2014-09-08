package edu.isi.bmkeg.kefed.events.modelLevel
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class SelectKefedModelEvent extends Event
	{
		public static const SELECT_KEFED_MODEL:String = "selectKefedModel";

		public var uid:String;

		// Constructor
		public function SelectKefedModelEvent(uid:String)
		{
			super(SELECT_KEFED_MODEL);
			this.uid = uid;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone() : Event
		{
			return new SelectKefedModelEvent(uid);
		}

	}

}