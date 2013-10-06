package edu.isi.bmkeg.kefed.designer.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.events.*;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
	import edu.isi.bmkeg.kefed.diagram.controller.events.LoadKefedModelToDiagramEvent;
		
	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;
	
	import flash.events.Event;
	
	public class RetrieveCompleteKefedModelResultCommand extends ModuleCommand
	{
	
		[Inject]
		public var event:RetrieveCompleteKefedModelResultEvent;

		[Inject]
		public var model:KefedDesignerModel;
				
		override public function execute():void
		{
			
			model.kefedModel = event.kefedModel;
			dispatchToModules( new LoadKefedModelToDiagramEvent(model.kefedModel) );
			
		}
		
	}
	
}