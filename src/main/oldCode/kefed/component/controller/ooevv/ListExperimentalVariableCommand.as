package edu.isi.bmkeg.kefed.component.controller.ooevv
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.ooevv.rl.services.IOoevvService;
	import edu.isi.bmkeg.ooevv.rl.events.ListExperimentalVariableEvent;
	
	import flash.events.Event;
	
	public class ListExperimentalVariableCommand extends Command
	{
	
		[Inject]
		public var event:ListExperimentalVariableEvent;

		[Inject]
		public var service:IOoevvService;
				
		override public function execute():void
		{
			service.listExperimentalVariable(event.object);
		}
		
	}
	
}