package edu.isi.bmkeg.kefed.component.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.services.extKefed.IExtendedKefedService;
	import edu.isi.bmkeg.kefed.events.modelLevel.*;
	
	import flash.events.Event;
	
	public class InsertInstantiatedKefedModelCommand extends Command
	{
	
		[Inject]
		public var event:InsertInstantiatedKefedModelEvent;

		[Inject]
		public var service:IExtendedKefedService;
				
		override public function execute():void
		{
			service.saveCompleteKefedModel(event.completeModel);
		}
		
	}
	
}