package edu.isi.bmkeg.kefed.designer.controller.elementLevel
{	
	import edu.isi.bmkeg.kefed.model.design.KefedModelElement;
	
	import edu.isi.bmkeg.kefed.designer.events.elementLevel.AddNewKefedElementEvent;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;

	import edu.isi.bmkeg.kefed.diagram.controller.events.AddFlareNodeEvent;
	import edu.isi.bmkeg.kefed.diagram.model.vo.FlareNode;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	
	public class AddNewKefedElementCommand extends Command
	{
	
		[Inject]
		public var event:AddNewKefedElementEvent;
				
		[Inject]
		public var model:KefedDesignerModel;

		override public function execute():void
		{
			trace("Adding KefedModelElement"); 
			var el:KefedModelElement = event.el;
			
			model.kefedModel.elements.addItem(el);
			el.model = model.kefedModel;
			
		}
		
	}
	
}