package edu.isi.bmkeg.kefed.designer.view.popups
{

	import edu.isi.bmkeg.events.*;
	import edu.isi.bmkeg.kefed.events.*;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
	import edu.isi.bmkeg.pagedList.*;
	import edu.isi.bmkeg.pagedList.model.*;
	
	import flash.events.Event;
	
	import mx.collections.ItemResponder;
	import mx.collections.errors.ItemPendingError;
	import mx.controls.Alert;
	import mx.events.CollectionEvent;
	import mx.managers.PopUpManager;
	import mx.utils.StringUtil;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class KefedModelListPopupMediator extends Mediator
	{
		
		[Inject]
		public var view:KefedModelListPopup;
		
		[Inject]
		public var model:KefedDesignerModel;

		override public function onRegister():void {
			
			addViewListener(
				RetrieveCompleteKefedModelEvent.RETRIEVE_COMPLETE_KEFED_MODEL, 
				dispatch);
			addViewListener(
				ClosePopupEvent.CLOSE_POPUP, 
				closePopup);
			
			for each( var o:Object in model.modelList) {
				if( o.vpdmfLabel != null ) {
					this.view.list.addItem( o );
				}
			}

		}
		
		private function closePopup(event:ClosePopupEvent):void {
			
			mediatorMap.removeMediatorByView( event.popup );
			PopUpManager.removePopUp( event.popup );
			
		}
		
		
	}

}