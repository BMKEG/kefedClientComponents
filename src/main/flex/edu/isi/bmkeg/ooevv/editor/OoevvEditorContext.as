package edu.isi.bmkeg.ooevv.editor
{

	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.core.IInjector;
	import org.robotlegs.mvcs.Context;

	import edu.isi.bmkeg.ooevv.editor.controller.*;	
	import edu.isi.bmkeg.ooevv.rl.events.*;
	
	import edu.isi.bmkeg.ooevv.editor.model.*;
	import edu.isi.bmkeg.ooevv.rl.services.IOoevvService;
	import edu.isi.bmkeg.ooevv.rl.services.impl.OoevvServiceImpl;
	import edu.isi.bmkeg.ooevv.editor.view.*;

	import edu.isi.bmkeg.utils.updownload.*;

	public final class OoevvEditorContext extends Context
	{

		override public function startup():void
		{
			mediatorMap.mapView(OoevvElementSetControl, OoevvElementSetControlMediator);
			mediatorMap.mapView(OoevvElementList, OoevvElementListMediator);
			mediatorMap.mapView(OoevvElementEditor, OoevvElementEditorMediator);
			
			injector.mapSingleton(OoevvEditorModel);
			injector.mapSingletonOf(IOoevvService, OoevvServiceImpl);
			
			commandMap.mapEvent(ListOoevvElementSetEvent.LIST_OOEVVELEMENTSET, ListOoevvElementSetCommand);
			commandMap.mapEvent(UploadCompleteEvent.UPLOAD_COMPLETE, UploadOoevvFileCommand);
			//commandMap.mapEvent(SelectOoevvElementSetEvent.SELECT_OOEVV_ELEMENT_SET, SelectOoevvElementSetCommand);
			//commandMap.mapEvent(SelectOoevvElementEvent.SELECT_OOEVV_ELEMENT, SelectOoevvElementCommand);
			//commandMap.mapEvent(SelectMeasurementScaleEvent.SELECT_MEASUREMENT_SCALE, SelectMeasurementScaleCommand);
			
			// Events to update OoevvEditorModel 
			//commandMap.mapEvent(LoadOoevvElementSetResultEvent.LOAD_OOEVV_ELEMENT_SET_RESULT, LoadOoevvElementSetResultCommand);
			//commandMap.mapEvent(LoadOoevvElementResultEvent.LOAD_OOEVV_ELEMENT_RESULT, LoadOoevvElementResultCommand);

			/*
			injector.mapSingletonOf(IStatusService, SQLStatusService);
			injector.mapSingletonOf(ITaskService, SQLTaskService);
			
			injector.mapSingleton(TaskListModel);
			
			commandMap.mapEvent(UpdateTaskWithStatusEvent.UPDATE, UpdateTaskWithStatusCommand);
			commandMap.mapEvent(SaveTaskEvent.SAVE, SaveTaskCommand);
			commandMap.mapEvent(ConfigureDatabaseEvent.CONFIGURE, ConfigureDatabaseCommand);
			commandMap.mapEvent(DatabaseReadyEvent.READY, LoadStatusesCommand);
			commandMap.mapEvent(StatusesLoadedEvent.LOADED, LoadTasksCommand);
			commandMap.mapEvent(DeleteTaskEvent.DELETE, DeleteTaskCommand);
			commandMap.mapEvent(DatabaseErrorHandlerEvent.ERROR, DatabaseErrorHandlerCommand);
			
			dispatchEvent(new ConfigureDatabaseEvent())*/
		}
		
	}
	
}