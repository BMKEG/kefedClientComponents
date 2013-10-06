package edu.isi.bmkeg.kefed.designer.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.services.IExtendedKefedService;
	import edu.isi.bmkeg.kefed.events.SaveCompleteKefedModelEvent;
	import edu.isi.bmkeg.kefed.diagram.controller.events.*;
	import edu.isi.bmkeg.kefed.diagram.model.KefedDiagramModel;
	
	import flash.events.Event;
	
	public class SaveCompleteKefedModelCommand extends Command
	{
	
		[Inject]
		public var event:SaveCompleteKefedModelEvent;

		[Inject]
		public var service:IExtendedKefedService;
				
		override public function execute():void
		{
			service.saveCompleteKefedModel(event.kefedModel);
		}
		
	}
	
}