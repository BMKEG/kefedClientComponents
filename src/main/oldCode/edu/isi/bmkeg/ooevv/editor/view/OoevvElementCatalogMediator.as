package edu.isi.bmkeg.ooevv.editor.view
{
	
	import edu.isi.bmkeg.ooevv.editor.controller.*;
	import edu.isi.bmkeg.ooevv.editor.model.*;
	import edu.isi.bmkeg.ooevv.editor.view.*;
	import edu.isi.bmkeg.ooevv.events.*;
	import edu.isi.bmkeg.ooevv.model.*;
	import edu.isi.bmkeg.ooevv.model.qo.*;
	import edu.isi.bmkeg.ooevv.model.scale.*;
	import edu.isi.bmkeg.ooevv.rl.events.*;
	import edu.isi.bmkeg.pagedList.events.*;
	import edu.isi.bmkeg.pagedList.model.*;
	import edu.isi.bmkeg.utils.updownload.*;
	
	import flash.events.*;
	import flash.net.FileReference;
	import flash.utils.ByteArray;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	
	// added to overcome 'class not found errors'
	//private var hackFix1:KefedObjectProxy;
	//private var hackFix2:KefedLinkProxy;
	
	public class OoevvElementCatalogMediator extends ModuleMediator
	{

		[Inject]
		public var view:OoevvElementCatalog;
		
		[Inject]
		public var model:OoevvEditorModel;
		
		[Inject]
		public var listModel:OoevvElementPagedListModel;
		
		override public function onRegister():void 
		{

			addContextListener(FindOoevvElementSetByIdResultEvent.FIND_OOEVVELEMENTSETBY_ID_RESULT, 
				oesUpdatedHandler);
			
			addContextListener(PagedListUpdatedEvent.UPDATED + OoevvElementPagedListModel.LIST_ID, 
				catalogueUpdatedHandler);
			
			addContextListener(ListOoevvElementResultEvent.LIST_OOEVVELEMENT_RESULT, 
				updateVariableListControl);

			addContextListener(UploadExcelFileFaultEvent.UPLOAD_EXCEL_FILE_FAULT, 
				reportUploadError);
			
			addContextListener(ListOoevvElementSetResultEvent.LIST_OOEVVELEMENTSET_RESULT, 
				updateOoevvElementListControl);

			addContextListener(GenerateExcelFileResultEvent.GENERATE_EXCEL_FILE_RESULT, 
				activateNewFileButton);

			addViewListener(SaveNewFileEvent.SAVE_NEW_FILE, 
				saveFile);
			
			addViewListener(ClearUpdownloadEvent.CLEAR_UPDOWNLOAD, 
				clearUpdownload);
			
			addViewListener(ListOoevvElementSetEvent.LIST_OOEVVELEMENTSET, 
				dispatch);
			
			addViewListener(ListOoevvElementEvent.LIST_OOEVVELEMENT, 
				dispatch);
			
			addViewListener(SelectOoevvElementSetEvent.SELECT_OOEVV_ELEMENT_SET, 
				dispatch);

			addViewListener(UploadCompleteEvent.UPLOAD_COMPLETE, 
				dispatch);
			
			addViewListener(GenerateExcelFileEvent.GENERATE_EXCEL_FILE, 
				dispatch);
			
			var oes:OoevvElementSet_qo = new OoevvElementSet_qo();
			dispatch(new ListOoevvElementSetEvent(oes));

			var oe:OoevvElement_qo = new OoevvElement_qo();
			dispatch(new ListOoevvElementPagedEvent(oe, 0, 200));
			
			dispatch( new GenerateExcelFileEvent("new_ooevv.xls") )
			
		}
		
		private function updateOoevvElementListControl(event:ListOoevvElementSetResultEvent):void {
			
			view.ooevvElementSetCombo.dataProvider = event.list; 
			
			view.turnOffLoadingIndicator();
			
		}
		
		private function clearUpdownload(event:ClearUpdownloadEvent):void {
						
			view.turnOffLoadingIndicator();
			view.ooevvElementSetCombo.selectedIndex = 0;
			view.selectOoevvElementSet();
			
		}
		
		private function catalogueUpdatedHandler(event:PagedListUpdatedEvent):void
		{
			
			view.elements = listModel.pagedList;
			
			view.listLength = listModel.pagedListLength;
			
			view.turnOffLoadingIndicator();
			
		}
		
		private function oesUpdatedHandler(event:FindOoevvElementSetByIdResultEvent):void
		{
			
			view.updownButtons.loadFile(event.object.xlsFileName, event.object.xlsFile);
			
			view.turnOffLoadingIndicator();
			
		}
		
		override public function onRemove():void 
		{				
			view.elements = new ArrayCollection();

		}		

		override protected function dispatch(event:Event):Boolean {
			
			view.turnOnLoadingIndicator();
			return super.dispatch(event);
		
		}
		
		private function updateVariableListControl(event:ListOoevvElementResultEvent):void {
			
			view.elements = event.list; 
			
		}		
		
		private function turnOffLoading(event:Event):void {
			
			view.turnOffLoadingIndicator();
			
		}
		
		private function reportUploadError(event:UploadExcelFileFaultEvent):void {
			
			view.turnOffLoadingIndicator();
			Alert.show(event.faultEvent.fault.faultString, 
				'OoEVV File Upload Error', mx.controls.Alert.OK);
			
			view.updownButtons.clearFile();
			
		}
		
		private function activateNewFileButton(event:Event):void
		{
			view.newOoevvButton.enabled = true;
		}
		
		public function saveFile(event:SaveNewFileEvent):void {
			var data:ByteArray = model.blankXls;
			var saveFile:FileReference = new FileReference();
			saveFile.addEventListener(Event.OPEN, saveBeginHandler);
			saveFile.addEventListener(Event.COMPLETE, saveCompleteHandler);
			saveFile.addEventListener(IOErrorEvent.IO_ERROR, saveIOErrorHandler);
			saveFile.save(data,"temp_ooevv.xls");
		}
		
		private function saveBeginHandler(event:Event):void
		{
			/* IT'D BE NICE TO HAVE A PROGRESS BAR HERE*/
		}
		
		private function saveCompleteHandler(event:Event):void
		{
			event.target.removeEventListener(Event.OPEN, saveBeginHandler);
			event.target.removeEventListener(Event.COMPLETE, saveCompleteHandler);
			event.target.removeEventListener(IOErrorEvent.IO_ERROR, saveIOErrorHandler);
		}
		
		private function saveIOErrorHandler(event:IOErrorEvent):void
		{
			event.target.removeEventListener(Event.COMPLETE, saveCompleteHandler);
			event.target.removeEventListener(IOErrorEvent.IO_ERROR, saveIOErrorHandler);
			
			trace("Error while trying to save:");
			trace(event);
		}


	}

}