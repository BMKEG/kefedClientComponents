package edu.isi.bmkeg.kefed.diagram.controller.events
{	
	import edu.isi.bmkeg.kefed.model.design.KefedModelEdge;
	
	import flash.events.Event;
	
	public class AddFlareEdgeEvent extends Event
	{
		public static const ADD_FLARE_EDGE:String = "addFlareEdge";
		
		public var sourceUid:String;
		public var targetUid:String;
		public var linkUid:String;
		public var xml:XML;
		
		/**
		 * Constructor.
		 */
		public function AddFlareEdgeEvent(sourceUid:String, 
										  targetUid:String, 
										  linkUid:String,
										  xml:XML, 
										  bubbles:Boolean=false, 
										  cancelable:Boolean=false)
		{
			super(ADD_FLARE_EDGE, bubbles, cancelable);
			this.sourceUid = sourceUid;
			this.targetUid = targetUid;
			this.linkUid = linkUid;
			this.xml = xml;
		}
		
		/**
		 * Override the inherited clone() method, but don't return any state.
		 */
		override public function clone() : Event
		{
			return new AddFlareEdgeEvent(sourceUid, targetUid, linkUid, 
				xml, bubbles, cancelable);
		}
		
	}
	
}