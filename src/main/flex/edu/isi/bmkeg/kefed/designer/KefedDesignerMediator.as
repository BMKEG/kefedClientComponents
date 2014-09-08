package edu.isi.bmkeg.kefed.designer
{
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
	import edu.isi.bmkeg.kefed.designer.view.popups.*;
	import edu.isi.bmkeg.kefed.diagram.controller.events.SelectFlareNodeInDiagramEvent;
	import edu.isi.bmkeg.kefed.events.*;
	import edu.isi.bmkeg.kefed.events.elementLevel.*;
	import edu.isi.bmkeg.kefed.model.qo.design.KefedModel_qo;
	import edu.isi.bmkeg.kefed.rl.events.*;
	
	import flash.events.Event;
	
	import mx.managers.PopUpManager;
	
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	
	public class KefedDesignerMediator extends ModuleMediator 
	{

		[Inject]
		public var view:KefedDesignerModule1;

		[Inject]
		public var model:KefedDesignerModel;
		
		override public function onRegister():void 
		{

			addViewListener(SelectKefedElementEvent.SELECT_KEFED_ELEMENT, 
				handleOutgoingSelectElement);
			
			addViewListener(SaveCompleteKefedModelEvent.SAVE_COMPLETE_KEFED_MODEL, 
				dispatch);

			addViewListener(ActivateKefedModelListPopupEvent.ACTIVATE_CORPUS_LIST_POPUP, 
				activateKefedModelListPopup);

			addViewListener(ActivateEditKefedModelPopupEvent.ACTIVATE_EDIT_KEFED_MODEL_POPUP, 
				activateEditKefedModelPopup);

			addContextListener(RetrieveCompleteKefedModelResultEvent.RETRIEVE_COMPLETE_KEFED_MODEL_RESULT, 
				retrieveCompleteKefedModelHandler);
			
			addContextListener(InsertKefedEdgeEvent.INSERT_KEFED_EDGE, 
				handleGraphChange);
			
			addContextListener(InsertKefedElementEvent.INSERT_KEFED_ELEMENT, 
				handleGraphChange);
			
			addContextListener(DeleteKefedEdgeEvent.DELETE_KEFED_EDGE, 
				handleGraphChange);
			
			addContextListener(DeleteKefedElementEvent.REMOVE_KEFED_ELEMENT, 
				handleGraphChange);
			
			addViewListener(UpdateKefedModelResultEvent.UPDATE_KEFEDMODEL_RESULT, 
				updateKefedModelResultHandler);
					
			view.model = model.kefedModel;
			if( view.model.exptId == null) {
				view.model.exptId = "";
			}
			
			// when we load this element, we list all the models in the system. 
			var kQo:KefedModel_qo = new KefedModel_qo();
			this.dispatch(new ListKefedModelEvent(kQo) );
			
		}
		
		private function handleGraphChange(e:Event):void {
			view.model = model.kefedModel;
		}
		
		private function handleOutgoingSelectElement(e:SelectKefedElementEvent):void {

			this.dispatch(e);
			this.dispatchToModules(new SelectFlareNodeEvent(e.uid));

		}
		
		private function activateKefedModelListPopup(e:ActivateKefedModelListPopupEvent):void {
			
			var popup:KefedModelListPopup = PopUpManager.createPopUp(this.view, KefedModelListPopup, true) 
				as KefedModelListPopup;
			PopUpManager.centerPopUp(popup);
						
			mediatorMap.createMediator( popup );
			
		}
		
		private function activateEditKefedModelPopup(e:ActivateEditKefedModelPopupEvent):void {
			
			var popup:EditKefedModelPopup = PopUpManager.createPopUp(
				this.view, EditKefedModelPopup, true) as EditKefedModelPopup;
			
			PopUpManager.centerPopUp(popup);
			mediatorMap.createMediator( popup );
			
		}
			
		private function retrieveCompleteKefedModelHandler(e:RetrieveCompleteKefedModelResultEvent):void {
			
			view.model = e.kefedModel;
			view.panelTitle = "Designer - " + e.kefedModel.exptId;
			view.modelDescription = e.kefedModel.notes;
			
		}
		
		private function updateKefedModelResultHandler(e:UpdateKefedModelResultEvent):void {
			
			this.dispatch( new RetrieveCompleteKefedModelEvent(e.id) );
			this.dispatch( new RetrieveKefedModelTreeEvent() );
			
		}
				
	}
	
}