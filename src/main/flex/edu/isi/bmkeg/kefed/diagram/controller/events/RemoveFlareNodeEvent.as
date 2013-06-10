package edu.isi.bmkeg.kefed.diagram.controller.events
{	
	import edu.isi.bmkeg.kefed.model.design.KefedModelElement;
	
	import flash.events.Event;
	
	public class RemoveFlareNodeEvent extends Event
	{
		public static const REMOVE_FLARE_NODE:String = "removeFlareNode";
		
		public var uid:String;
		
		/**
		 * Constructor.
		 */
		public function RemoveFlareNodeEvent(uid:String)
		{
			super(REMOVE_FLARE_NODE);
			this.uid = uid;
		}
		
		/**
		 * Override the inherited clone() method, but don't return any state.
		 */
		override public function clone() : Event
		{
			return new RemoveFlareNodeEvent(uid);
		}
		
	}
	
}