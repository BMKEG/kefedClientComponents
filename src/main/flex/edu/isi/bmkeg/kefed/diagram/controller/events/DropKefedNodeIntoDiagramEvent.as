package edu.isi.bmkeg.kefed.diagram.controller.events
{	
	import edu.isi.bmkeg.kefed.model.design.KefedModelElement;
	
	import flash.events.Event;
	
	public class DropKefedNodeIntoDiagramEvent extends Event
	{
		public static const DROP_KEFED_NODE_INTO_DIAGRAM:String = "dropKefedNodeIntoDiagram";
		
		public var k:KefedModelElement;
		public var xml:XML;
		
		/**
		 * Constructor.
		 */
		public function DropKefedNodeIntoDiagramEvent(k:KefedModelElement, xml:XML)
		{
			super(DROP_KEFED_NODE_INTO_DIAGRAM);
			this.k = k;
			this.xml = xml;
		}
		
		/**
		 * Override the inherited clone() method, but don't return any state.
		 */
		override public function clone() : Event
		{
			return new DropKefedNodeIntoDiagramEvent(k, xml);
		}
		
	}
	
}
