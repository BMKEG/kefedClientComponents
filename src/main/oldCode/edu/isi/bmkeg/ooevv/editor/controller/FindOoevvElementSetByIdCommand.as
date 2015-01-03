package edu.isi.bmkeg.ooevv.editor.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.ooevv.editor.model.*;
	import edu.isi.bmkeg.ooevv.events.*;
	
	import edu.isi.bmkeg.ooevv.rl.events.*;
	import edu.isi.bmkeg.ooevv.rl.services.IOoevvService;
	
	import flash.events.Event;
	
	public class FindOoevvElementSetByIdCommand extends Command
	{
	
		[Inject]
		public var event:FindOoevvElementSetByIdEvent;
						
		[Inject]
		public var ooevvService:IOoevvService;

		override public function execute():void
		{
			ooevvService.findOoevvElementSetById(event.id);
		}
		
	}
	
}