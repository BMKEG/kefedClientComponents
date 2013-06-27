package edu.isi.bmkeg.ooevv.events
{

	import flash.events.Event;

	public class GenerateExcelFileResultEvent extends Event {

		public static const GENERATE_EXCEL_FILE_RESULT:String = "generateExcelFileResult";

		public var name:String;
		public var data:Object;

		public function GenerateExcelFileResultEvent(name:String, data:Object, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(GENERATE_EXCEL_FILE_RESULT, bubbles, cancelable);
			this.name = name;
			this.data = data;
		}

		override public function clone() : Event
		{
			return new GenerateExcelFileResultEvent(name, data, bubbles, cancelable);
		}

	}
}
