package edu.isi.bmkeg.kefed.designer.controller
{	
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
	import edu.isi.bmkeg.kefed.diagram.controller.events.LoadKefedModelToDiagramEvent;
	import edu.isi.bmkeg.kefed.events.*;
	import edu.isi.bmkeg.kefed.model.flare.FlareGraph;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;
	
	public class RetrieveCompleteKefedModelResultCommand extends ModuleCommand
	{
	
		[Inject]
		public var event:RetrieveCompleteKefedModelResultEvent;

		[Inject]
		public var model:KefedDesignerModel;
				
		override public function execute():void
		{
			
			model.kefedModel = event.kefedModel;
			model.fg = new FlareGraph();
			model.fg.importKefedModel( model.kefedModel );
			
			dispatchToModules( new LoadKefedModelToDiagramEvent(model.kefedModel) );
			
		}
		
	}
	
}