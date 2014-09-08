package edu.isi.bmkeg.kefed.diagram.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.diagram.controller.events.SelectFlareNodeInDiagramEvent;
	import edu.isi.bmkeg.kefed.diagram.model.KefedDiagramModel;
	
	import flash.events.Event;
	
	public class SelectFlareNodeCommand extends Command
	{
	
		[Inject]
		public var event:SelectFlareNodeInDiagramEvent;

		[Inject]
		public var kefedDiagramModel:KefedDiagramModel;
				
		override public function execute():void
		{
			// TODO: NEED TO USE A BETTER WAY OF SELECTING NODES FROM THE APP
			
			//kefedDiagramModel.selectNode(event.uid);
		}
		
	}
	
}