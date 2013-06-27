package edu.isi.bmkeg.ooevv.events
{

	import flash.events.Event;

	public class UploadExcelFileResultEvent extends Event {

		public static const UPLOAD_EXCEL_FILE_RESULT:String = "uploadExcelFileResult";

		public var oesVpdmfId:Number;

		public function UploadExcelFileResultEvent(oesVpdmfId:Number)
		{
			super(UPLOAD_EXCEL_FILE_RESULT);
			this.oesVpdmfId = oesVpdmfId;
		}

		override public function clone() : Event
		{
			return new UploadExcelFileResultEvent(oesVpdmfId);
		}

	}
}
