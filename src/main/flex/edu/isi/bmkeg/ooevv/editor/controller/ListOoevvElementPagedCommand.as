package edu.isi.bmkeg.ooevv.editor.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.ooevv.editor.model.*;
	import edu.isi.bmkeg.ooevv.rl.services.*;
	import edu.isi.bmkeg.ooevv.rl.events.*;
	
	import flash.events.Event;
	
	public class ListOoevvElementPagedCommand extends Command
	{
	
		[Inject]
		public var event:ListOoevvElementPagedEvent;
						
		[Inject]
		public var ooevvService:IOoevvService;

		override public function execute():void {
			ooevvService.listOoevvElementPaged(event.object, 
				event.offset, 
				event.cnt);
		}
		
	}
	
}