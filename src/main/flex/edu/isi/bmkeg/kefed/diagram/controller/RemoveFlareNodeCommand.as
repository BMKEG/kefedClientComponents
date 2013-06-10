package edu.isi.bmkeg.kefed.diagram.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.diagram.controller.events.*;
	import edu.isi.bmkeg.kefed.diagram.model.KefedDiagramModel;
	
	import flash.events.Event;
	
	public class RemoveFlareNodeCommand extends Command
	{
	
		[Inject]
		public var event:RemoveFlareNodeEvent;

		[Inject]
		public var model:KefedDiagramModel;
				
		override public function execute():void
		{
			if( !model.shutDownGraph ) 
				model.removeFlareNode(event.uid);
		}
		
	}
	
}