package edu.isi.bmkeg.kefed.component.controller
{	
	import edu.isi.bmkeg.kefed.component.model.*;
	import edu.isi.bmkeg.kefed.component.view.elements.*;
	import edu.isi.bmkeg.kefed.events.*;
	import edu.isi.bmkeg.kefed.model.design.*;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;
	
	public class RetrieveCompleteKefedModelResultCommand extends ModuleCommand
	{
	
		[Inject]
		public var event:RetrieveCompleteKefedModelResultEvent;

		[Inject]
		public var model:KefedComponentModel;
				
		override public function execute():void
		{
			
			model.kefedModel = event.kefedModel;
						
		}
		
	}
	
}