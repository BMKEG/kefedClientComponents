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
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	
	public class SelectKefedEdgeCommand extends Command
	{
	
		[Inject]
		public var event:SelectKefedEdgeEvent;
				
		[Inject]
		public var model:KefedDesignerModel;

		override public function execute():void
		{
			trace("Select KefedModelEdge"); 
			
			var sourceUid:String = event.sourceUid;
			var targetUid:String = event.targetUid;

			model.kefedEdges = new ArrayCollection();

			for each (var ed:KefedModelEdge in model.kefedModel.edges) {
				
				if( ed.source.uuid == sourceUid && ed.target.uuid == targetUid ) {
					model.kefedEdges.addItem(ed);
				}
				
			}
			
		}
		
	}
	
}