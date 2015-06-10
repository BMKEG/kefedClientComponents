package edu.isi.bmkeg.kefed.component.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.services.extKefed.IExtendedKefedService;
	import edu.isi.bmkeg.kefed.events.modelLevel.*;
	import edu.isi.bmkeg.kefed.component.model.KefedComponentModel;
	
	import flash.events.Event;
	
	public class InsertInstantiatedKefedModelResultCommand extends Command
	{
	
		[Inject]
		public var event:InsertInstantiatedKefedModelResultEvent;

		[Inject]
		public var model:KefedComponentModel;
				
		override public function execute():void
		{
//			service.saveCompleteKefedModel(event.kefedModel);
		}
		
	}
	
}