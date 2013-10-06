package edu.isi.bmkeg.kefed.events
{
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.rpc.events.FaultEvent;
	
	public class SelectKefedModel extends Event 
	{
		
		public static const SELECT_KEFED_MODEL:String = "selectKefedModel";
		
		public var vpdmfId:Number;
		
		public function SelectKefedModel(vpdmfId:Number,
										 bubbles:Boolean=false, 
										 cancelable:Boolean=false ) {
			this.vpdmfId = vpdmfId;
			super(SELECT_KEFED_MODEL, bubbles, cancelable);
		}
		
		override public function clone() : Event
		{
			return new SelectKefedModel(vpdmfId, bubbles, cancelable);
		}
		
	}
	
}
