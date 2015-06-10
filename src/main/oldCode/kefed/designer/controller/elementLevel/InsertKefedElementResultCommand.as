package edu.isi.bmkeg.kefed.designer.controller.elementLevel
{
	import edu.isi.bmkeg.kefed.model.design.KefedModelEdge;
	import edu.isi.bmkeg.kefed.events.elementLevel.*;
	import edu.isi.bmkeg.kefed.services.extKefed.IExtendedKefedService;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class InsertKefedElementResultCommand extends Command
	{
	
		[Inject]
		public var event:InsertKefedElementResultEvent;
				
		[Inject]
		public var model:KefedDesignerModel;
		
		[Inject]
		public var service:IExtendedKefedService;
		
		override public function execute():void
		{
			
			if( event.success )
				trace("element inserted ");
			else 
				trace("element insertion failed ");

			service.retrieveCompleteKefedModel(model.kefedModel.vpdmfId);
			
		}
		
	}
	
}