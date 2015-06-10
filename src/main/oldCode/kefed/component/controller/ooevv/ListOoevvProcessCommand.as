package edu.isi.bmkeg.kefed.component.controller.ooevv
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.ooevv.rl.services.IOoevvService;
	import edu.isi.bmkeg.ooevv.rl.events.ListOoevvProcessEvent;
	
	import flash.events.Event;
	
	public class ListOoevvProcessCommand extends Command
	{
	
		[Inject]
		public var event:ListOoevvProcessEvent;

		[Inject]
		public var service:IOoevvService;
				
		override public function execute():void
		{
			service.listOoevvProcess(event.object);
		}
		
	}
	
}