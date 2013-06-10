package edu.isi.bmkeg.kefed.diagram.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.diagram.controller.events.*;
	import edu.isi.bmkeg.kefed.diagram.model.KefedDiagramModel;
	
	import flash.events.Event;
	
	public class RemoveFlareEdgeCommand extends Command
	{
	
		[Inject]
		public var event:RemoveFlareEdgeEvent;

		[Inject]
		public var model:KefedDiagramModel;
				
		override public function execute():void
		{
			if( !model.shutDownGraph ) 
				model.removeFlareEdge(event.uid);
		}
		
	}
	
}