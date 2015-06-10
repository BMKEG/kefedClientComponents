package edu.isi.bmkeg.kefed.diagram.controller
{	
	import org.robotlegs.mvcs.Command;

	import mx.managers.PopUpManager;

	import edu.isi.bmkeg.kefed.diagram.controller.events.*;
	import edu.isi.bmkeg.kefed.diagram.model.KefedDiagramModel;
	import edu.isi.bmkeg.kefed.diagram.view.TextDisplayDialog;
	
	import flash.events.Event;
	
	public class ShowKefedSvgCommand extends Command
	{
	
		[Inject]
		public var event:ShowKefedSvgEvent;

		[Inject]
		public var kefedDiagramModel:KefedDiagramModel;
				
		override public function execute():void
		{
			var svg:XML = event.svg;

			kefedDiagramModel.svg = svg;
			
			var d:TextDisplayDialog = new TextDisplayDialog();
			d.title="Diagram in SVG Format";
			d.displayText = svg;

			PopUpManager.addPopUp( d, contextView ); // contextView is defined in Command
			mediatorMap.createMediator( d );			
			
		}
		
	}
	
}