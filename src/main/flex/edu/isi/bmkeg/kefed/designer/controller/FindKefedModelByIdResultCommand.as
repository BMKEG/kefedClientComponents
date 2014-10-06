package edu.isi.bmkeg.kefed.designer.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.rl.events.*;
	import edu.isi.bmkeg.kefed.rl.services.IKefedService;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel
	
	import flash.events.Event;
	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;
	
	public class FindKefedModelByIdResultCommand extends ModuleCommand
	{
	
		[Inject]
		public var event:FindKefedModelByIdResultEvent;

		[Inject]
		public var model:KefedDesignerModel;
				
		override public function execute():void
		{
			model.kefedModel = event.object;
			dispatch(event);
		}
		
	}
	
}