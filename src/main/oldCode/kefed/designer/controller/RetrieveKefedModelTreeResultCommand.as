package edu.isi.bmkeg.kefed.designer.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.events.RetrieveKefedModelTreeResultEvent;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
		
	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;
	
	import flash.events.Event;
	
	public class RetrieveKefedModelTreeResultCommand extends ModuleCommand
	{
	
		[Inject]
		public var event:RetrieveKefedModelTreeResultEvent;

		[Inject]
		public var model:KefedDesignerModel;
				
		override public function execute():void
		{
			model.frgTree = event.kefedModelTree;
		}
		
	}
	
}