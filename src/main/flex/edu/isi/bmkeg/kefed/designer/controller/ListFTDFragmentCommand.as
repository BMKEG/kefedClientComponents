package edu.isi.bmkeg.kefed.designer.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.ftd.rl.events.*;
	import edu.isi.bmkeg.ftd.rl.services.IFtdService;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel
	
	import flash.events.Event;
	
	public class ListFTDFragmentCommand extends Command
	{
	
		[Inject]
		public var event:ListFTDFragmentEvent;

		[Inject]
		public var srv:IFtdService;
				
		override public function execute():void
		{
			srv.listFTDFragment(event.object);
		}
		
	}
	
}