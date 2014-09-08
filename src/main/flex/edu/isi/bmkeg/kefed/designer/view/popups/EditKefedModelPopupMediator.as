package edu.isi.bmkeg.kefed.designer.view.popups
{

	import edu.isi.bmkeg.events.*;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
	import edu.isi.bmkeg.kefed.events.*;
	import edu.isi.bmkeg.kefed.model.design.*;
	import edu.isi.bmkeg.kefed.rl.events.*;
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
	
	public class EditKefedModelPopupMediator extends Mediator
	{
		
		[Inject]
		public var view:EditKefedModelPopup;
		
		[Inject]
		public var model:KefedDesignerModel;

		override public function onRegister():void {
			
			addViewListener(
				InsertKefedModelEvent.INSERT_KEFEDMODEL, 
				dispatch);

			addViewListener(
				UpdateKefedModelEvent.UPDATE_KEFEDMODEL, 
				updateKefedModelHandler);

			addViewListener(
				ClosePopupEvent.CLOSE_POPUP, 
				closePopup);
			
			view.exptId = model.kefedModel.exptId;
			view.notes = model.kefedModel.notes;
			
		}
				
		private function closePopup(event:ClosePopupEvent):void {
			
			mediatorMap.removeMediatorByView( event.popup );
			PopUpManager.removePopUp( event.popup );
			
		}
		
		private function updateKefedModelHandler(event:UpdateKefedModelEvent):void {
			
			var holder:KefedModel = event.object;
			var target:KefedModel = model.kefedModel;
			
			target.exptId = holder.exptId;
			target.notes = holder.notes;
			
			event.object = target;
			
			dispatch(event);
			
		}
		
	}

}