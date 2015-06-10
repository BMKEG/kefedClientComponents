package edu.isi.bmkeg.kefed.designer.view.popups
{

	import edu.isi.bmkeg.events.ClosePopupEvent;
	import edu.isi.bmkeg.digitalLibrary.events.*;
	import edu.isi.bmkeg.kefed.events.modelLevel.*;
	import edu.isi.bmkeg.kefed.events.*;
	import edu.isi.bmkeg.kefed.rl.events.*;
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

		override public function onRegister():void 
		{
			
			addViewListener(
				RetrieveCompleteKefedModelEvent.RETRIEVE_COMPLETE_KEFED_MODEL, 
				dispatch);
			
			addViewListener(
				CreateNewKefedModelForFragmentEvent.CREATE_NEW_KEFED_MODEL_FOR_FRAGMENT, 
				dispatch);

			addViewListener(
				edu.isi.bmkeg.events.ClosePopupEvent.CLOSE_POPUP, 
				closePopup);
			
			addContextListener(
				RetrieveFragmentTreeResultEvent.RETRIEVE_FRAGMENT_TREE_RESULT, 
				addTreeToView);
			
			

		}
		
		private function addTreeToView(event:RetrieveFragmentTreeResultEvent):void 
		{
		
			view.tree = event.tree;		
		
		}
		
		private function closePopup(event:edu.isi.bmkeg.events.ClosePopupEvent):void {	
			
			mediatorMap.removeMediatorByView( event.popup );
			PopUpManager.removePopUp( event.popup );
		
		}
		
	}

}