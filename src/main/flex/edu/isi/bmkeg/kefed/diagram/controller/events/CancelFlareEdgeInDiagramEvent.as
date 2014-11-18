package edu.isi.bmkeg.kefed.diagram.controller.events
{	
	import edu.isi.bmkeg.kefed.model.flare.FlareEdge;
	
	import flash.events.Event;
	
	public class CancelFlareEdgeInDiagramEvent extends Event
	{
		public static const CANCEL_FLARE_EDGE_IN_DIAGRAM:String = "cancelFlareEdgeInDiagram";
				
		/**
		 * Constructor.
		 */
		public function CancelFlareEdgeInDiagramEvent()
		{
			super(CANCEL_FLARE_EDGE_IN_DIAGRAM);
		}
		
		/**
		 * Override the inherited clone() method, but don't return any state.
		 */
		override public function clone() : Event
		{
			return new CancelFlareEdgeInDiagramEvent();
		}
		
	}
	
}