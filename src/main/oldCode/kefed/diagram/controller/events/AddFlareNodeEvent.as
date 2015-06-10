package edu.isi.bmkeg.kefed.diagram.controller.events
{	
	import edu.isi.bmkeg.kefed.model.flare.FlareNode;
	
	import flash.events.Event;
	
	public class AddFlareNodeEvent extends Event
	{
		public static const ADD_FLARE_NODE:String = "addFlareNode";
		
		public var el:FlareNode;
		public var xml:XML;
		
		/**
		 * Constructor.
		 */
		public function AddFlareNodeEvent(el:FlareNode, xml:XML, 
											bubbles:Boolean=false,
											cancelable:Boolean=false)
		{
			super(ADD_FLARE_NODE, bubbles, cancelable);
			this.el = el;
			this.xml = xml;
		}
		
		/**
		 * Override the inherited clone() method, but don't return any state.
		 */
		override public function clone() : Event
		{
			return new AddFlareNodeEvent(el, xml, bubbles, cancelable);
		}
		
	}
	
}