package edu.isi.bmkeg.kefed.designer.controller.elementLevel
{	
	import edu.isi.bmkeg.kefed.model.design.KefedModelElement;
	import edu.isi.bmkeg.kefed.model.design.KefedModelEdge;
	
	import edu.isi.bmkeg.kefed.designer.events.elementLevel.RemoveKefedElementEvent;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
	
	import edu.isi.bmkeg.kefed.diagram.controller.events.AddFlareNodeEvent;
	import edu.isi.bmkeg.kefed.diagram.model.vo.FlareNode;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	
	public class RemoveKefedElementCommand extends Command
	{
	
		[Inject]
		public var event:RemoveKefedElementEvent;
				
		[Inject]
		public var model:KefedDesignerModel;

		override public function execute():void
		{
			trace("Removing KefedModelElement"); 
			var uid:String = event.uid;

			var remCount:int = 0;
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
			
			for( var j:int=0; j<model.kefedModel.elements.length; j++) {
				
				var n:KefedModelElement = KefedModelElement(
					model.kefedModel.elements.getItemAt(j)
					);
				
				if( n.uuid == uid ) {
					model.kefedModel.elements.removeItemAt(j);
					n.model == null;
					break;
				}			
				
			}	
			
		}
		
	}
	
}