package edu.isi.bmkeg.ooevv.editor.view
{
	
	import edu.isi.bmkeg.pagedList.events.*;
	import edu.isi.bmkeg.pagedList.model.*;
	
	import edu.isi.bmkeg.ooevv.events.*;
	import edu.isi.bmkeg.ooevv.model.*;
	import edu.isi.bmkeg.ooevv.model.qo.*;
	import edu.isi.bmkeg.ooevv.model.scale.*;
	import edu.isi.bmkeg.ooevv.editor.controller.*;
	import edu.isi.bmkeg.ooevv.rl.events.*;
	import edu.isi.bmkeg.ooevv.editor.model.*;
	import edu.isi.bmkeg.ooevv.editor.view.*;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	import org.robotlegs.mvcs.Mediator;
	
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
			
			addViewListener(ListOoevvElementEvent.LIST_OOEVVELEMENT, dispatch);
			addContextListener(ListOoevvElementResultEvent.LIST_OOEVVELEMENT_RESULT, 
				updateVariableListControl);
			
			addViewListener(ListOoevvElementSetEvent.LIST_OOEVVELEMENTSET, dispatch);
			addContextListener(ListOoevvElementSetResultEvent.LIST_OOEVVELEMENTSET_RESULT, 
				updateOoevvElementListControl);
			
			addViewListener(SelectOoevvElementSetEvent.SELECT_OOEVV_ELEMENT_SET, dispatch);
			
			var oes:OoevvElementSet_qo = new OoevvElementSet_qo();
			dispatch(new ListOoevvElementSetEvent(oes));
			
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

	}

}