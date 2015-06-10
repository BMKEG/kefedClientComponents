package edu.isi.bmkeg.kefed.designer.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.events.modelLevel.CreateNewKefedModelForFragmentEvent;
	import edu.isi.bmkeg.kefed.rl.events.*;
	import edu.isi.bmkeg.kefed.services.extKefed.IExtendedKefedService;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel
	
	import flash.events.Event;
	
	public class CreateNewKefedModelForFragmentCommand extends Command
	{
	
		[Inject]
		public var event:CreateNewKefedModelForFragmentEvent;
		
		[Inject]
		public var srv:IExtendedKefedService;
		
		override public function execute():void
		{
			srv.createNewKefedModelForFragment(event.fgrId);
		}
		
	}
	
}