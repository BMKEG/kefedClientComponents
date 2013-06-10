package edu.isi.bmkeg.cosi.questionTree.controller
{	
	import edu.isi.bmkeg.cosi.questionTree.model.*;
	import edu.isi.bmkeg.cosi.rl.events.*;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Command;
	
	public class RetrieveInvestigationPagedResultCommand extends Command
	{
	
		[Inject]
		public var event:RetrieveInvestigationPagedResultEvent;

		[Inject]
		public var questionTreeModel:QuestionTreeModel;
				
		override public function execute():void
		{
			var list:ArrayCollection = ArrayCollection(event.list)
			questionTreeModel.investigations.addAll(list);
		}
		
	}
	
}