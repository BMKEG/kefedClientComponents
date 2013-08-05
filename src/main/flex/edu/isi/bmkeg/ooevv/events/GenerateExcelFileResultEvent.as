package edu.isi.bmkeg.ooevv.events
{

	import flash.events.Event;
	import flash.utils.ByteArray;

	public class GenerateExcelFileResultEvent extends Event {

		public static const GENERATE_EXCEL_FILE_RESULT:String = "generateExcelFileResult";

		public var data:ByteArray;

		public function GenerateExcelFileResultEvent(data:ByteArray, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(GENERATE_EXCEL_FILE_RESULT, bubbles, cancelable);
			this.data = data;
		}

		override public function clone() : Event
		{
			return new GenerateExcelFileResultEvent(data, bubbles, cancelable);
		}

	}
}
