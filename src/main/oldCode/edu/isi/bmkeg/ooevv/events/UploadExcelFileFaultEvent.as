package edu.isi.bmkeg.ooevv.events
{
	
	import flash.events.Event;
	
	import mx.rpc.Fault;
	import mx.rpc.events.FaultEvent;
	
	public class UploadExcelFileFaultEvent extends Event {
		
		public static const UPLOAD_EXCEL_FILE_FAULT:String = "uploadExcelFileFault";

		public var faultEvent:FaultEvent;
		
		public function UploadExcelFileFaultEvent(faultEvent:FaultEvent, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(UPLOAD_EXCEL_FILE_FAULT, bubbles, cancelable);
			this.faultEvent = faultEvent;
		}
		
		override public function clone():Event
		{
			var event:UploadExcelFileFaultEvent = new UploadExcelFileFaultEvent(faultEvent, bubbles, cancelable);			
			return event;
		}
		
	}
}
