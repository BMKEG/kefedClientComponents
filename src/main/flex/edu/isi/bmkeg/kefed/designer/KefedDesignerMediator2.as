package edu.isi.bmkeg.kefed.designer
{
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
	import edu.isi.bmkeg.kefed.designer.view.popups.*;
	import edu.isi.bmkeg.kefed.diagram.controller.events.*;
	import edu.isi.bmkeg.kefed.events.*;
	import edu.isi.bmkeg.kefed.events.elementLevel.*;
	import edu.isi.bmkeg.kefed.model.design.KefedModelEdge;
	import edu.isi.bmkeg.kefed.model.design.KefedModelElement;
	import edu.isi.bmkeg.kefed.model.qo.design.KefedModel_qo;
	import edu.isi.bmkeg.kefed.rl.events.*;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.managers.PopUpManager;
	
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	
	public class KefedDesignerMediator2 extends ModuleMediator 
	{

		[Inject]
		public var view:KefedDesignerModule2;

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

			addViewListener(DeleteKefedElementsEvent.REMOVE_KEFED_ELEMENTS, 
				handleDeleteKefedElement);
			
			addContextListener(RetrieveCompleteKefedModelResultEvent.RETRIEVE_COMPLETE_KEFED_MODEL_RESULT, 
				retrieveCompleteKefedModelHandler);
			
			addContextListener(InsertKefedEdgeEvent.INSERT_KEFED_EDGE, 
				handleGraphChange);
			
			addContextListener(InsertKefedElementEvent.INSERT_KEFED_ELEMENT, 
				handleGraphChange);
			
			addContextListener(DeleteKefedEdgesEvent.DELETE_KEFED_EDGE, 
				handleGraphChange);
			
			addContextListener(StartFlareEdgeInDiagramEvent.START_FLARE_EDGE_IN_DIAGRAM, 
				handleStartAddingEdge);

			addViewListener(CancelFlareEdgeInDiagramEvent.CANCEL_FLARE_EDGE_IN_DIAGRAM, 
				handleCancelAddingEdge);


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
		
		private function handleDeleteKefedElement(e:DeleteKefedElementsEvent):void {
			if( model.kefedElements.length > 0 ) {
				for each (var ke:KefedModelElement in model.kefedElements) {
					e.uids.addItem( ke.uuid );
				}				
				dispatch(e);
			}
			if( model.kefedEdges.length > 0) {
				var uuids:ArrayCollection = new ArrayCollection();
				for each (var ked:KefedModelEdge in model.kefedEdges) {
					uuids.addItem( ked.uuid ); 
				}
				var e2:DeleteKefedEdgesEvent = new DeleteKefedEdgesEvent(uuids);
				dispatch(e2);
			}
		}		
		
		private function handleGraphChange(e:Event):void {
			view.model = model.kefedModel;
		}
		
		private function handleStartAddingEdge(e:StartFlareEdgeInDiagramEvent):void {
			view.cytoscapeStatusMessage = "Adding Edge to " + model.startElement.uuid;
		}

		private function handleCancelAddingEdge(e:CancelFlareEdgeInDiagramEvent):void {
			model.startElement = null;
			view.cytoscapeStatusMessage = "...";
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
			this.dispatch( new RetrieveKefedModelTreeEvent( model.articleCitation.vpdmfId ) );
			
		}
				
	}
	
}