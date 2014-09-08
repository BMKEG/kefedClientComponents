package edu.isi.bmkeg.kefed.designer.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.rl.events.*;
	import edu.isi.bmkeg.kefed.rl.services.IKefedService;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel
	
	import flash.events.Event;
	
	public class UpdateKefedModelCommand extends Command
	{
	
		[Inject]
		public var event:UpdateKefedModelEvent;

		[Inject]
		public var model:KefedDesignerModel;

		[Inject]
		public var srv:IKefedService;
				
		override public function execute():void
		{
			srv.updateKefedModel( event.object );
		}
		
	}
	
}