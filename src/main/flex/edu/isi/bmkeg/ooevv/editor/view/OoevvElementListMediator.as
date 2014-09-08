package edu.isi.bmkeg.ooevv.editor.view
{
	
	import edu.isi.bmkeg.ooevv.model.*;
	import edu.isi.bmkeg.ooevv.model.scale.*;
	import edu.isi.bmkeg.ooevv.editor.controller.*;
	import edu.isi.bmkeg.ooevv.events.*;
	import edu.isi.bmkeg.ooevv.editor.model.*;
	import edu.isi.bmkeg.ooevv.editor.view.*;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	import org.robotlegs.mvcs.Mediator;
	
	// added to overcome 'class not found errors'
	//private var hackFix1:KefedObjectProxy;
	//private var hackFix2:KefedLinkProxy;
	
	public class OoevvElementListMediator extends ModuleMediator
	{

		[Inject]
		public var view:OoevvElementList;
		
		[Inject]
		public var model:OoevvEditorModel;
		
		override public function onRegister():void 
		{
			addViewListener(SelectOoevvElementEvent.SELECT_OOEVV_ELEMENT, dispatch);
			
			addContextListener(LoadOoevvElementSetResultEvent.LOAD_OOEVV_ELEMENT_SET_RESULT, updateVariableListControl);
			addContextListener(LoadOoevvElementResultEvent.LOAD_OOEVV_ELEMENT_RESULT, turnOffLoading);

			// instantiate the view with data if present.
			if( model != null && model.ooevvElementSet != null ) {
				view.elements = model.ooevvElementSet.ooevvEls;
			}

		}
		
		override public function onRemove():void 
		{				
			view.elements = new ArrayCollection();

		}		

		override protected function dispatch(event:Event):Boolean {
			view.turnOnLoadingIndicator();
			return super.dispatch(event);
		}
		
		private function updateVariableListControl(event:LoadOoevvElementSetResultEvent):void {
			
			var oes:OoevvElementSet = OoevvElementSet(event.result);
			view.elements = oes.ooevvEls; 
			
		}		
		
		private function turnOffLoading(event:Event):void {
			
			view.turnOffLoadingIndicator();
			
		}	

	}

}