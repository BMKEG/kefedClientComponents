package edu.isi.bmkeg.cosi.questionTree
{
	
	import flash.display.DisplayObjectContainer;

	import org.robotlegs.mvcs.Context;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;

	import edu.isi.bmkeg.cosi.rl.events.*;	
	import edu.isi.bmkeg.cosi.rl.services.ICosiService;	
	import edu.isi.bmkeg.cosi.rl.services.impl.CosiServiceImpl;	
	import edu.isi.bmkeg.cosi.rl.services.serverInteraction.ICosiServer;	
	import edu.isi.bmkeg.cosi.rl.services.serverInteraction.impl.CosiServerImpl;	
	import edu.isi.bmkeg.cosi.rl.events.*;	
	import edu.isi.bmkeg.cosi.model.*;	
	import edu.isi.bmkeg.cosi.questionTree.model.*;
	import edu.isi.bmkeg.cosi.questionTree.controller.*;
	import edu.isi.bmkeg.cosi.questionTree.view.*;
	import edu.isi.bmkeg.cosi.questionTree.services.*;
	import edu.isi.bmkeg.cosi.questionTree.services.impl.*;


	public class QuestionTreeContext extends ModuleContext
	{
		
		override public function startup():void
		{
			
			injector.mapSingleton(QuestionTreeModel);

			injector.mapSingletonOf(ICosiService, CosiServiceImpl);
			injector.mapClass(ICosiServer,CosiServerImpl);
			injector.mapSingletonOf(IExtendedCosiService, ExtendedCosiServiceImpl);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// QuestionTree
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			mediatorMap.mapView(QuestionTreeView, QuestionTreeViewMediator);	
			
			// Events to update QuestionTreeModel from underlying queries
			commandMap.mapEvent(
				RetrieveInvestigationPagedResultEvent.RETRIEVE_INVESTIGATION_PAGED_RESULT, 
				RetrieveInvestigationPagedResultCommand);
			commandMap.mapEvent(
				RetrieveInvestigationPagedEvent.RETRIEVE_INVESTIGATION_PAGED, 
				RetrieveInvestigationPagedCommand);
		}

	}

}