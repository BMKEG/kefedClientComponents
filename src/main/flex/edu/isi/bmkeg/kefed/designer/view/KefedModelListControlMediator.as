package edu.isi.bmkeg.kefed.designer.view
{
	import edu.isi.bmkeg.digitalLibrary.events.*;
	import edu.isi.bmkeg.digitalLibrary.model.citations.*;
	import edu.isi.bmkeg.digitalLibrary.rl.events.FindArticleCitationByIdResultEvent;
	import edu.isi.bmkeg.ftd.rl.events.*;
	import edu.isi.bmkeg.kefed.designer.model.*;
	import edu.isi.bmkeg.kefed.designer.view.popups.*;
	import edu.isi.bmkeg.kefed.events.*;
	import edu.isi.bmkeg.kefed.events.modelLevel.*;
	import edu.isi.bmkeg.kefed.model.design.*;
	import edu.isi.bmkeg.kefed.model.qo.design.*;
	import edu.isi.bmkeg.kefed.rl.events.*;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import flash.events.Event;
	
	import mx.managers.PopUpManager;
	
	import org.robotlegs.mvcs.Mediator;
	
	import mx.core.FlexGlobals;
	import spark.components.Application;
	
	public class KefedModelListControlMediator extends Mediator
	{
		[Inject]
		public var view:KefedModelListControl;
		
		[Inject]
		public var model:KefedDesignerModel;
		
		override public function onRegister():void
		{
			addViewListener(RetrieveCompleteKefedModelEvent.RETRIEVE_COMPLETE_KEFED_MODEL, 
				dispatch);

			addViewListener(ListFTDFragmentEvent.LIST_FTDFRAGMENT, 
				dispatch);

			addContextListener(ListFTDFragmentResultEvent.LIST_FTDFRAGMENT_RESULT, 
				loadFrg);
						
			addViewListener(ActivateKefedModelListPopupEvent.ACTIVATE_CORPUS_LIST_POPUP, 
				activateKefedModelListPopup);
			
			addViewListener(DeleteCompleteKefedModelEvent.DELETE_COMPLETE_KEFED_MODEL, 
				deleteKefedModelHandler);
			
			addContextListener(RetrieveKefedModelTreeResultEvent.RETRIEVE_KEFED_MODEL_TREE_RESULT, 
				addTreeToView);
			
			addContextListener(UpdateKefedModelResultEvent.UPDATE_KEFEDMODEL_RESULT, 
				refresh);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// On loading this control, we load the 'Fragment Tree' from the server 
			// based on the value of state variables set in the Global Application
			var app:Application = Application(FlexGlobals.topLevelApplication);
			if( app["currentArticleCitation"] != null ) {
				this.model.articleCitation = app["currentArticleCitation"] as ArticleCitation;
				dispatch(new RetrieveKefedModelTreeEvent(model.articleCitation.vpdmfId));				
			}

		}
		
		private function addTreeToView(event:RetrieveKefedModelTreeResultEvent):void {
			
			view.tree = event.kefedModelTree;
			
		}
		
		private function activateKefedModelListPopup(e:ActivateKefedModelListPopupEvent):void {
			
			var popup:KefedModelListPopup = PopUpManager.createPopUp(this.view, KefedModelListPopup, true) 
				as KefedModelListPopup;
			PopUpManager.centerPopUp(popup);
			mediatorMap.createMediator( popup );

			dispatch(new RetrieveFragmentTreeEvent(model.articleCitation.vpdmfId)) ;
			
		}

		private function refresh(e:Event):void {
			
			dispatch(new RetrieveFragmentTreeEvent(model.articleCitation.vpdmfId)) ;
			
		}
		
		private function deleteKefedModelHandler(e:DeleteCompleteKefedModelEvent):void {
			
			e.id = model.kefedModel.vpdmfId;
			dispatch(e) ;
			
		}
		
		private function loadFrg(e:ListFTDFragmentResultEvent):void {

			if( e.list.length == 1 ) {
				view.currentState = "modelLoaded";
				var lvi:LightViewInstance = LightViewInstance(e.list.getItemAt(0));
				view.fragment = lvi.vpdmfLabel;
			}	
			
		}
		
	}
	
}