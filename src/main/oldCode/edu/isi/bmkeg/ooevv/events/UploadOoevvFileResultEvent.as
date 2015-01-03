package edu.isi.bmkeg.ooevv.events
{
	
	import edu.isi.bmkeg.ooevv.model.OoevvElementSet;
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.controls.Button;
	
	public class UploadOoevvFileResultEvent extends Event {
		
		public static const UPLOAD_OOEVV_FILE_RESULT:String = "uploadOoevvFileResult";
				
		public function UploadOoevvFileResultEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(UploadOoevvFileResultEvent.UPLOAD_OOEVV_FILE_RESULT, bubbles, cancelable);
		}
		
		override public function clone() : Event
		{
			return new UploadOoevvFileResultEvent(bubbles, cancelable);
		}
		
	}
}
