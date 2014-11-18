package edu.isi.bmkeg.kefed.designer.controller.elementLevel
{	
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
	import edu.isi.bmkeg.kefed.diagram.controller.events.DeselectElementsInDiagramEvent;
	import edu.isi.bmkeg.kefed.events.elementLevel.*;
	import edu.isi.bmkeg.kefed.model.design.*;
	import edu.isi.bmkeg.kefed.model.design.KefedModelElement;
	import edu.isi.bmkeg.kefed.model.flare.FlareNode;
	import edu.isi.bmkeg.kefed.rl.events.InsertMeasurementInstanceEvent;
	import edu.isi.bmkeg.kefed.rl.events.InsertVariableInstanceEvent;
	import edu.isi.bmkeg.kefed.services.IExtendedKefedService;
	
	import flash.events.Event;

	import mx.collections.ArrayCollection;

	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	
	public class DeselectCommand extends Command
	{
	
		[Inject]
		public var event:DeselectElementsInDiagramEvent;
				
		[Inject]
		public var model:KefedDesignerModel;

		override public function execute():void
		{
			model.kefedEdges = new ArrayCollection();
			model.kefedElements = new ArrayCollection();
		}
		
	}
	
}