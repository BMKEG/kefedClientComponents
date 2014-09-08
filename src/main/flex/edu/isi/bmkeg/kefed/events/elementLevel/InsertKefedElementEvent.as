package edu.isi.bmkeg.kefed.events.elementLevel
{
	import edu.isi.bmkeg.kefed.model.design.KefedModelElement;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class InsertKefedElementEvent extends Event
	{
		public static const INSERT_KEFED_ELEMENT:String = "insertKefedElement";

		public var el:KefedModelElement;
		public var xml:XML;

		// Constructor
		public function InsertKefedElementEvent(el:KefedModelElement,
												xml:XML, 
												bubbles:Boolean=false, 
												cancelable:Boolean=false)
		{
			super(INSERT_KEFED_ELEMENT, bubbles, cancelable);
			this.el = el;
			this.xml = xml;
		}

		// Override the inherited clone() method, but don't return any state.
		override public function clone():Event 
		{
			return new InsertKefedElementEvent(el, xml, bubbles, cancelable);
		}

	}

}