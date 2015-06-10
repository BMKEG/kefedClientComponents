package edu.isi.bmkeg.kefed.events
{
	
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.rpc.events.FaultEvent;
	
	public class ActivateKefedModelListPopupEvent extends Event 
	{
		
		public static const ACTIVATE_CORPUS_LIST_POPUP:String = "activateCorpusListPopup";
		
		
		public function ActivateKefedModelListPopupEvent(bubbles:Boolean=false, 
													 cancelable:Boolean=false ) {				
			super(ACTIVATE_CORPUS_LIST_POPUP, bubbles, cancelable);
		}
		
		override public function clone() : Event
		{
			return new ActivateKefedModelListPopupEvent(bubbles, cancelable);
		}
		
	}
	
}
