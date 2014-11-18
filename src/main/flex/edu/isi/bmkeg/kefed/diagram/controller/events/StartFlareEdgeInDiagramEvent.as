package edu.isi.bmkeg.kefed.diagram.controller.events
{	
	import edu.isi.bmkeg.kefed.model.flare.FlareEdge;
	
	import flash.events.Event;
	
	public class StartFlareEdgeInDiagramEvent extends Event
	{
		public static const START_FLARE_EDGE_IN_DIAGRAM:String = "startFlareEdgeInDiagram";
		
		public var sourceUid:String;
		public var targetUid:String;
		
		/**
		 * Constructor.
		 */
		public function StartFlareEdgeInDiagramEvent(sourceUid:String, targetUid:String=null)
		{
			super(START_FLARE_EDGE_IN_DIAGRAM);
			this.sourceUid = sourceUid;
			this.targetUid = targetUid;
		}
		
		/**
		 * Override the inherited clone() method, but don't return any state.
		 */
		override public function clone() : Event
		{
			return new StartFlareEdgeInDiagramEvent(sourceUid, targetUid);
		}
		
	}
	
}