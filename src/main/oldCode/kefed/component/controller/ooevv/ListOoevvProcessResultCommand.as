package edu.isi.bmkeg.kefed.component.controller.ooevv
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.component.model.KefedComponentModel;

	import edu.isi.bmkeg.ooevv.rl.services.IOoevvService;
	import edu.isi.bmkeg.ooevv.rl.events.ListOoevvProcessResultEvent;
	import edu.isi.bmkeg.ooevv.model.OoevvProcess;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import flash.events.Event;
	
	public class ListOoevvProcessResultCommand extends Command
	{
	
		[Inject]
		public var event:ListOoevvProcessResultEvent;

		[Inject]
		public var model:KefedComponentModel;
				
		override public function execute():void
		{
			model.ooevvProcesses = new Object();
			for each( var t:LightViewInstance in event.list ) {
				var o:Object = t.convertToIndexTupleObject()
				model.ooevvProcesses[ o["OoevvProcess_1"] ] = o;
			}
			
		}
		
	}
	
}