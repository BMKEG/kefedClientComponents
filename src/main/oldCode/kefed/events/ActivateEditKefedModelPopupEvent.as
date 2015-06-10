package edu.isi.bmkeg.kefed.events
{
	
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.rpc.events.FaultEvent;
	
	public class ActivateEditKefedModelPopupEvent extends Event 
	{
		
		public static const ACTIVATE_EDIT_KEFED_MODEL_POPUP:String = "activateEditKefedModelPopup";
				
		public function ActivateEditKefedModelPopupEvent(bubbles:Boolean=false, 
													 	cancelable:Boolean=false ) {				
			super(ACTIVATE_EDIT_KEFED_MODEL_POPUP, bubbles, cancelable);
		}
		
		override public function clone() : Event
		{
			return new ActivateEditKefedModelPopupEvent(bubbles, cancelable);
		}
		
	}
	
}
