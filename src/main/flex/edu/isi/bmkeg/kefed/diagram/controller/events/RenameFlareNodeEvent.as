package edu.isi.bmkeg.kefed.diagram.controller.events
{	
	import edu.isi.bmkeg.kefed.diagram.model.vo.FlareNode;
	
	import flash.events.Event;
	
	public class RenameFlareNodeEvent extends Event
	{
		public static const RENAME_FLARE_NODE:String = "renameFlareNode";
		
		public var uid:String;
		public var name:String;
		
		/**
		 * Constructor.
		 */
		public function RenameFlareNodeEvent(uid:String, name:String)
		{
			super(RENAME_FLARE_NODE);
			this.uid = uid;
			this.name = name;
		}
		
		/**
		 * Override the inherited clone() method, but don't return any state.
		 */
		override public function clone() : Event
		{
			return new RenameFlareNodeEvent(uid, name);
		}
		
	}
	
}