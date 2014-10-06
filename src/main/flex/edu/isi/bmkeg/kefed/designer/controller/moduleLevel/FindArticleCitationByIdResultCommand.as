package edu.isi.bmkeg.kefed.designer.controller.moduleLevel
{
	import edu.isi.bmkeg.digitalLibrary.rl.events.FindArticleCitationByIdResultEvent;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
	import edu.isi.bmkeg.kefed.events.RetrieveKefedModelTreeEvent;
	import edu.isi.bmkeg.digitalLibrary.model.qo.citations.*;
	import edu.isi.bmkeg.ftd.rl.events.*;
	import edu.isi.bmkeg.ftd.model.qo.*;

	import org.robotlegs.mvcs.Command;
	
	public class FindArticleCitationByIdResultCommand extends Command
	{
		[Inject]
		public var event:FindArticleCitationByIdResultEvent;
		
		[Inject]
		public var model:KefedDesignerModel;
		
		override public function execute():void {
			
			model.articleCitation = event.object;
			this.dispatch(event);

			dispatch(new RetrieveKefedModelTreeEvent(model.articleCitation.vpdmfId));				

		}
		
	}
	
}