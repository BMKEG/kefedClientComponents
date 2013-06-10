package edu.isi.bmkeg.kefed.diagram.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.diagram.controller.events.SelectFlareNodeEvent;
	import edu.isi.bmkeg.kefed.diagram.model.KefedDiagramModel;
	
	import flash.events.Event;
	
	public class SelectFlareNodeCommand extends Command
	{
	
		[Inject]
		public var event:SelectFlareNodeEvent;

		[Inject]
		public var kefedDiagramModel:KefedDiagramModel;
				
		override public function execute():void
		{
			kefedDiagramModel.selectNode(event.uid);
		}
		
	}
	
}