package org.cytoscapeweb.rlTriggerEvents
{
	
	import flash.events.Event;
	
	import mx.rpc.events.FaultEvent;
	
	public class RobotlegsReadyCallbackEvent extends Event 
	{
		
		public static var ROBOTLEGS_READY_CALLBACK:String = "RobotlegsReadyCallback";
		
		public function RobotlegsReadyCallbackEvent(bubbles:Boolean=false, 
												   cancelable:Boolean=false ) {				
			super(ROBOTLEGS_READY_CALLBACK, bubbles, cancelable);
		}
		
		override public function clone() : Event
		{
			return new RobotlegsReadyCallbackEvent(bubbles, cancelable);
		}
		
	}
	
}
