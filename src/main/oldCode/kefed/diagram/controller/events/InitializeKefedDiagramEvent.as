package edu.isi.bmkeg.kefed.diagram.controller.events
{	
	
	import flash.events.Event;
	
	public class InitializeKefedDiagramEvent extends Event
	{
		public static const INITIALIZE_KEFED_DIAGRAM:String = "initializeKefedDiagram";
				
		/**
		 * Constructor.
		 */
		public function InitializeKefedDiagramEvent()
		{
			super(INITIALIZE_KEFED_DIAGRAM);
		}
		
		/**
		 * Override the inherited clone() method, but don't return any state.
		 */
		override public function clone() : Event
		{
			return new InitializeKefedDiagramEvent();
		}
		
	}
	
}