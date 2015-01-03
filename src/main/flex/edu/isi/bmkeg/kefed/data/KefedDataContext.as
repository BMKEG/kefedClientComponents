package edu.isi.bmkeg.kefed.data
{
	
	import flash.display.DisplayObjectContainer;

	import org.robotlegs.mvcs.Context;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;

	import edu.isi.bmkeg.kefed.diagram.controller.events.*;	

	import edu.isi.bmkeg.kefed.events.elementLevel.*;	
	import edu.isi.bmkeg.kefed.designer.controller.translateDiagram.*;	
	import edu.isi.bmkeg.kefed.designer.controller.elementLevel.*;	
	import edu.isi.bmkeg.kefed.events.*;
	import edu.isi.bmkeg.kefed.rl.events.*;
	import edu.isi.bmkeg.kefed.rl.services.IKefedService;
	import edu.isi.bmkeg.kefed.rl.services.impl.*;
	import edu.isi.bmkeg.kefed.rl.services.serverInteraction.*;
	import edu.isi.bmkeg.kefed.rl.services.serverInteraction.impl.*;
	import edu.isi.bmkeg.kefed.services.*;
	import edu.isi.bmkeg.kefed.services.impl.*;
	import edu.isi.bmkeg.kefed.services.serverInteraction.*;
	import edu.isi.bmkeg.kefed.services.serverInteraction.impl.*;
	
	import edu.isi.bmkeg.kefed.designer.model.*;
	import edu.isi.bmkeg.kefed.designer.controller.*;
	import edu.isi.bmkeg.kefed.designer.view.*;
	import edu.isi.bmkeg.kefed.designer.view.popups.*;

	import edu.isi.bmkeg.ooevv.editor.controller.*;
	import edu.isi.bmkeg.ooevv.editor.model.*;
	import edu.isi.bmkeg.ooevv.editor.view.*;

	import edu.isi.bmkeg.ooevv.rl.events.*;
	import edu.isi.bmkeg.ooevv.events.*;
	import edu.isi.bmkeg.ooevv.rl.services.IOoevvService;
	import edu.isi.bmkeg.ooevv.rl.services.impl.OoevvServiceImpl;
	import edu.isi.bmkeg.ooevv.rl.services.serverInteraction.IOoevvServer;
	import edu.isi.bmkeg.ooevv.rl.services.serverInteraction.impl.OoevvServerImpl;
	import edu.isi.bmkeg.ooevv.services.IExtendedOoevvService;
	import edu.isi.bmkeg.ooevv.services.impl.ExtendedOoevvServiceImpl;
	import edu.isi.bmkeg.ooevv.services.serverInteraction.IExtendedOoevvServer;
	import edu.isi.bmkeg.ooevv.services.serverInteraction.impl.ExtendedOoevvServerImpl;
	
	import edu.isi.bmkeg.pagedList.model.*;
	import edu.isi.bmkeg.pagedList.events.*;

	import edu.isi.bmkeg.utils.dao.*;
	import edu.isi.bmkeg.utils.updownload.*;
	
	public class KefedDataContext extends ModuleContext
	{
		
		override public function startup():void
		{

			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// KefedData
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			/*injector.mapSingleton(KefedDesignerModel);
			injector.mapSingletonOf(IKefedService, KefedServiceImpl);
			injector.mapSingletonOf(IKefedServer, KefedServerImpl);
			injector.mapSingleton(OoevvElementPagedListModel);
			injector.mapSingletonOf(IExtendedKefedService, ExtendedKefedServiceImpl);
			injector.mapSingletonOf(IExtendedKefedServer, ExtendedKefedServerImpl);*/

			/*commandMap.mapEvent(SaveCompleteKefedModelEvent.SAVE_COMPLETE_KEFED_MODEL, 
				SaveCompleteKefedModelCommand);
			commandMap.mapEvent(SaveCompleteKefedModelResultEvent.SAVE_COMPLETE_KEFED_MODEL_RESULT,
				SaveCompleteKefedModelResultCommand);*/
			
			// Events from KefedDiagram and translated to KefedDesigner events
			/*moduleCommandMap.mapEvent(AddFlareNodeEvent.ADD_FLARE_NODE, TranslateAddFlareNodeCommand);
			moduleCommandMap.mapEvent(AddFlareEdgeEvent.ADD_FLARE_EDGE, TranslateAddFlareEdgeCommand);
			moduleCommandMap.mapEvent(RemoveFlareNodeEvent.REMOVE_FLARE_NODE, TranslateRemoveFlareNodeCommand);
			moduleCommandMap.mapEvent(RemoveFlareEdgeEvent.REMOVE_FLARE_EDGE, TranslateRemoveFlareEdgeCommand);
			moduleCommandMap.mapEvent(RenameFlareNodeEvent.RENAME_FLARE_NODE, TranslateRenameFlareNodeCommand);
			moduleCommandMap.mapEvent(SelectFlareNodeEvent.SELECT_FLARE_NODE, TranslateSelectFlareNodeCommand);
			moduleCommandMap.mapEvent(AddNewKefedElementEvent.ADD_NEW_KEFED_ELEMENT, DispatchLocallyCommand);
			moduleCommandMap.mapEvent(UpdateKapitXmlEvent.UPDATE_KAPIT_XML, UpdateKapitXmlCommand);
		
			commandMap.mapEvent(AddNewKefedEdgeEvent.ADD_NEW_KEFED_EDGE, AddNewKefedEdgeCommand);
			commandMap.mapEvent(AddNewKefedElementEvent.ADD_NEW_KEFED_ELEMENT, AddNewKefedElementCommand);
			commandMap.mapEvent(RenameKefedElementEvent.RENAME_KEFED_ELEMENT, RenameKefedElementCommand);
			commandMap.mapEvent(RemoveKefedEdgeEvent.REMOVE_KEFED_EDGE, RemoveKefedEdgeCommand);
			commandMap.mapEvent(RemoveKefedElementEvent.REMOVE_KEFED_ELEMENT, RemoveKefedElementCommand);
			
			mediatorMap.mapView(KefedDataModule, KefedDesignerMediator);*/

			// Need a bit of extra detail to deal with popups
			/*mediatorMap.mapView(KefedModelListPopup, KefedModelListPopupMediator, null, false, false);

			commandMap.mapEvent(ListKefedModelEvent.LIST_KEFEDMODEL, 
				ListKefedModelCommand);
			commandMap.mapEvent(ListKefedModelResultEvent.LIST_KEFEDMODEL_RESULT, 
				ListKefedModelResultCommand);
			commandMap.mapEvent(RetrieveCompleteKefedModelEvent.RETRIEVE_COMPLETE_KEFED_MODEL, 
				RetrieveCompleteKefedModelCommand);
			commandMap.mapEvent(RetrieveCompleteKefedModelResultEvent.RETRIEVE_COMPLETE_KEFED_MODEL_RESULT, 
				RetrieveCompleteKefedModelResultCommand);*/
			
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// KefedDiagram 
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			//viewMap.mapType(KefedDiagramModule);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// Cytoscape Web 
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			//mediatorMap.mapView(CytoscapeWeb, CytoscapeWebMediator);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// OoevvEditor 
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			/*injector.mapSingleton(OoevvEditorModel);
			injector.mapSingletonOf(IOoevvService, OoevvServiceImpl);
			injector.mapSingletonOf(IOoevvServer, OoevvServerImpl);
			injector.mapSingletonOf(IExtendedOoevvService, ExtendedOoevvServiceImpl);
			injector.mapSingletonOf(IExtendedOoevvServer, ExtendedOoevvServerImpl);
			
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

			// Retrieve the data for a specific ooevv element set
			commandMap.mapEvent(FindOoevvElementSetByIdEvent.FIND_OOEVVELEMENTSET_BY_ID, 
					FindOoevvElementSetByIdCommand);
			commandMap.mapEvent(FindOoevvElementSetByIdResultEvent.FIND_OOEVVELEMENTSETBY_ID_RESULT, 
					FindOoevvElementSetByIdResultCommand);
			
			// Upload Excel File
			commandMap.mapEvent(UploadCompleteEvent.UPLOAD_COMPLETE, UploadOoevvFileCommand);
			commandMap.mapEvent(UploadExcelFileResultEvent.UPLOAD_EXCEL_FILE_RESULT, UploadOoevvFileResultCommand);
			
			// Generate Excel File
			commandMap.mapEvent(GenerateExcelFileEvent.GENERATE_EXCEL_FILE, GenerateExcelFileCommand);
			commandMap.mapEvent(GenerateExcelFileResultEvent.GENERATE_EXCEL_FILE_RESULT, GenerateExcelFileResultCommand);

			//			commandMap.mapEvent(SelectOoevvElementEvent.SELECT_OOEVV_ELEMENT, SelectOoevvElementCommand);
//			commandMap.mapEvent(SelectMeasurementScaleEvent.SELECT_MEASUREMENT_SCALE, SelectMeasurementScaleCommand);
			
//			commandMap.mapEvent(LoadOoevvElementSetResultEvent.LOAD_OOEVV_ELEMENT_SET_RESULT, LoadOoevvElementSetResultCommand);
//			commandMap.mapEvent(LoadOoevvElementResultEvent.LOAD_OOEVV_ELEMENT_RESULT, LoadOoevvElementResultCommand);*/
			
			
		}
	}
}