package edu.isi.bmkeg.kefed.designer.controller.translateDiagram
{	
	
	import edu.isi.bmkeg.kefed.model.design.KefedModelEdge;
	import edu.isi.bmkeg.kefed.model.design.KefedModelElement;
	import edu.isi.bmkeg.kefed.events.elementLevel.*;
	import edu.isi.bmkeg.kefed.designer.model.*;
	import edu.isi.bmkeg.kefed.diagram.controller.events.*;
	import edu.isi.bmkeg.kefed.diagram.model.KefedDiagramModel;
	import edu.isi.bmkeg.kefed.model.flare.FlareEdge;
	
	import flash.events.ErrorEvent;
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Command;	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	
	public class SelectFlareEdgeCommand extends Command
	{
	
		[Inject]
		public var event:SelectFlareEdgesInDiagramEvent;

		[Inject]
		public var moduleDispatcher:IModuleEventDispatcher;
		
		[Inject]
		public var model:KefedDesignerModel;

		override public function execute():void
		{

			for each (var ed1:Object in event.edges) {
				for each (var ed2:KefedModelEdge in model.kefedModel.edges) {		
					if( ed2.source.uuid == ed1.sourceUid && ed2.target.uuid == ed1.targetUid ) {
						model.kefedEdges.addItem(ed2);
					}
				}
			}
			
		}
		
	}
	
}