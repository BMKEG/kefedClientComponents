package org.cytoscapeweb.rlTriggerEvents
{
	
	import flash.events.Event;
	
	import mx.rpc.events.FaultEvent;
	
	public class RobotlegsContextMenuCallbackEvent extends Event 
	{
		public static var ROBOTLEGS_CONTEXT_MENU_CALLBACK:String = "RobotlegsContextMenuCallback__";
		
		public var callbackName:String
		public var group:String;
		public var uuid:String;	
		
		public function RobotlegsContextMenuCallbackEvent(callbackName:String,
											   group:String,
											   uuid:String,
											   bubbles:Boolean=false, 
											   cancelable:Boolean=false ) {				
			this.callbackName = callbackName;
			this.group = group;
			this.uuid = uuid;
			super(callbackName, bubbles, cancelable);
		}
		
		override public function clone() : Event
		{
			return new RobotlegsContextMenuCallbackEvent(callbackName, group, uuid, bubbles, cancelable);
		}
		
	}
	
}
