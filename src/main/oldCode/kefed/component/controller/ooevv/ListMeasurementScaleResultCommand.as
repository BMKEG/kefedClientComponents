package edu.isi.bmkeg.kefed.component.controller.ooevv
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.component.model.KefedComponentModel;

	import edu.isi.bmkeg.ooevv.rl.services.IOoevvService;
	import edu.isi.bmkeg.ooevv.rl.events.ListMeasurementScaleResultEvent;
	import edu.isi.bmkeg.ooevv.model.scale.MeasurementScale;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
		
	import flash.events.Event;
	
	public class ListMeasurementScaleResultCommand extends Command
	{
	
		[Inject]
		public var event:ListMeasurementScaleResultEvent;

		[Inject]
		public var model:KefedComponentModel;
				
		override public function execute():void
		{
			model.ooevvScales = new Object();
			for each( var t:LightViewInstance in event.list ) {
				var o:Object = t.convertToIndexTupleObject()
				model.ooevvScales[ o["MeasurementScale_1"] ] = o;
			}
			
		}
		
	}
	
}