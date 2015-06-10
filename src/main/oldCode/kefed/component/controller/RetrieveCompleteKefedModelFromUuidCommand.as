package edu.isi.bmkeg.kefed.component.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.events.*;
	import edu.isi.bmkeg.kefed.services.extKefed.*;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel
	
	import flash.events.Event;
	
	public class RetrieveCompleteKefedModelFromUuidCommand extends Command
	{
	
		[Inject]
		public var event:RetrieveCompleteKefedModelFromUuidEvent;

		[Inject]
		public var srv:IExtendedKefedService;
				
		override public function execute():void
		{
			srv.retrieveCompleteKefedModelFromUuid( event.uuid );
		}
		
	}
	
}