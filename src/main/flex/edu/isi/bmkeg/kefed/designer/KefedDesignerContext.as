package edu.isi.bmkeg.kefed.designer
{
	
	import flash.display.DisplayObjectContainer;

	import org.robotlegs.mvcs.Context;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;

	import edu.isi.bmkeg.kefed.diagram.controller.events.*;	
	import edu.isi.bmkeg.kefed.diagram.view.KefedDiagramModule;

	import edu.isi.bmkeg.kefed.designer.events.elementLevel.*;	
	import edu.isi.bmkeg.kefed.designer.controller.translateDiagram.*;	
	import edu.isi.bmkeg.kefed.designer.controller.elementLevel.*;	
	
	import edu.isi.bmkeg.kefed.designer.model.*;
	import edu.isi.bmkeg.kefed.designer.service.*;	
	import edu.isi.bmkeg.kefed.designer.view.*;

	import edu.isi.bmkeg.ooevv.editor.controller.*;
	import edu.isi.bmkeg.ooevv.editor.model.*;
	import edu.isi.bmkeg.ooevv.editor.view.*;

	import edu.isi.bmkeg.ooevv.rl.events.*;
	import edu.isi.bmkeg.ooevv.events.*;
	import edu.isi.bmkeg.ooevv.rl.services.IOoevvService;
	import edu.isi.bmkeg.ooevv.rl.services.impl.OoevvServiceImpl;
	import edu.isi.bmkeg.ooevv.rl.services.serverInteraction.IOoevvServer;
	import edu.isi.bmkeg.ooevv.rl.services.serverInteraction.impl.OoevvServerImpl;
	
	import edu.isi.bmkeg.pagedList.model.*;
	import edu.isi.bmkeg.pagedList.events.*;
	
	public class KefedDesignerContext extends ModuleContext
	{
		
		override public function startup():void
		{
			injector.mapSingleton(KefedDesignerModel);
			injector.mapSingletonOf(IKefedService, KefedService);
			injector.mapSingleton(PagedListModel);

			// Events from KefedDiagram and translated to KefedDesigner events
			moduleCommandMap.mapEvent(AddFlareNodeEvent.ADD_FLARE_NODE, TranslateAddFlareNodeCommand);
			moduleCommandMap.mapEvent(AddFlareEdgeEvent.ADD_FLARE_EDGE, TranslateAddFlareEdgeCommand);
			moduleCommandMap.mapEvent(RemoveFlareNodeEvent.REMOVE_FLARE_NODE, TranslateRemoveFlareNodeCommand);
			moduleCommandMap.mapEvent(RemoveFlareEdgeEvent.REMOVE_FLARE_EDGE, TranslateRemoveFlareEdgeCommand);
			moduleCommandMap.mapEvent(RenameFlareNodeEvent.RENAME_FLARE_NODE, TranslateRenameFlareNodeCommand);
			moduleCommandMap.mapEvent(SelectFlareNodeEvent.SELECT_FLARE_NODE, TranslateSelectFlareNodeCommand);
			moduleCommandMap.mapEvent(AddNewKefedElementEvent.ADD_NEW_KEFED_ELEMENT, DispatchLocallyCommand);

			commandMap.mapEvent(AddNewKefedEdgeEvent.ADD_NEW_KEFED_EDGE, AddNewKefedEdgeCommand);
			commandMap.mapEvent(AddNewKefedElementEvent.ADD_NEW_KEFED_ELEMENT, AddNewKefedElementCommand);
			commandMap.mapEvent(RenameKefedElementEvent.RENAME_KEFED_ELEMENT, RenameKefedElementCommand);
			commandMap.mapEvent(RemoveKefedEdgeEvent.REMOVE_KEFED_EDGE, RemoveKefedEdgeCommand);
			commandMap.mapEvent(RemoveKefedElementEvent.REMOVE_KEFED_ELEMENT, RemoveKefedElementCommand);
			
			mediatorMap.mapView(KefedDesignerView, KefedDesignerMediator);

			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// KefedDiagram 
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			viewMap.mapType(KefedDiagramModule);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// Cytoscape Web 
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			mediatorMap.mapView(CytoscapeWeb, CytoscapeWebMediator);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// OoevvEditor 
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			injector.mapSingleton(OoevvEditorModel);
			injector.mapSingletonOf(IOoevvService, OoevvServiceImpl);
			injector.mapSingletonOf(IOoevvServer, OoevvServerImpl);
			
			mediatorMap.mapView(OoevvElementSetControl, OoevvElementSetControlMediator);
			mediatorMap.mapView(OoevvElementCatalog, OoevvElementCatalogMediator);
			mediatorMap.mapView(OoevvElementEditor, OoevvElementEditorMediator);
			
			// list the ooevv element sets
			commandMap.mapEvent(ListOoevvElementSetEvent.LIST_OOEVVELEMENTSET, 
					ListOoevvElementSetCommand);
			commandMap.mapEvent(ListOoevvElementSetResultEvent.LIST_OOEVVELEMENTSET_RESULT, 
					ListOoevvElementSetResultCommand);
			
			// List the contents of an elements set 
			commandMap.mapEvent(SelectOoevvElementSetEvent.SELECT_OOEVV_ELEMENT_SET, 
					SelectOoevvElementSetCommand);
			commandMap.mapEvent(ListOoevvElementPagedEvent.LIST_OOEVVELEMENT_PAGED, 
					ListOoevvElementPagedCommand);
			commandMap.mapEvent(ListOoevvElementPagedResultEvent.LIST_OOEVVELEMENT_PAGED_RESULT, 
					ListOoevvElementPagedResultCommand);
//			commandMap.mapEvent(SelectOoevvElementEvent.SELECT_OOEVV_ELEMENT, SelectOoevvElementCommand);
//			commandMap.mapEvent(SelectMeasurementScaleEvent.SELECT_MEASUREMENT_SCALE, SelectMeasurementScaleCommand);
			
//			commandMap.mapEvent(LoadOoevvElementSetResultEvent.LOAD_OOEVV_ELEMENT_SET_RESULT, LoadOoevvElementSetResultCommand);
//			commandMap.mapEvent(LoadOoevvElementResultEvent.LOAD_OOEVV_ELEMENT_RESULT, LoadOoevvElementResultCommand);
			
		}
	}
}