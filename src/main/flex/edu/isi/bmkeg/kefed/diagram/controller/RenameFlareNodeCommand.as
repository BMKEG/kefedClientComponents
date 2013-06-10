package edu.isi.bmkeg.kefed.diagram.controller
{	
	import edu.isi.bmkeg.kefed.diagram.controller.events.*;
	import edu.isi.bmkeg.kefed.diagram.model.KefedDiagramModel;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class RenameFlareNodeCommand extends Command
	{
	
		[Inject]
		public var event:RenameFlareNodeEvent;

		[Inject]
		public var kefedDiagramModel:KefedDiagramModel;
				
		override public function execute():void
		{
			kefedDiagramModel.renameFlareNode(event.uid, event.name);
		}
		
	}
	
}