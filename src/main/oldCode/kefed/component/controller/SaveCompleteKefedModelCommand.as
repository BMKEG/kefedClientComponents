package edu.isi.bmkeg.kefed.component.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.services.extKefed.IExtendedKefedService;
	import edu.isi.bmkeg.kefed.events.SaveCompleteKefedModelEvent;
	
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