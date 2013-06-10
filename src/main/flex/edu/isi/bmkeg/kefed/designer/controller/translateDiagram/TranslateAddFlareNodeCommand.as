package edu.isi.bmkeg.kefed.designer.controller.translateDiagram
{	
	import edu.isi.bmkeg.kefed.model.design.*;
	
	import edu.isi.bmkeg.kefed.designer.events.elementLevel.AddNewKefedElementEvent;

	import edu.isi.bmkeg.kefed.diagram.controller.events.AddFlareNodeEvent;
	import edu.isi.bmkeg.kefed.diagram.model.vo.FlareNode;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	
	public class TranslateAddFlareNodeCommand extends Command
	{
	
		[Inject]
		public var event:AddFlareNodeEvent;
				
		[Inject]
		public var moduleDispatcher:IModuleEventDispatcher;

		override public function execute():void
		{
			trace("translating FlareNode -> KefedModelElement"); 
			var el:FlareNode = event.el;
			
			trace("uid: " + el.uid); 
			trace("type: " + el.spriteid); 
			trace("name: " + el.nameValue); 
			
			var kefedEl:KefedModelElement;
			
			if( el.isActivity() ) {
				
				kefedEl = new ProcessInstance();				
				kefedEl.elementType = "ProcessInstance";
				
			} else if ( el.isEntity() ) { 

				kefedEl = new MaterialEntityInstance();
				kefedEl.elementType = "MaterialEntityInstance";

			} else if ( el.isConstant() ) {

				kefedEl = new ConstantInstance();
				kefedEl.elementType = "ConstantInstance";
				
			} else if ( el.isParameter() ) {

				kefedEl = new ParameterInstance();
				kefedEl.elementType = "ParameterInstance";
				
			} else if ( el.isMeasurement() ) {

				kefedEl = new MeasurementInstance();
				kefedEl.elementType = "MeasurementInstance";
				
			} else if ( el.isBranch() ) {

				kefedEl = new BranchPoint();
				kefedEl.elementType = "BranchPoint";
				
			} else if ( el.isFork() ) {

				kefedEl = new ForkPoint();
				kefedEl.elementType = "ForkPoint";
				
			}
			
			kefedEl.uuid = el.uid;
			
			var event:AddNewKefedElementEvent = new AddNewKefedElementEvent(kefedEl);
			dispatch(event);
			
		}
		
	}
	
}