package edu.isi.bmkeg.kefed.diagram.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.ooevv.editor.model.*;
	import edu.isi.bmkeg.ooevv.rl.services.*;
	import edu.isi.bmkeg.ooevv.rl.events.*;
	
	import flash.events.Event;
	
	public class FindOoevvElementByIdCommand extends Command
	{
	
		[Inject]
		public var event:FindOoevvElementByIdEvent;
						
		[Inject]
		public var ooevvService:IOoevvService;

		override public function execute():void {
			ooevvService.findOoevvElementById(event.id);
		}
		
	}
	
}