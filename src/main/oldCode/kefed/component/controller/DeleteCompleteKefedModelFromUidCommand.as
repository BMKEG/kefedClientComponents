package edu.isi.bmkeg.kefed.component.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.events.*;
	import edu.isi.bmkeg.kefed.services.extKefed.*;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel
	
	import flash.events.Event;
	
	public class DeleteCompleteKefedModelFromUidCommand extends Command
	{
	
		[Inject]
		public var event:DeleteCompleteKefedModelFromUidEvent;

		[Inject]
		public var srv:IExtendedKefedService;
				
		override public function execute():void
		{
			srv.deleteCompleteKefedModelFromUid( event.uid );
		}
		
	}
	
}