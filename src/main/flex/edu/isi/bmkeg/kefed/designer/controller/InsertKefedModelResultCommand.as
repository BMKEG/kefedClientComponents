package edu.isi.bmkeg.kefed.designer.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.events.*;
	import edu.isi.bmkeg.kefed.rl.events.*;
	import edu.isi.bmkeg.kefed.rl.services.IKefedService;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel
	
	import flash.events.Event;
	
	public class InsertKefedModelResultCommand extends Command
	{
	
		[Inject]
		public var event:InsertKefedModelResultEvent;
				
		override public function execute():void
		{
			dispatch( new RetrieveCompleteKefedModelEvent( event.id ));
		}
		
	}
	
}