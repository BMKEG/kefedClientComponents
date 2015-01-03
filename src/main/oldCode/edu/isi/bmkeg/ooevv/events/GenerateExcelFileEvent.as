package edu.isi.bmkeg.ooevv.events
{

	import flash.events.Event;

	public class GenerateExcelFileEvent extends Event {

		public static const GENERATE_EXCEL_FILE:String = "generateExcelFile";
		
		public var name:String;
		
		public function GenerateExcelFileEvent(name:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.name = name;
			super(GENERATE_EXCEL_FILE, bubbles, cancelable);
		}

		override public function clone() : Event
		{
			return new GenerateExcelFileEvent(name, bubbles, cancelable);
		}

	}
}
