package edu.isi.bmkeg.kefed.diagram.controller
{	
	import edu.isi.bmkeg.kefed.diagram.controller.events.*;
	import edu.isi.bmkeg.kefed.diagram.model.KefedDiagramModel;
	import edu.isi.bmkeg.kefed.events.modelLevel.*;
	import edu.isi.bmkeg.kefed.model.design.KefedModel;
	import edu.isi.bmkeg.kefed.model.flare.FlareGraph;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class LoadKefedModelToDiagramCommand extends Command
	{
	
		[Inject]
		public var event:LoadKefedModelToDiagramEvent;

		[Inject]
		public var kefedDiagramModel:KefedDiagramModel;
				
		override public function execute():void
		{
			var km:KefedModel = event.model;
			var xml:XML = XML( km.diagramXML );

			var fg:FlareGraph = new FlareGraph();
			fg.importKefedModel(km);

			kefedDiagramModel.flareGraph = fg;
			
			dispatch( new LoadFlareGraphEvent(fg, xml) );

		}
		
	}
	
}