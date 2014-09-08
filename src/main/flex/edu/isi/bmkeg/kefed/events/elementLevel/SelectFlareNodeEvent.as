package edu.isi.bmkeg.kefed.events.elementLevel
{	
	import edu.isi.bmkeg.kefed.model.flare.FlareNode;
	
	import flash.events.Event;
	
	public class SelectFlareNodeEvent extends Event
	{
		public static const SELECT_FLARE_NODE:String = "selectFlareNode";
		
		public var uid:String;
		
		/**
		 * Constructor.
		 */
		public function SelectFlareNodeEvent(uid:String)
		{
			super(SELECT_FLARE_NODE);
			this.uid = uid;
		}
		
		/**
		 * Override the inherited clone() method, but don't return any state.
		 */
		override public function clone() : Event
		{
			return new SelectFlareNodeEvent(uid);
		}
		
	}
	
}