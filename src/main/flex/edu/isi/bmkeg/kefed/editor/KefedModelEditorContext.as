package edu.isi.bmkeg.kefed.editor
{
	
	import flash.display.DisplayObjectContainer;

	import org.robotlegs.mvcs.Context;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;

	import edu.isi.bmkeg.kefed.diagram.controller.events.*;	
	
	public class KefedModelEditorContext extends ModuleContext
	{
		
		public function KefedModelEditorContext(contextView:DisplayObjectContainer,
													injector:IInjector)
		{
			super(contextView, true, injector);
		}
		
		override public function startup():void
		{

			//injector.mapSingleton(KefedDesignerModel);
			//injector.mapSingletonOf(IKefedService, KefedServiceImpl);
			//injector.mapSingletonOf(IKefedServer, KefedServerImpl);
			
			//commandMap.mapEvent(SaveCompleteKefedModelEvent.SAVE_COMPLETE_KEFED_MODEL, 
			//	SaveCompleteKefedModelCommand);
			
			// Events from KefedDiagram and translated to KefedDesigner events
			//moduleCommandMap.mapEvent(AddFlareEdgeEvent.ADD_FLARE_EDGE, TranslateAddFlareEdgeCommand);
			
			//viewMap.mapType(KefedDiagramModule);
			
		}
		
		override public function dispose():void
		{
			mediatorMap.removeMediatorByView(contextView);
			super.dispose();
		}
		
	}
}