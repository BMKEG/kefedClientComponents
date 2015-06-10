package edu.isi.bmkeg.kefed.component.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.component.model.KefedComponentModel;
	import edu.isi.bmkeg.kefed.rl.events.ListKefedModelResultEvent;
	
	import flash.events.Event;
	
	public class ListKefedModelResultCommand extends Command
	{
	
		[Inject]
		public var event:ListKefedModelResultEvent;

		[Inject]
		public var model:KefedComponentModel;
				
		override public function execute():void
		{
			model.kefedModelList = event.list;
		}
		
	}
	
}