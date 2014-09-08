package edu.isi.bmkeg.kefed.designer.controller.elementLevel
{	
	import edu.isi.bmkeg.kefed.events.elementLevel.InsertKefedElementEvent;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
	import edu.isi.bmkeg.kefed.diagram.controller.events.AddFlareNodeEvent;
	import edu.isi.bmkeg.kefed.model.flare.FlareNode;
	import edu.isi.bmkeg.kefed.model.design.KefedModelElement;
	import edu.isi.bmkeg.kefed.model.design.*;
	import edu.isi.bmkeg.kefed.rl.events.InsertMeasurementInstanceEvent;
	import edu.isi.bmkeg.kefed.rl.events.InsertVariableInstanceEvent;
	import edu.isi.bmkeg.kefed.services.IExtendedKefedService;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	
	public class InsertKefedElementCommand extends Command
	{
	
		[Inject]
		public var event:InsertKefedElementEvent;
				
		[Inject]
		public var model:KefedDesignerModel;

		[Inject]
		public var service:IExtendedKefedService;

		override public function execute():void
		{
			trace("Adding KefedModelElement"); 
			
			var el:KefedModelElement = event.el;

			model.kefedModel.elements.addItem(el);
			el.model = model.kefedModel;
			
			switch (el.elementType ) {
				
				case "MeasurementInstance":
					var mi:MeasurementInstance = MeasurementInstance(el); 
					service.insertKefedElement(mi, event.xml);
					break;
				
				case "ParameterInstance":
					var pi:ParameterInstance = ParameterInstance(el); 
					service.insertKefedElement(pi, event.xml);
					break;

				case "ConstantInstance":
					var ci:ConstantInstance = ConstantInstance(el); 
					service.insertKefedElement(ci, event.xml);
					break;

				case "ProcessInstance":
					var pi2:ProcessInstance = ProcessInstance(el); 
					service.insertKefedElement(pi2, event.xml);
					break;

				case "EntityInstance":
					var ei:EntityInstance = EntityInstance(el); 
					service.insertKefedElement(ei, event.xml);
					break;

				case "BranchPoint":
					var bp:BranchPoint = BranchPoint(el); 
					service.insertKefedElement(bp, event.xml);
					break;
				
				case "ForkPoint":
					var fp:ForkPoint = ForkPoint(el); 
					service.insertKefedElement(fp, event.xml);
					break;				
			
			} 
		 	
		}
		
	}
	
}