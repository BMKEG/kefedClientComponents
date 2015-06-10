package edu.isi.bmkeg.kefed.designer.controller.elementLevel
{	
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
	import edu.isi.bmkeg.kefed.diagram.controller.events.AddFlareNodeEvent;
	import edu.isi.bmkeg.kefed.events.elementLevel.*;
	import edu.isi.bmkeg.kefed.model.design.*;
	import edu.isi.bmkeg.kefed.model.design.KefedModelElement;
	import edu.isi.bmkeg.kefed.model.flare.FlareNode;
	import edu.isi.bmkeg.kefed.rl.events.InsertMeasurementInstanceEvent;
	import edu.isi.bmkeg.kefed.rl.events.InsertVariableInstanceEvent;
	import edu.isi.bmkeg.kefed.services.extKefed.IExtendedKefedService;
	
	import flash.events.Event;
	
	import mx.utils.UIDUtil;
	import mx.collections.ArrayCollection;

	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	
	public class SelectKefedElementCommand extends Command
	{
	
		[Inject]
		public var event:SelectKefedElementEvent;
				
		[Inject]
		public var model:KefedDesignerModel;

		override public function execute():void
		{

			var uid:String = event.uid;

			if( model.startElement != null ) {
				
				if( model.kefedElements.length != 1 ) 
					return;
				
				var selection:KefedModelElement = KefedModelElement(model.kefedElements.getItemAt(0));
				for each (var el:KefedModelElement in model.kefedModel.elements) {
					if( el.uuid == uid ) {
						model.kefedElements.addItem(el);
					}
				}
				
				var ev2:InsertKefedEdgeEvent = new InsertKefedEdgeEvent(
					model.startElement.uuid, 
					selection.uuid, 
					UIDUtil.createUID(), 
					<xml/>
				);
				
				this.dispatch(ev2);
				
				model.startElement = null;
				
			} else {

				model.kefedElements = new ArrayCollection();
				for each (var el2:KefedModelElement in model.kefedModel.elements) {
					if( el2.uuid == uid ) {
						model.kefedElements.addItem(el2);
					}
				}
			
			}
			
		}
		
	}
	
}