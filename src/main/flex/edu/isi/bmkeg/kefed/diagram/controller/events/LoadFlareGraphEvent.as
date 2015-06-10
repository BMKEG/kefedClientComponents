package edu.isi.bmkeg.kefed.diagram.controller.events
{	
	import edu.isi.bmkeg.kefed.model.flare.FlareGraph;
	
	import flash.events.Event;
	
	public class LoadFlareGraphEvent extends Event
	{
		public static const LOAD_FLARE_GRAPH:String = "loadFlareGraph";
		
		public var model:FlareGraph;
		public var xml:XML;
		
		/**
		 * Constructor.
		 */
		public function LoadFlareGraphEvent(model:FlareGraph, xml:XML)
		{
			super(LOAD_FLARE_GRAPH);
			this.model = model;
			this.xml = xml;
		}
		
		/**
		 * Override the inherited clone() method, but don't return any state.
		 */
		override public function clone() : Event
		{
			return new LoadFlareGraphEvent(model, xml);
		}
		
	}
	
}