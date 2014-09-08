package edu.isi.bmkeg.kefed.diagram.controller.events
{	
	import edu.isi.bmkeg.kefed.model.flare.FlareEdge;
	
	import flash.events.Event;
	
	public class SelectFlareEdgeInDiagramEvent extends Event
	{
		public static const SELECT_FLARE_EDGE_IN_DIAGRAM:String = "selectFlareEdgeInDiagram";
		
		public var fe:FlareEdge;
		
		/**
		 * Constructor.
		 */
		public function SelectFlareEdgeInDiagramEvent(fe:FlareEdge)
		{
			super(SELECT_FLARE_EDGE_IN_DIAGRAM);
			this.fe = fe;
		}
		
		/**
		 * Override the inherited clone() method, but don't return any state.
		 */
		override public function clone() : Event
		{
			return new SelectFlareEdgeInDiagramEvent(fe);
		}
		
	}
	
}