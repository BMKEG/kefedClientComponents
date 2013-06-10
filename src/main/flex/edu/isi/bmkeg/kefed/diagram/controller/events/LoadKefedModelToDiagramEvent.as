package edu.isi.bmkeg.kefed.diagram.controller.events
{	
	import edu.isi.bmkeg.kefed.model.design.KefedModel;
	
	import flash.events.Event;
	
	public class LoadKefedModelToDiagramEvent extends Event
	{
		public static const LOAD_KEFED_MODEL_TO_DIAGRAM:String = "loadKefedModelToDiagram";
		
		public var model:KefedModel;
		
		/**
		 * Constructor.
		 */
		public function LoadKefedModelToDiagramEvent(model:KefedModel)
		{
			super(LOAD_KEFED_MODEL_TO_DIAGRAM);
			this.model = model;
		}
		
		/**
		 * Override the inherited clone() method, but don't return any state.
		 */
		override public function clone() : Event
		{
			return new LoadKefedModelToDiagramEvent(model);
		}
		
	}
	
}