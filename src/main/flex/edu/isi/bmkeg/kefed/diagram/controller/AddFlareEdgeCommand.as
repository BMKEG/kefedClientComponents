package edu.isi.bmkeg.kefed.diagram.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.diagram.controller.events.AddFlareEdgeEvent;
	import edu.isi.bmkeg.kefed.diagram.model.KefedDiagramModel;
	
	import flash.events.Event;
	
	public class AddFlareEdgeCommand extends Command
	{
	
		[Inject]
		public var event:AddFlareEdgeEvent;

		[Inject]
		public var model:KefedDiagramModel;
				
		override public function execute():void
		{
			if( !model.shutDownGraph ) 
				model.createFlareEdge(event.sourceUid, event.targetUid, event.linkUid);
		}
		
	}
	
}