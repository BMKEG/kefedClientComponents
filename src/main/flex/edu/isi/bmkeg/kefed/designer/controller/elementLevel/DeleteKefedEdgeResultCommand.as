package edu.isi.bmkeg.kefed.designer.controller.elementLevel
{
	import edu.isi.bmkeg.kefed.model.design.KefedModelEdge;
	import edu.isi.bmkeg.kefed.events.elementLevel.*;
	import edu.isi.bmkeg.kefed.services.IExtendedKefedService;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class DeleteKefedEdgeResultCommand extends Command
	{
	
		[Inject]
		public var event:DeleteKefedEdgeResultEvent;
				
		[Inject]
		public var model:KefedDesignerModel;
		
		[Inject]
		public var service:IExtendedKefedService;
		
		override public function execute():void
		{
			
			if( event.success )
				trace("edge deleted ");
			else 
				trace("edge deletion failed ");

			service.retrieveCompleteKefedModel(model.kefedModel.vpdmfId);
			
		}
		
	}
	
}