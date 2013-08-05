package edu.isi.bmkeg.ooevv.events
{

	import flash.events.Event;
	import flash.utils.ByteArray;

	public class DeleteOoevvElementSetResultEvent extends Event {

		public static const DELETE_OOEVV_ELEMENT_SET:String = "deleteOoevvElementSetResult";

		public var result:Boolean;

		public function DeleteOoevvElementSetResultEvent(result:Boolean, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(DELETE_OOEVV_ELEMENT_SET, bubbles, cancelable);
			this.result = result;
		}

		override public function clone() : Event
		{
			return new DeleteOoevvElementSetResultEvent(result, bubbles, cancelable);
		}

	}
}
