package edu.isi.bmkeg.kefed.designer.controller.elementLevel
{	
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
	import edu.isi.bmkeg.kefed.diagram.controller.events.StartFlareEdgeInDiagramEvent;
	import edu.isi.bmkeg.kefed.events.elementLevel.*;
	import edu.isi.bmkeg.kefed.model.design.*;
	import edu.isi.bmkeg.kefed.model.design.KefedModelElement;
	import edu.isi.bmkeg.kefed.model.flare.FlareNode;
	import edu.isi.bmkeg.kefed.rl.events.InsertMeasurementInstanceEvent;
	import edu.isi.bmkeg.kefed.rl.events.InsertVariableInstanceEvent;
	import edu.isi.bmkeg.kefed.services.extKefed.IExtendedKefedService;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	
	public class StartEdgeCommand extends Command
	{
	
		[Inject]
		public var event:StartFlareEdgeInDiagramEvent;
				
		[Inject]
		public var model:KefedDesignerModel;

		override public function execute():void
		{			
			var uid:String = event.sourceUid;
			for each (var el:KefedModelElement in model.kefedModel.elements) {				
				if( el.uuid == uid ) {
					model.startElement = el;
					break;
				}
			}			
			this.dispatch(event);
		}
		
	}
	
}