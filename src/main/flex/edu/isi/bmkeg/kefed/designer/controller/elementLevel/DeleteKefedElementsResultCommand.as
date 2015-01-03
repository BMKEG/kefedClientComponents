package edu.isi.bmkeg.kefed.designer.controller.elementLevel
{
	import edu.isi.bmkeg.kefed.model.design.KefedModelEdge;
	import edu.isi.bmkeg.kefed.events.elementLevel.*;
	import edu.isi.bmkeg.kefed.services.IExtendedKefedService;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class DeleteKefedElementsResultCommand extends Command
	{
	
		[Inject]
		public var event:DeleteKefedElementResultEvent;
				
		[Inject]
		public var model:KefedDesignerModel;
		
		[Inject]
		public var service:IExtendedKefedService;
		
		override public function execute():void
		{
			
			if( event.success )
				trace("element deleted ");
			else 
				trace("element deletion failed ");

			service.retrieveCompleteKefedModel(model.kefedModel.vpdmfId);
			
		}
		
	}
	
}