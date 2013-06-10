package edu.isi.bmkeg.kefed.diagram.controller.events
{	
	import edu.isi.bmkeg.kefed.model.design.KefedModelEdge;
	
	import flash.events.Event;
	
	public class RemoveFlareEdgeEvent extends Event
	{
		public static const REMOVE_FLARE_EDGE:String = "removeFlareEdge";
		
		public var uid:String;
		
		/**
		 * Constructor.
		 */
		public function RemoveFlareEdgeEvent(uid:String)
		{
			super(REMOVE_FLARE_EDGE);
			this.uid = uid;
		}
		
		/**
		 * Override the inherited clone() method, but don't return any state.
		 */
		override public function clone() : Event
		{
			return new RemoveFlareEdgeEvent(uid);
		}
		
	}
	
}