package edu.isi.bmkeg.ooevv.events
{

	import flash.events.Event;

	public class SaveNewFileEvent extends Event {

		public static const SAVE_NEW_FILE:String = "saveNewFile";
		
		public var name:String;
		
		public function SaveNewFileEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(SAVE_NEW_FILE, bubbles, cancelable);
		}

		override public function clone() : Event
		{
			return new SaveNewFileEvent(bubbles, cancelable);
		}

	}
}
