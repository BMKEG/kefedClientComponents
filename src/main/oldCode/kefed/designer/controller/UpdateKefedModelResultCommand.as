package edu.isi.bmkeg.kefed.designer.controller
{	
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
	import edu.isi.bmkeg.kefed.events.*;
	import edu.isi.bmkeg.kefed.rl.events.*;
	import edu.isi.bmkeg.kefed.rl.services.IKefedService;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class UpdateKefedModelResultCommand extends Command
	{
	
		[Inject]
		public var event:UpdateKefedModelResultEvent;
				
		override public function execute():void
		{
			var pauseHere:int = 0;
			//dispatch( new RetrieveCompleteKefedModelEvent( event.id ));
		}
		
	}
	
}