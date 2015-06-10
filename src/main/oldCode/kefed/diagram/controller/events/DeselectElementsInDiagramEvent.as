package edu.isi.bmkeg.kefed.diagram.controller.events
{	
	import edu.isi.bmkeg.kefed.model.flare.FlareNode;
	
	import flash.events.Event;
	
	public class DeselectElementsInDiagramEvent extends Event
	{
		public static const DESELECT_ELEMENTS_IN_DIAGRAM:String = "deselectElementsInDiagram";
				
		/**
		 * Constructor.
		 */
		public function DeselectElementsInDiagramEvent()
		{
			super(DESELECT_ELEMENTS_IN_DIAGRAM);
		}
		
		/**
		 * Override the inherited clone() method, but don't return any state.
		 */
		override public function clone() : Event
		{
			return new DeselectElementsInDiagramEvent();
		}
		
	}
	
}