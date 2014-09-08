package edu.isi.bmkeg.kefed.diagram.controller.events
{	
	import edu.isi.bmkeg.kefed.model.flare.FlareNode;
	
	import flash.events.Event;
	
	public class SelectFlareNodeInDiagramEvent extends Event
	{
		public static const SELECT_FLARE_NODE_IN_DIAGRAM:String = "selectFlareNodeInDiagram";
		
		public var uid:String;
		
		/**
		 * Constructor.
		 */
		public function SelectFlareNodeInDiagramEvent(uid:String)
		{
			super(SELECT_FLARE_NODE_IN_DIAGRAM);
			this.uid = uid;
		}
		
		/**
		 * Override the inherited clone() method, but don't return any state.
		 */
		override public function clone() : Event
		{
			return new SelectFlareNodeInDiagramEvent(uid);
		}
		
	}
	
}