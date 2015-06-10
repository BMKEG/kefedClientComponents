package edu.isi.bmkeg.kefed.component.controller.ooevv
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.component.model.KefedComponentModel;

	import edu.isi.bmkeg.ooevv.rl.services.IOoevvService;
	import edu.isi.bmkeg.ooevv.rl.events.ListOoevvEntityResultEvent;
	import edu.isi.bmkeg.ooevv.model.OoevvEntity;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import flash.events.Event;
	
	public class ListOoevvEntityResultCommand extends Command
	{
	
		[Inject]
		public var event:ListOoevvEntityResultEvent;

		[Inject]
		public var model:KefedComponentModel;
				
		override public function execute():void
		{
			model.ooevvEntities = new Object();
			for each( var t:LightViewInstance in event.list ) {
				var o:Object = t.convertToIndexTupleObject()
				model.ooevvEntities[ o["OoevvEntity_1"] ] = o;
			}
			
		}
		
	}
	
}