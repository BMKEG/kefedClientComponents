package edu.isi.bmkeg.cosi.questionTree.view
{
	
	import edu.isi.bmkeg.cosi.model.Investigation;
	import edu.isi.bmkeg.cosi.questionTree.model.QuestionTreeModel;
	import edu.isi.bmkeg.cosi.rl.events.*;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class QuestionTreeViewMediator extends Mediator
	{
		[Inject]
		public var view:QuestionTreeView;
				
		override public function onRegister():void
		{
			
//			addContextListener(CitationsListSelectionChangedEvent.CHANGED, citationsListSelectionChangedHandler);
//			
//			addViewListener(UserRequestCitationsListSelectionChangeEvent.CHANGE, dispatch);
			
//			view.citationsList = citationsListModel.citationsList;
			
			// Start by listing all investigations. 
			// This should include questions, but not 
			dispatch(new RetrieveInvestigationPagedEvent(new Investigation(), 0, 100));

			// Events to update the question tree view from the query
			addContextListener(
				RetrieveInvestigationPagedResultEvent.RETRIEVE_INVESTIGATION_PAGED_RESULT, 
				loadInvestigationsIntoTree);
			
		}
		
		// If you load a new list of investigations this resets the control. 
		private function loadInvestigationsIntoTree(event:RetrieveInvestigationPagedResultEvent):void {	
			view.investigations = event.list;
		}
		
	}

}