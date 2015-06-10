package edu.isi.bmkeg.kefed.diagram.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.diagram.controller.events.AddFlareNodeEvent;
	import edu.isi.bmkeg.kefed.diagram.model.KefedDiagramModel;
	
	import flash.events.Event;
	
	public class AddFlareNodeCommand extends Command
	{
	
		[Inject]
		public var event:AddFlareNodeEvent;

		[Inject]
		public var model:KefedDiagramModel;
				
		override public function execute():void
		{
			if( !model.shutDownGraph ) 
				model.addFlareNode(event.el);
		}
		
	}
	
}