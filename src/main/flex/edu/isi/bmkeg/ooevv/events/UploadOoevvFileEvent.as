package edu.isi.bmkeg.ooevv.events
{

	import edu.isi.bmkeg.ooevv.model.OoevvElementSet;
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.controls.Button;

	public class UploadOoevvFileEvent extends Event {

		public static const UPLOAD_OOEVV_FILE:String = "uploadOoevvFile";

		public var data:ByteArray;
		public var oes:OoevvElementSet;
		
		public function UploadOoevvFileEvent(data:ByteArray, oes:OoevvElementSet,
							bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(UploadOoevvFileEvent.UPLOAD_OOEVV_FILE);
			this.data = data;
			this.oes = oes;			
		}

		override public function clone() : Event
		{
			return new UploadOoevvFileEvent(data, oes, bubbles, cancelable);
		}

	}
}
