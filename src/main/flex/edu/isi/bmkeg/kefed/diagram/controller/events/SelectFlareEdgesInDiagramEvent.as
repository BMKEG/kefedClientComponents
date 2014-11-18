package edu.isi.bmkeg.kefed.diagram.controller.events
{	
	import edu.isi.bmkeg.kefed.model.flare.FlareEdge;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class SelectFlareEdgesInDiagramEvent extends Event
	{
		public static const SELECT_FLARE_EDGE_IN_DIAGRAM:String = "selectFlareEdgeInDiagram";
		
		public var edges:ArrayCollection = new ArrayCollection();
		
		/**
		 * Constructor.
		 */
		public function SelectFlareEdgesInDiagramEvent(edges:ArrayCollection)
		{
			super(SELECT_FLARE_EDGE_IN_DIAGRAM);
			this.edges = edges;
		}
		
		/**
		 * Override the inherited clone() method, but don't return any state.
		 */
		override public function clone() : Event
		{
			return new SelectFlareEdgesInDiagramEvent(edges);
		}
		
	}
	
}