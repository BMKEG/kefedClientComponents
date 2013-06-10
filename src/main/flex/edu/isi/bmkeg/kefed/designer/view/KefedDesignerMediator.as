package edu.isi.bmkeg.kefed.designer.view
{

	import edu.isi.bmkeg.kefed.model.design.KefedModelElement;
	import edu.isi.bmkeg.kefed.designer.events.elementLevel.*;
	import edu.isi.bmkeg.kefed.designer.events.elementLevel.RemoveKefedElementEvent;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
	import edu.isi.bmkeg.kefed.designer.view.KefedDesignerView;
	import edu.isi.bmkeg.kefed.diagram.controller.events.SelectFlareNodeEvent;
	
	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	
	import mx.binding.utils.BindingUtils;
	import mx.binding.utils.ChangeWatcher;
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.Application;
	import mx.core.FlexGlobals;
	import mx.events.DataGridEvent;
	import mx.events.FlexEvent;
	import mx.events.IndexChangedEvent;
	import mx.events.ListEvent;
	import mx.managers.CursorManager;
	import mx.managers.PopUpManager;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ColorUtil;
	import mx.utils.StringUtil;
	
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	
	public class KefedDesignerMediator extends ModuleMediator 
	{

		[Inject]
		public var view:KefedDesignerView;

		[Inject]
		public var model:KefedDesignerModel;
		
		override public function onRegister():void 
		{

			addViewListener(SelectKefedElementEvent.SELECT_KEFED_ELEMENT, handleOutgoingSelectElement);
			
			addContextListener(AddNewKefedEdgeEvent.ADD_NEW_KEFED_EDGE, handleGraphChange);
			addContextListener(AddNewKefedElementEvent.ADD_NEW_KEFED_ELEMENT, handleGraphChange);
			addContextListener(RemoveKefedEdgeEvent.REMOVE_KEFED_EDGE, handleGraphChange);
			addContextListener(RemoveKefedElementEvent.REMOVE_KEFED_ELEMENT, handleGraphChange);
			//addContextListener(SelectKefedElementEvent.SELECT_KEFED_ELEMENT, handleIncomingSelectElement);

			//addModuleListener(DoodadModuleEvent.DO_STUFF_REQUESTED, handleDoStuffRequest, DoodadModuleEvent);
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
				
	}
	
}