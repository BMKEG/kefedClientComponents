package edu.isi.bmkeg.kefed.diagram.view
{

	import edu.isi.bmkeg.kefed.diagram.model.*;
	import edu.isi.bmkeg.kefed.designer.events.elementLevel.*;
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
			addViewListener(AddNewKefedElementEvent.ADD_NEW_KEFED_ELEMENT, handleAddNewKefedElementEvent);			
			addViewListener(DropKefedNodeIntoDiagramEvent.DROP_KEFED_NODE_INTO_DIAGRAM, dispatch);			
			addViewListener(UpdateKapitXmlEvent.UPDATE_KAPIT_XML, handleKapitUmlEvent);			
		}
		
		private function handleAddNewKefedElementEvent(e:AddNewKefedElementEvent):void {
			if( !this.model.shutDownGraph )
				dispatchToModules(e);
		}
		
		private function handleKapitUmlEvent(e:UpdateKapitXmlEvent):void {
			if( !this.model.shutDownGraph )
				dispatchToModules(e);	
		}		
	
	}

}