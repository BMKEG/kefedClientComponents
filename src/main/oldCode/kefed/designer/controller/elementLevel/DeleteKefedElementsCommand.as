package edu.isi.bmkeg.kefed.designer.controller.elementLevel
{	
	import edu.isi.bmkeg.kefed.model.design.KefedModelElement;
	import edu.isi.bmkeg.kefed.model.design.KefedModelEdge;
	
	import edu.isi.bmkeg.kefed.events.elementLevel.DeleteKefedElementsEvent;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
	
	import edu.isi.bmkeg.kefed.diagram.controller.events.AddFlareNodeEvent;
	import edu.isi.bmkeg.kefed.model.flare.FlareNode;
	
	import edu.isi.bmkeg.kefed.model.design.*;
	import edu.isi.bmkeg.kefed.services.extKefed.IExtendedKefedService;

	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	
	import mx.collections.ArrayCollection;

	public class DeleteKefedElementsCommand extends Command
	{
	
		[Inject]
		public var event:DeleteKefedElementsEvent;
				
		[Inject]
		public var model:KefedDesignerModel;
		
		[Inject]
		public var service:IExtendedKefedService;

		override public function execute():void
		{

			service.deleteKefedElements(event.uids);

			/*var remCount:int = 0;
			for( var i:int=0; i<model.kefedModel.edges.length; i++) {
				var e:KefedModelEdge = KefedModelEdge(
					model.kefedModel.edges.getItemAt(i-remCount)
					);
				
				if( e.source.uuid == uid || e.target.uuid == uid ) {
					model.kefedModel.edges.removeItemAt(i);
					e.model == null;
					remCount++;
				}			
				
			}	
			
			var el:KefedModelElement = null;
			for( var j:int=0; j<model.kefedModel.elements.length; j++) {
				
				el = KefedModelElement(
					model.kefedModel.elements.getItemAt(j)
					);
				
				if( el.uuid == uid ) {
					model.kefedModel.elements.removeItemAt(j);
					el.model == null;
					break;
				}			
				
			}
			
			if( el == null )
				return;*/
			
				
		}
		
	}
	
}