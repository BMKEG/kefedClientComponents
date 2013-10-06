package edu.isi.bmkeg.kefed.designer.view
{

	import edu.isi.bmkeg.kefed.designer.events.elementLevel.*;
	import edu.isi.bmkeg.kefed.rl.events.*;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
	import edu.isi.bmkeg.kefed.designer.view.popups.*;
	import edu.isi.bmkeg.kefed.diagram.controller.events.SelectFlareNodeEvent;
	import edu.isi.bmkeg.kefed.events.*;
	import edu.isi.bmkeg.kefed.model.qo.design.KefedModel_qo;
	
	import flash.events.Event;
	
	import mx.managers.PopUpManager;
	
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	
	public class KefedDesignerMediator extends ModuleMediator 
	{

		[Inject]
		public var view:KefedDesignerView;

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

			addContextListener(AddNewKefedEdgeEvent.ADD_NEW_KEFED_EDGE, handleGraphChange);
			addContextListener(AddNewKefedElementEvent.ADD_NEW_KEFED_ELEMENT, handleGraphChange);
			addContextListener(RemoveKefedEdgeEvent.REMOVE_KEFED_EDGE, handleGraphChange);
			addContextListener(RemoveKefedElementEvent.REMOVE_KEFED_ELEMENT, handleGraphChange);
			//addContextListener(SelectKefedElementEvent.SELECT_KEFED_ELEMENT, handleIncomingSelectElement);
		
			view.model = model.kefedModel;
			if( view.model.exptId == null) {
				view.model.exptId = "";
			}
			
			// when we load this element, we list all the models in the system. 
			var kQo:KefedModel_qo = new KefedModel_qo();
			dispatch(new ListKefedModelEvent(kQo) );
			
		}
		
		private function handleGraphChange(e:Event):void {
			view.model = model.kefedModel;
		}

		/*private function handleIncomingSelectElement(e:SelectKefedElementEvent):void {
			var nRows:int = model.kefedModel.elements.length;
			for( var i:int = 0; i<nRows; i++) {
				var k:KefedModelElement = KefedModelElement(model.kefedModel.elements.getItemAt(i));
				if( e.uid == k.uuid ) {
					view.objectsGrid.selectedIndex = i;
					return;
				}
			}
		}*/
		
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
				
	}
	
}