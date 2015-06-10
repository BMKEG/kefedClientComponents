package edu.isi.bmkeg.kefed.component.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.rl.services.IKefedService;
	import edu.isi.bmkeg.kefed.rl.events.ListKefedModelEvent;
	
	import flash.events.Event;
	
	public class ListKefedModelCommand extends Command
	{
	
		[Inject]
		public var event:ListKefedModelEvent;

		[Inject]
		public var service:IKefedService;
				
		override public function execute():void
		{
			service.listKefedModel(event.object);
		}
		
	}
	
}