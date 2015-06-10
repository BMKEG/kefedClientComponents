package edu.isi.bmkeg.kefed.diagram.controller.events
{	
	
	import flash.events.Event;
	
	public class ShowKefedSvgEvent extends Event
	{
		public static const SHOW_KEFED_SVG:String = "showKefedSvg";
		
		public var svg:XML;
		
		/**
		 * Constructor.
		 */
		public function ShowKefedSvgEvent(svg:XML)
		{
			super(SHOW_KEFED_SVG);
			this.svg = svg;
		}
		
		/**
		 * Override the inherited clone() method, but don't return any state.
		 */
		override public function clone() : Event
		{
			return new ShowKefedSvgEvent(svg);
		}
		
	}
	
}