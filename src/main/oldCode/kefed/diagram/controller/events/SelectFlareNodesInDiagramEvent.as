package edu.isi.bmkeg.kefed.diagram.controller.events
{	
	import edu.isi.bmkeg.kefed.model.flare.FlareNode;
	
	import mx.collections.ArrayCollection;

	import flash.events.Event;
	
	public class SelectFlareNodesInDiagramEvent extends Event
	{
		public static const SELECT_FLARE_NODE_IN_DIAGRAM:String = "selectFlareNodeInDiagram";
		
		public var nodes:ArrayCollection = new ArrayCollection();
		
		/**
		 * Constructor.
		 */
		public function SelectFlareNodesInDiagramEvent(nodes:ArrayCollection)
		{
			super(SELECT_FLARE_NODE_IN_DIAGRAM);
			this.nodes = nodes;
		}
		
		/**
		 * Override the inherited clone() method, but don't return any state.
		 */
		override public function clone() : Event
		{
			return new SelectFlareNodesInDiagramEvent(nodes);
		}
		
	}
	
}