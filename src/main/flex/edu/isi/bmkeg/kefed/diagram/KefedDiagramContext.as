package edu.isi.bmkeg.kefed.diagram
{
	
	import edu.isi.bmkeg.kefed.diagram.controller.*;	
	import edu.isi.bmkeg.kefed.diagram.controller.events.*;
	
	import edu.isi.bmkeg.kefed.diagram.model.*;
	import edu.isi.bmkeg.kefed.diagram.view.*;

	import edu.isi.bmkeg.kefed.events.modelLevel.*;
	import edu.isi.bmkeg.ooevv.rl.events.*;

	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;

	public class KefedDiagramContext extends ModuleContext
	{

		public function KefedDiagramContext(contextView:DisplayObjectContainer,  injector:IInjector)
		{
			super(contextView, true, injector);
		}
		
		override public function startup():void
		{
			injector.mapSingleton(KefedDiagramModel);
			injector.mapSingleton(KefedDiagramModule);

			mediatorMap.mapView(KapitDiagramView, KapitDiagramViewMediator);
			mediatorMap.mapView(KefedDiagramModule, KefedDiagramMediator);
			mediatorMap.mapView(TextDisplayDialog, TextDisplayDialogMediator, null, false, false);
			
			commandMap.mapEvent(ChangeZoomEvent.CHANGE_ZOOM, ChangeZoomCommand);
			commandMap.mapEvent(AddFlareEdgeEvent.ADD_FLARE_EDGE, AddFlareEdgeCommand);
			commandMap.mapEvent(AddFlareNodeEvent.ADD_FLARE_NODE, AddFlareNodeCommand);
			commandMap.mapEvent(RenameFlareNodeEvent.RENAME_FLARE_NODE, RenameFlareNodeCommand);
			commandMap.mapEvent(RemoveFlareEdgeEvent.REMOVE_FLARE_EDGE, RemoveFlareEdgeCommand);
			commandMap.mapEvent(RemoveFlareNodeEvent.REMOVE_FLARE_NODE, RemoveFlareNodeCommand);
			commandMap.mapEvent(ShowKefedSvgEvent.SHOW_KEFED_SVG, ShowKefedSvgCommand);
			commandMap.mapEvent(DropKefedNodeIntoDiagramEvent.DROP_KEFED_NODE_INTO_DIAGRAM, DropKefedNodeIntoDiagramCommand);
			commandMap.mapEvent(LoadFlareGraphEvent.LOAD_FLARE_GRAPH, LoadFlareGraphCommand);

			commandMap.mapEvent(SelectFlareNodeInDiagramEvent.SELECT_FLARE_NODE_IN_DIAGRAM, SelectFlareNodeCommand);
			
			commandMap.mapEvent(FindOoevvElementByIdEvent.FIND_OOEVVELEMENT_BY_ID, 
				FindOoevvElementByIdCommand);

			moduleCommandMap.mapEvent(SelectFlareNodeInDiagramEvent.SELECT_FLARE_NODE_IN_DIAGRAM, SelectFlareNodeCommand);
			moduleCommandMap.mapEvent(LoadKefedModelToDiagramEvent.LOAD_KEFED_MODEL_TO_DIAGRAM, LoadKefedModelToDiagramCommand);
		}
		
		override public function dispose():void
		{
			mediatorMap.removeMediatorByView(contextView);
			super.dispose();
		}
		
	}
	
}