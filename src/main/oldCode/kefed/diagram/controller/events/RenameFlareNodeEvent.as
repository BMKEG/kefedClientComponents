package edu.isi.bmkeg.kefed.diagram.controller.events
{	
	import edu.isi.bmkeg.kefed.model.flare.FlareNode;
	
	import flash.events.Event;
	
	public class RenameFlareNodeEvent extends Event
	{
		public static const RENAME_FLARE_NODE:String = "renameFlareNode";
		
		public var uid:String;
		public var name:String;
		public var xml:XML;
		
		/**
		 * Constructor.
		 */
		public function RenameFlareNodeEvent(uid:String, 
											 name:String, 
											 xml:XML, 
											 bubbles:Boolean=false, 
											 cancelable:Boolean=false )
		{
			super(RENAME_FLARE_NODE, bubbles, cancelable);
			this.uid = uid;
			this.name = name;
			this.xml = xml;
		}
		
		/**
		 * Override the inherited clone() method, but don't return any state.
		 */
		override public function clone() : Event
		{
			return new RenameFlareNodeEvent(uid, name, xml, bubbles, cancelable);
		}
		
	}
	
}