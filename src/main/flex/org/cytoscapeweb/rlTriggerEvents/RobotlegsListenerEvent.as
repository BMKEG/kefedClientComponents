package org.cytoscapeweb.rlTriggerEvents
{
	
	import flash.events.Event;
	
	import mx.rpc.events.FaultEvent;
	
	public class RobotlegsListenerEvent extends Event 
	{
		public static var ROBOTLEGS_LISTENER:String = "RobotlegsListener__";
		
		public var callbackName:String;
		public var data:*;
		
		public function RobotlegsListenerEvent(callbackName:String,
												   data:*, 
												   bubbles:Boolean=false, 
												   cancelable:Boolean=false ) {				
			this.callbackName = callbackName;
			this.data = data;
			super(callbackName, bubbles, cancelable);
		}
		
		override public function clone() : Event
		{
			return new RobotlegsListenerEvent(callbackName, data, bubbles, cancelable);
		}
		
	}
	
}
