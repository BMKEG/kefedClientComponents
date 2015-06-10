package edu.isi.bmkeg.kefed.component
{
	
	import edu.isi.bmkeg.bioscholar.rl.events.*;
	import edu.isi.bmkeg.bioscholar.rl.services.IBioscholarService;
	import edu.isi.bmkeg.bioscholar.rl.services.impl.BioscholarServiceImpl;
	import edu.isi.bmkeg.bioscholar.rl.services.serverInteraction.IBioscholarServer;
	import edu.isi.bmkeg.bioscholar.rl.services.serverInteraction.impl.BioscholarServerImpl;
	import edu.isi.bmkeg.digitalLibrary.events.*;
	import edu.isi.bmkeg.digitalLibrary.services.*;
	import edu.isi.bmkeg.digitalLibrary.services.impl.*;
	import edu.isi.bmkeg.digitalLibrary.services.serverInteraction.*;
	import edu.isi.bmkeg.digitalLibrary.services.serverInteraction.impl.*;
	import edu.isi.bmkeg.ftd.rl.events.*;
	import edu.isi.bmkeg.ftd.rl.services.IFtdService;
	import edu.isi.bmkeg.ftd.rl.services.impl.*;
	import edu.isi.bmkeg.ftd.rl.services.serverInteraction.*;
	import edu.isi.bmkeg.ftd.rl.services.serverInteraction.impl.*;
	import edu.isi.bmkeg.kefed.component.controller.*;
	import edu.isi.bmkeg.kefed.component.controller.ooevv.*;
	import edu.isi.bmkeg.kefed.component.model.*;
	import edu.isi.bmkeg.kefed.component.view.*;
	import edu.isi.bmkeg.kefed.component.view.store.vpdmf.*;
	import edu.isi.bmkeg.kefed.designer.view.popups.*;
	import edu.isi.bmkeg.kefed.events.*;
	import edu.isi.bmkeg.kefed.events.elementLevel.*;
	import edu.isi.bmkeg.kefed.events.modelLevel.*;
	import edu.isi.bmkeg.kefed.rl.events.*;
	import edu.isi.bmkeg.kefed.rl.services.IKefedService;
	import edu.isi.bmkeg.kefed.rl.services.impl.*;
	import edu.isi.bmkeg.kefed.rl.services.serverInteraction.*;
	import edu.isi.bmkeg.kefed.rl.services.serverInteraction.impl.*;
	import edu.isi.bmkeg.kefed.services.extKefed.*;
	import edu.isi.bmkeg.kefed.services.extKefed.impl.*;
	import edu.isi.bmkeg.kefed.services.extKefed.serverInteraction.*;
	import edu.isi.bmkeg.kefed.services.extKefed.serverInteraction.impl.*;
	import edu.isi.bmkeg.ooevv.editor.controller.*;
	import edu.isi.bmkeg.ooevv.editor.model.*;
	import edu.isi.bmkeg.ooevv.editor.view.*;
	import edu.isi.bmkeg.ooevv.events.*;
	import edu.isi.bmkeg.ooevv.rl.events.*;
	import edu.isi.bmkeg.ooevv.rl.services.IOoevvService;
	import edu.isi.bmkeg.ooevv.rl.services.impl.OoevvServiceImpl;
	import edu.isi.bmkeg.ooevv.rl.services.serverInteraction.IOoevvServer;
	import edu.isi.bmkeg.ooevv.rl.services.serverInteraction.impl.OoevvServerImpl;
	import edu.isi.bmkeg.ooevv.services.IExtendedOoevvService;
	import edu.isi.bmkeg.ooevv.services.impl.ExtendedOoevvServiceImpl;
	import edu.isi.bmkeg.ooevv.services.serverInteraction.IExtendedOoevvServer;
	import edu.isi.bmkeg.ooevv.services.serverInteraction.impl.ExtendedOoevvServerImpl;
	import edu.isi.bmkeg.terminology.rl.events.*;
	import edu.isi.bmkeg.terminology.rl.services.ITerminologyService;
	import edu.isi.bmkeg.terminology.rl.services.impl.TerminologyServiceImpl;
	import edu.isi.bmkeg.terminology.rl.services.serverInteraction.ITerminologyServer;
	import edu.isi.bmkeg.terminology.rl.services.serverInteraction.impl.TerminologyServerImpl;

	import edu.isi.bmkeg.pagedList.events.*;
	import edu.isi.bmkeg.pagedList.model.*;
	import edu.isi.bmkeg.utils.dao.*;
	import edu.isi.bmkeg.utils.updownload.*;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.core.IInjector;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;
		
	public class KefedComponentContext extends ModuleContext
	{
		
		public function KefedComponentContext(contextView:DisplayObjectContainer,
													injector:IInjector)
		{
			super(contextView, true, injector);
		}
		
		override public function startup():void
		{

			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// KefedDesigner
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			injector.mapSingleton(KefedComponentModel);
			injector.mapSingletonOf(IBioscholarService, BioscholarServiceImpl);
			injector.mapSingletonOf(IBioscholarServer, BioscholarServerImpl);
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

			commandMap.mapEvent(ListKefedModelEvent.LIST_KEFEDMODEL, 
				ListKefedModelCommand);
			commandMap.mapEvent(ListKefedModelResultEvent.LIST_KEFEDMODEL_RESULT, 
				ListKefedModelResultCommand);
						
			commandMap.mapEvent(RetrieveCompleteKefedModelFromUuidEvent.RETRIEVE_COMPLETE_KEFED_MODEL_FROM_UUID, 
				RetrieveCompleteKefedModelFromUuidCommand);
			commandMap.mapEvent(RetrieveCompleteKefedModelResultEvent.RETRIEVE_COMPLETE_KEFED_MODEL_RESULT, 
				RetrieveCompleteKefedModelResultCommand);

			commandMap.mapEvent(DeleteCompleteKefedModelFromUidEvent.DELETE_COMPLETE_KEFED_MODEL_FROM_UID, 
				DeleteCompleteKefedModelFromUidCommand);
			commandMap.mapEvent(DeleteCompleteKefedModelResultEvent.DELETE_COMPLETE_KEFED_MODEL_RESULT, 
				DeleteCompleteKefedModelResultCommand);
			
			commandMap.mapEvent(InsertInstantiatedKefedModelEvent.INSERT_INSTANTIATED_KEFED_MODEL, 
				InsertInstantiatedKefedModelCommand);
			commandMap.mapEvent(InsertInstantiatedKefedModelResultEvent.INSERT_INSTANTIATED_KEFED_MODEL_RESULT, 
				InsertInstantiatedKefedModelResultCommand);
			
			commandMap.mapEvent(ListOoevvProcessEvent.LIST_OOEVVPROCESS, ListOoevvProcessCommand);
			commandMap.mapEvent(ListOoevvProcessResultEvent.LIST_OOEVVPROCESS_RESULT, ListOoevvProcessResultCommand);

			commandMap.mapEvent(ListOoevvEntityEvent.LIST_OOEVVENTITY, ListOoevvEntityCommand);
			commandMap.mapEvent(ListOoevvEntityResultEvent.LIST_OOEVVENTITY_RESULT, ListOoevvEntityResultCommand);

			commandMap.mapEvent(ListExperimentalVariableEvent.LIST_EXPERIMENTALVARIABLE, 
					ListExperimentalVariableCommand);
			commandMap.mapEvent(ListExperimentalVariableResultEvent.LIST_EXPERIMENTALVARIABLE_RESULT, 
					ListExperimentalVariableResultCommand);

			commandMap.mapEvent(ListMeasurementScaleEvent.LIST_MEASUREMENTSCALE, 
				ListMeasurementScaleCommand);
			commandMap.mapEvent(ListMeasurementScaleResultEvent.LIST_MEASUREMENTSCALE_RESULT, 
				ListMeasurementScaleResultCommand);
			
			mediatorMap.mapView(KefedComponent, KefedComponentMediator);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// OoevvEditor 
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			injector.mapSingleton(OoevvEditorModel);
			injector.mapSingletonOf(IOoevvService, OoevvServiceImpl);
			injector.mapSingletonOf(IOoevvServer, OoevvServerImpl);
			injector.mapSingletonOf(IExtendedOoevvService, ExtendedOoevvServiceImpl);
			injector.mapSingletonOf(IExtendedOoevvServer, ExtendedOoevvServerImpl);
			
			mediatorMap.mapView(OoevvElementCatalog, OoevvElementCatalogMediator);

		}
		
		override public function dispose():void
		{
			mediatorMap.removeMediatorByView(contextView);
			super.dispose();
		}
		
	}
}