package edu.isi.bmkeg.ooevv.events
{

	import flash.events.Event;

	public class DeleteOoevvElementSetEvent extends Event {

		public static const DELETE_OOEVV_ELEMENT_SET:String = "deleteOoevvElementSet";
		
		public var vpdmfId:Number;
		
		public function DeleteOoevvElementSetEvent(vpdmfId:Number, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.vpdmfId = vpdmfId;
			super(DELETE_OOEVV_ELEMENT_SET, bubbles, cancelable);
		}

		override public function clone() : Event
		{
			return new DeleteOoevvElementSetEvent(vpdmfId, bubbles, cancelable);
		}

	}
}
