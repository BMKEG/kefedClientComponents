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
	import edu.isi.bmkeg.utils.updownload.UploadCompleteEvent;
	
	import flash.events.Event;
	
	import mx.controls.Alert;
	
	import mx.collections.ArrayCollection;
	
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
		public var listModel:PagedListModel;
		
		override public function onRegister():void 
		{
			addContextListener(PagedListUpdatedEvent.UPDATED, 
				catalogueUpdatedHandler);
			
			addViewListener(ListOoevvElementEvent.LIST_OOEVVELEMENT, 
				dispatch);
			
			addContextListener(ListOoevvElementResultEvent.LIST_OOEVVELEMENT_RESULT, 
				updateVariableListControl);
			
			addViewListener(ListOoevvElementSetEvent.LIST_OOEVVELEMENTSET, 
				dispatch);
			
			addContextListener(ListOoevvElementSetResultEvent.LIST_OOEVVELEMENTSET_RESULT, 
				updateOoevvElementListControl);
			
			addContextListener(UploadExcelFileFaultEvent.UPLOAD_EXCEL_FILE_FAULT, 
				reportUploadError);
			
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
			
		}
		
		private function updateOoevvElementListControl(event:ListOoevvElementSetResultEvent):void {
			
			view.ooevvElementSetCombo.dataProvider = event.list; 
			
			view.turnOffLoadingIndicator();
			
		}
		
		private function catalogueUpdatedHandler(event:PagedListUpdatedEvent):void
		{
			
			view.elements = listModel.pagedList;
			
			view.listLength = listModel.pagedListLength;
			
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

	}

}