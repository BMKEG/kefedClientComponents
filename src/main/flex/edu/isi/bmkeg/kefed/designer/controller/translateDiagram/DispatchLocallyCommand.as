package edu.isi.bmkeg.kefed.designer.controller.translateDiagram
{	

	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class DispatchLocallyCommand extends Command
	{
	
		[Inject]
		public var event:Event;
				

		override public function execute():void
		{
			dispatch(event);
		}
		
	}
	
}