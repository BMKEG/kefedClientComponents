package edu.isi.bmkeg.kefed.diagram.controller.events
{	
	import edu.isi.bmkeg.kefed.diagram.model.vo.FlareEdge;
	
	import flash.events.Event;
	
	public class SelectFlareEdgeEvent extends Event
	{
		public static const SELECT_FLARE_EDGE:String = "selectFlareEdge";
		
		public var fe:FlareEdge;
		
		/**
		 * Constructor.
		 */
		public function SelectFlareEdgeEvent(fe:FlareEdge)
		{
			super(SELECT_FLARE_EDGE);
			this.fe = fe;
		}
		
		/**
		 * Override the inherited clone() method, but don't return any state.
		 */
		override public function clone() : Event
		{
			return new SelectFlareEdgeEvent(fe);
		}
		
	}
	
}