package edu.isi.bmkeg.kefed.diagram.controller.events
{	
	import edu.isi.bmkeg.kefed.diagram.model.vo.FlareNode;
	
	import flash.events.Event;
	
	public class UpdateKapitXmlEvent extends Event
	{
		public static const UPDATE_KAPIT_XML:String = "updateKapitXml";
		
		public var xml:XML;
		public var updateTime:Date;
		
		/**
		 * Constructor.
		 */
		public function UpdateKapitXmlEvent(xml:XML, updateTime:Date)
		{
			super(UPDATE_KAPIT_XML);
			this.xml = xml;
			this.updateTime = updateTime;
		}
		
		/**
		 * Override the inherited clone() method, but don't return any state.
		 */
		override public function clone():Event
		{
			return new UpdateKapitXmlEvent(xml, updateTime);
		}
		
	}
	
}