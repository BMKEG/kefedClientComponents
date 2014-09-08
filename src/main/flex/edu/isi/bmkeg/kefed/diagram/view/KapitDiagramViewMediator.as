package edu.isi.bmkeg.kefed.diagram.view
{

	import edu.isi.bmkeg.kefed.diagram.model.*;
	import edu.isi.bmkeg.kefed.events.elementLevel.*;
	import edu.isi.bmkeg.kefed.diagram.controller.events.*;
	
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	
	// added to overcome 'class not found errors'
	//private var hackFix1:KefedObjectProxy;
	//private var hackFix2:KefedLinkProxy;
	
	public class KapitDiagramViewMediator extends ModuleMediator
	{

		[Inject]
		public var view:KapitDiagramView;
		
		[Inject]
		public var model:KefedDiagramModel;
		
		// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

		override public function onRegister():void {
			addViewListener(DropKefedNodeIntoDiagramEvent.DROP_KEFED_NODE_INTO_DIAGRAM, dispatch);			
		}
				
	}

}