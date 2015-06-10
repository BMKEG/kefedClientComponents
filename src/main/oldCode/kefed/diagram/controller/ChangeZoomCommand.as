package edu.isi.bmkeg.kefed.diagram.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.diagram.controller.events.*;
	import edu.isi.bmkeg.kefed.diagram.model.KefedDiagramModel;
	
	import flash.events.Event;
	
	public class ChangeZoomCommand extends Command
	{
	
		[Inject]
		public var event:ChangeZoomEvent;

		[Inject]
		public var kefedDiagramModel:KefedDiagramModel;
				
		override public function execute():void
		{
			kefedDiagramModel.changeZoom(event.zoom);
		}
		
	}
	
}