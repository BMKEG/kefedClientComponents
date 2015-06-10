package edu.isi.bmkeg.kefed.component.controller.ooevv
{	
	import edu.isi.bmkeg.kefed.component.model.KefedComponentModel;
	import edu.isi.bmkeg.ooevv.model.ExperimentalVariable;
	import edu.isi.bmkeg.ooevv.rl.events.ListExperimentalVariableResultEvent;
	import edu.isi.bmkeg.ooevv.rl.services.IOoevvService;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class ListExperimentalVariableResultCommand extends Command
	{
	
		[Inject]
		public var event:ListExperimentalVariableResultEvent;

		[Inject]
		public var model:KefedComponentModel;
				
		override public function execute():void
		{
			model.ooevvVariables = new Object();
			for each( var t:LightViewInstance in event.list ) {
				var o:Object = t.convertToIndexTupleObject()
				model.ooevvVariables[ o["ExperimentalVariable_1"] ] = o;
			}
			
		}
		
	}
	
}