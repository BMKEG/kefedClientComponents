package edu.isi.bmkeg.kefed.designer.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.events.*;
	import edu.isi.bmkeg.kefed.services.*;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel
	
	import flash.events.Event;
	
	public class RetrieveCompleteKefedModelCommand extends Command
	{
	
		[Inject]
		public var event:RetrieveCompleteKefedModelEvent;

		[Inject]
		public var srv:IExtendedKefedService;
				
		override public function execute():void
		{
			srv.retrieveCompleteKefedModel( event.id );
		}
		
	}
	
}