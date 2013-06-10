package edu.isi.bmkeg.kefed.designer.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.designer.events.modelLevel.*;
	import edu.isi.bmkeg.kefed.diagram.controller.events.*;
	import edu.isi.bmkeg.kefed.diagram.model.KefedDiagramModel;
	
	import flash.events.Event;
	
	public class ListKefedModelsCommand extends Command
	{
	
		[Inject]
		public var event:ListKefedModelsEvent;

		[Inject]
		public var kefedDiagramModel:KefedDiagramModel;
				
		override public function execute():void
		{
//			kefedDiagramModel.createFlareEdge(event.sourceUid, event.targetUid, event.linkUid);
		}
		
	}
	
}