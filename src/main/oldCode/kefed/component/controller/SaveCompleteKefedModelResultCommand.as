package edu.isi.bmkeg.kefed.component.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.services.extKefed.IExtendedKefedService;
	import edu.isi.bmkeg.kefed.events.*;
	import edu.isi.bmkeg.kefed.diagram.controller.events.*;
	import edu.isi.bmkeg.kefed.component.model.KefedComponentModel;
	
	import flash.events.Event;
	
	public class SaveCompleteKefedModelResultCommand extends Command
	{
	
		[Inject]
		public var event:SaveCompleteKefedModelResultEvent;

		[Inject]
		public var model:KefedComponentModel;
				
		override public function execute():void
		{
//			service.saveCompleteKefedModel(event.kefedModel);
		}
		
	}
	
}