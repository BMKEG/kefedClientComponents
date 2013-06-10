package edu.isi.bmkeg.kefed.diagram.controller.events
{	
	import edu.isi.bmkeg.kefed.diagram.model.vo.FlareNode;
	
	import flash.events.Event;
	
	public class AddFlareNodeEvent extends Event
	{
		public static const ADD_FLARE_NODE:String = "addFlareNode";
		
		public var el:FlareNode;
		
		/**
		 * Constructor.
		 */
		public function AddFlareNodeEvent(el:FlareNode)
		{
			super(ADD_FLARE_NODE);
			this.el = el;
		}
		
		/**
		 * Override the inherited clone() method, but don't return any state.
		 */
		override public function clone() : Event
		{
			return new AddFlareNodeEvent(el);
		}
		
	}
	
}