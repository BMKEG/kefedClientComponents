package edu.isi.bmkeg.kefed.designer.controller.elementLevel
{
	import edu.isi.bmkeg.kefed.model.design.KefedModelEdge;
	import edu.isi.bmkeg.kefed.events.elementLevel.DeleteKefedEdgesEvent;
	import edu.isi.bmkeg.kefed.services.extKefed.IExtendedKefedService;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class DeleteKefedEdgesCommand extends Command
	{
	
		[Inject]
		public var event:DeleteKefedEdgesEvent;
				
		[Inject]
		public var model:KefedDesignerModel;
		
		[Inject]
		public var service:IExtendedKefedService;
		
		override public function execute():void
		{
			
			service.deleteKefedEdges(event.uids);

			/*var uid:String = event.edgeUId;
			
			for( var i:int=0; i<model.kefedModel.edges.length; i++) {
				var e:KefedModelEdge = KefedModelEdge(
					model.kefedModel.edges.getItemAt(i)
				);
				
				if( e.uuid == uid ) {
					model.kefedModel.edges.removeItemAt(i);
					e.model == null;
					break;
				}			
				
			}*/
			
		}
		
	}
	
}