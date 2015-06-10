package edu.isi.bmkeg.kefed.component.controller.ooevv
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.ooevv.rl.services.IOoevvService;
	import edu.isi.bmkeg.ooevv.rl.events.ListOoevvEntityEvent;
	
	import flash.events.Event;
	
	public class ListOoevvEntityCommand extends Command
	{
	
		[Inject]
		public var event:ListOoevvEntityEvent;

		[Inject]
		public var service:IOoevvService;
				
		override public function execute():void
		{
			service.listOoevvEntity(event.object);
		}
		
	}
	
}