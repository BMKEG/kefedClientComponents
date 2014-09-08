package edu.isi.bmkeg.kefed.designer.view
{
	import edu.isi.bmkeg.digitalLibrary.events.*;
	import edu.isi.bmkeg.kefed.designer.model.*;
	import edu.isi.bmkeg.kefed.designer.view.popups.*;
	import edu.isi.bmkeg.kefed.events.*;
	import edu.isi.bmkeg.kefed.events.elementLevel.*;
	import edu.isi.bmkeg.kefed.events.modelLevel.*;
	import edu.isi.bmkeg.kefed.model.design.*;
	import edu.isi.bmkeg.kefed.model.flare.*;
	import edu.isi.bmkeg.kefed.model.qo.design.*;
	import edu.isi.bmkeg.kefed.rl.events.*;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import flash.events.Event;
	
	import mx.managers.PopUpManager;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class KefedElementDataStructureControlMediator extends Mediator
	{
		[Inject]
		public var view:KefedElementDataStructureControl;
		
		[Inject]
		public var model:KefedDesignerModel;
		
		override public function onRegister():void
		{

			addContextListener(SelectKefedElementEvent.SELECT_KEFED_ELEMENT, 
				handleIncomingSelectElement);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// On loading this control, need to load the currently selected node, 
			// if there is one.
			//dispatch(new RetrieveKefedModelTreeEvent()) ;

		}
		
		private function handleIncomingSelectElement(e:SelectKefedElementEvent):void {
			
			if( !view.visible ) 
				return;
			
			var kEl:KefedModelElement = null; 
			var nRows:int = model.kefedModel.elements.length;
			for( var i:int = 0; i<nRows; i++) {
				var k:KefedModelElement = KefedModelElement(model.kefedModel.elements.getItemAt(i));
				if( e.uid == k.uuid ) {
					kEl = k;
					break
				}
			}
			
			if( kEl == null )
				return;
						
			var fn:FlareNode = model.fg.getFlareNodeFromUID( kEl.uuid );
				
			view.dependsOn = model.fg.getDependOnsForMeasurement( fn );
			
			var pause:int=0;
			
		}
		
	}
	
}