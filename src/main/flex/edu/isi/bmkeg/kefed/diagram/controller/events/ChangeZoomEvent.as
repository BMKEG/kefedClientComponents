package edu.isi.bmkeg.kefed.diagram.controller.events
{	
	
	import flash.events.Event;
	
	public class ChangeZoomEvent extends Event
	{
		public static const CHANGE_ZOOM:String = "changeZoom";
		
		public var zoom:Number;
		
		/**
		 * Constructor.
		 */
		public function ChangeZoomEvent(zoom:Number)
		{
			super(CHANGE_ZOOM);
			this.zoom = zoom;
		}
		
		/**
		 * Override the inherited clone() method, but don't return any state.
		 */
		override public function clone() : Event
		{
			return new ChangeZoomEvent(zoom);
		}
		
	}
	
}