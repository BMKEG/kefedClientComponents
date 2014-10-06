package edu.isi.bmkeg.kefed.designer.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.kefed.events.modelLevel.CreateNewKefedModelForFragmentResultEvent;
	import edu.isi.bmkeg.kefed.events.RetrieveKefedModelTreeEvent;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel
	
	import flash.events.Event;
	
	public class CreateNewKefedModelForFragmentResultCommand extends Command
	{
	
		[Inject]
		public var event:CreateNewKefedModelForFragmentResultEvent;

		[Inject]
		public var model:KefedDesignerModel;
				
		override public function execute():void
		{
			model.kefedModel = event.model;
			dispatch( new RetrieveKefedModelTreeEvent(model.articleCitation.vpdmfId));
		}
		
	}
	
}