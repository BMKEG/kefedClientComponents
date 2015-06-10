package edu.isi.bmkeg.kefed.component.controller.ooevv
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.ooevv.rl.services.IOoevvService;
	import edu.isi.bmkeg.ooevv.rl.events.ListMeasurementScaleEvent;
	
	import flash.events.Event;
	
	public class ListMeasurementScaleCommand extends Command
	{
	
		[Inject]
		public var event:ListMeasurementScaleEvent;

		[Inject]
		public var service:IOoevvService;
				
		override public function execute():void
		{
			service.listMeasurementScale(event.object);
		}
		
	}
	
}