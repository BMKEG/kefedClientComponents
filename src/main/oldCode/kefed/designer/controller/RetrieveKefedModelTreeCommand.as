package edu.isi.bmkeg.kefed.designer.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.events.*;
	import edu.isi.bmkeg.kefed.services.extKefed.IExtendedKefedService;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel
	
	import flash.events.Event;
	
	public class RetrieveKefedModelTreeCommand extends Command
	{
	
		[Inject]
		public var event:RetrieveKefedModelTreeEvent;

		[Inject]
		public var srv:IExtendedKefedService;
				
		override public function execute():void
		{
			srv.retrieveKefedModelTree(event.acId);
		}
		
	}
	
}