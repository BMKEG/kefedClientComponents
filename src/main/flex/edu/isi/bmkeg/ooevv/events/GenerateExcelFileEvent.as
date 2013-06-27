package edu.isi.bmkeg.ooevv.events
{

	import flash.events.Event;

	public class GenerateExcelFileEvent extends Event {

		public static const GENERATE_EXCEL_FILE:String = "generateExcelFile";

		public function GenerateExcelFileEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(GENERATE_EXCEL_FILE, bubbles, cancelable);
		}

		override public function clone() : Event
		{
			return new GenerateExcelFileEvent(bubbles, cancelable);
		}

	}
}
