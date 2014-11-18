package edu.isi.bmkeg.kefed.designer
{
	
	import flash.display.DisplayObjectContainer;

	import org.robotlegs.mvcs.Context;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;

	import org.cytoscapeweb.CytoscapeWeb;
	
	import edu.isi.bmkeg.kefed.diagram.controller.events.*;	
	import edu.isi.bmkeg.kefed.diagram.view.KefedDiagramModule;

	import edu.isi.bmkeg.ftd.rl.events.*;
	import edu.isi.bmkeg.ftd.rl.services.IFtdService;
	import edu.isi.bmkeg.ftd.rl.services.impl.*;
	import edu.isi.bmkeg.ftd.rl.services.serverInteraction.*;
	import edu.isi.bmkeg.ftd.rl.services.serverInteraction.impl.*;

	import edu.isi.bmkeg.digitalLibrary.events.*;
	import edu.isi.bmkeg.digitalLibrary.rl.events.*;
	import edu.isi.bmkeg.digitalLibrary.services.*;
	import edu.isi.bmkeg.digitalLibrary.services.impl.*;
	import edu.isi.bmkeg.digitalLibrary.services.serverInteraction.*;
	import edu.isi.bmkeg.digitalLibrary.services.serverInteraction.impl.*;
	
	import edu.isi.bmkeg.kefed.designer.controller.translateDiagram.*;	
	import edu.isi.bmkeg.kefed.designer.controller.elementLevel.*;	
	import edu.isi.bmkeg.kefed.events.*;
	import edu.isi.bmkeg.kefed.events.elementLevel.*;	
	import edu.isi.bmkeg.kefed.events.modelLevel.*;
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
	import edu.isi.bmkeg.kefed.designer.controller.moduleLevel.*;
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
	
	public class KefedDesignerContext extends ModuleContext
	{
		
		public function KefedDesignerContext(contextView:DisplayObjectContainer,
													injector:IInjector)
		{
			super(contextView, true, injector);
		}
		
		override public function startup():void
		{

			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// KefedDesigner
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			injector.mapSingleton(KefedDesignerModel);
			injector.mapSingletonOf(IKefedService, KefedServiceImpl);
			injector.mapSingletonOf(IKefedServer, KefedServerImpl);
			injector.mapSingleton(OoevvElementPagedListModel);
			injector.mapSingletonOf(IExtendedKefedService, ExtendedKefedServiceImpl);
			injector.mapSingletonOf(IExtendedKefedServer, ExtendedKefedServerImpl);

			injector.mapSingletonOf(IExtendedDigitalLibraryService, ExtendedDigitalLibraryServiceImpl);
			injector.mapSingletonOf(IExtendedDigitalLibraryServer, ExtendedDigitalLibraryServerImpl);
			injector.mapSingletonOf(IFtdService, FtdServiceImpl);
			injector.mapSingletonOf(IFtdServer, FtdServerImpl);
			
			commandMap.mapEvent(SaveCompleteKefedModelEvent.SAVE_COMPLETE_KEFED_MODEL, 
				SaveCompleteKefedModelCommand);
			commandMap.mapEvent(SaveCompleteKefedModelResultEvent.SAVE_COMPLETE_KEFED_MODEL_RESULT,
				SaveCompleteKefedModelResultCommand);
			
			// Events from KefedDiagram and translated to KefedDesigner events
			moduleCommandMap.mapEvent(AddFlareNodeEvent.ADD_FLARE_NODE, TranslateAddFlareNodeCommand);
			moduleCommandMap.mapEvent(AddFlareEdgeEvent.ADD_FLARE_EDGE, TranslateAddFlareEdgeCommand);
			moduleCommandMap.mapEvent(RemoveFlareNodeEvent.REMOVE_FLARE_NODE, TranslateRemoveFlareNodeCommand);
			moduleCommandMap.mapEvent(RemoveFlareEdgeEvent.REMOVE_FLARE_EDGE, TranslateRemoveFlareEdgeCommand);
			moduleCommandMap.mapEvent(RenameFlareNodeEvent.RENAME_FLARE_NODE, TranslateRenameFlareNodeCommand);
			moduleCommandMap.mapEvent(SelectFlareNodesInDiagramEvent.SELECT_FLARE_NODE_IN_DIAGRAM, SelectFlareNodeCommand);
			moduleCommandMap.mapEvent(InsertKefedElementEvent.INSERT_KEFED_ELEMENT, DispatchLocallyCommand);
			moduleCommandMap.mapEvent(UpdateKapitXmlEvent.UPDATE_KAPIT_XML, UpdateKapitXmlCommand);
		
			// These events from the digital library must 
			// also be propagated to KEfED designer
			moduleCommandMap.mapEvent(FindArticleCitationByIdResultEvent.FIND_ARTICLECITATIONBY_ID_RESULT, 
				FindArticleCitationByIdResultCommand);
			
			commandMap.mapEvent(InsertKefedEdgeEvent.INSERT_KEFED_EDGE, InsertKefedEdgeCommand);
			commandMap.mapEvent(InsertKefedEdgeResultEvent.INSERT_KEFED_EDGE_RESULT, InsertKefedEdgeResultCommand);

			commandMap.mapEvent(InsertKefedElementEvent.INSERT_KEFED_ELEMENT, InsertKefedElementCommand);
			commandMap.mapEvent(InsertKefedElementResultEvent.INSERT_KEFED_ELEMENT_RESULT, InsertKefedElementResultCommand);
			
			commandMap.mapEvent(RenameKefedElementEvent.RENAME_KEFED_ELEMENT, RenameKefedElementCommand);

			commandMap.mapEvent(DeleteKefedEdgeEvent.DELETE_KEFED_EDGE, DeleteKefedEdgeCommand);
			commandMap.mapEvent(DeleteKefedEdgeResultEvent.DELETE_KEFED_EDGE_RESULT, DeleteKefedEdgeResultCommand);
			
			commandMap.mapEvent(DeleteKefedElementEvent.REMOVE_KEFED_ELEMENT, DeleteKefedElementCommand);
			commandMap.mapEvent(DeleteKefedElementResultEvent.DELETE_KEFED_ELEMENT_RESULT, DeleteKefedElementResultCommand);

			commandMap.mapEvent(ListFTDFragmentEvent.LIST_FTDFRAGMENT, 
				ListFTDFragmentCommand);
		
			commandMap.mapEvent(InsertKefedModelEvent.INSERT_KEFEDMODEL, 
				InsertKefedModelCommand);
			commandMap.mapEvent(InsertKefedModelResultEvent.INSERT_KEFEDMODEL_RESULT, 
				InsertKefedModelResultCommand);

			commandMap.mapEvent(FindKefedModelByIdResultEvent.FIND_KEFEDMODELBY_ID_RESULT, 
				FindKefedModelByIdResultCommand);
			
			commandMap.mapEvent(RetrieveCompleteKefedModelEvent.RETRIEVE_COMPLETE_KEFED_MODEL, 
				RetrieveCompleteKefedModelCommand);
			commandMap.mapEvent(RetrieveCompleteKefedModelResultEvent.RETRIEVE_COMPLETE_KEFED_MODEL_RESULT, 
				RetrieveCompleteKefedModelResultCommand);
			
			commandMap.mapEvent(RetrieveFragmentTreeEvent.RETRIEVE_FRAGMENT_TREE, 
				RetrieveFragmentTreeCommand);
			commandMap.mapEvent(RetrieveFragmentTreeResultEvent.RETRIEVE_FRAGMENT_TREE_RESULT, 
				RetrieveFragmentTreeResultCommand);

			commandMap.mapEvent(RetrieveKefedModelTreeEvent.RETRIEVE_KEFED_MODEL_TREE, 
				RetrieveKefedModelTreeCommand);
			commandMap.mapEvent(RetrieveKefedModelTreeResultEvent.RETRIEVE_KEFED_MODEL_TREE_RESULT, 
				RetrieveKefedModelTreeResultCommand);

			commandMap.mapEvent(CreateNewKefedModelForFragmentEvent.CREATE_NEW_KEFED_MODEL_FOR_FRAGMENT, 
				CreateNewKefedModelForFragmentCommand);
			commandMap.mapEvent(CreateNewKefedModelForFragmentResultEvent.CREATE_NEW_KEFED_MODEL_FOR_FRAGMENT_RESULT, 
				CreateNewKefedModelForFragmentResultCommand);
			
			commandMap.mapEvent(UpdateKefedModelEvent.UPDATE_KEFEDMODEL,
				UpdateKefedModelCommand);
			commandMap.mapEvent(UpdateKefedModelResultEvent.UPDATE_KEFEDMODEL_RESULT, 
				UpdateKefedModelResultCommand);

			commandMap.mapEvent(DeleteCompleteKefedModelEvent.DELETE_COMPLETE_KEFED_MODEL,
				DeleteCompleteKefedModelCommand);
			commandMap.mapEvent(DeleteCompleteKefedModelResultEvent.DELETE_COMPLETE_KEFED_MODEL_RESULT, 
				DeleteCompleteKefedModelResultCommand);
			
			mediatorMap.mapView(KefedModelListControl, KefedModelListControlMediator);
			mediatorMap.mapView(KefedDesignerModule, KefedDesignerMediator);
			mediatorMap.mapView(KefedElementDataStructureControl, KefedElementDataStructureControlMediator);

			// Need a bit of extra detail to deal with popups
			mediatorMap.mapView(KefedModelListPopup, KefedModelListPopupMediator, null, false, false);
			mediatorMap.mapView(EditKefedModelPopup, EditKefedModelPopupMediator, null, false, false);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// KefedDiagram 
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			viewMap.mapType(KefedDiagramModule);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// OoevvEditor 
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			injector.mapSingleton(OoevvEditorModel);
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
			
			// This is the upload event from the UpDownloadButton control...
			commandMap.mapEvent(UploadCompleteEvent.UPLOAD_COMPLETE, UploadOoevvFileCommand);
			commandMap.mapEvent(UploadExcelFileResultEvent.UPLOAD_EXCEL_FILE_RESULT, UploadOoevvFileResultCommand);
			
			// Generate Excel File
			commandMap.mapEvent(GenerateExcelFileEvent.GENERATE_EXCEL_FILE, GenerateExcelFileCommand);
			commandMap.mapEvent(GenerateExcelFileResultEvent.GENERATE_EXCEL_FILE_RESULT, GenerateExcelFileResultCommand);
	
			//			commandMap.mapEvent(SelectOoevvElementEvent.SELECT_OOEVV_ELEMENT, SelectOoevvElementCommand);
//			commandMap.mapEvent(SelectMeasurementScaleEvent.SELECT_MEASUREMENT_SCALE, SelectMeasurementScaleCommand);
			
//			commandMap.mapEvent(LoadOoevvElementSetResultEvent.LOAD_OOEVV_ELEMENT_SET_RESULT, LoadOoevvElementSetResultCommand);
//			commandMap.mapEvent(LoadOoevvElementResultEvent.LOAD_OOEVV_ELEMENT_RESULT, LoadOoevvElementResultCommand);
			
		}
		
		override public function dispose():void
		{
			mediatorMap.removeMediatorByView(contextView);
			super.dispose();
		}
		
	}
}