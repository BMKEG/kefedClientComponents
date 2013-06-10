package edu.isi.bmkeg.ooevv.editor.modules
{

	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;

	import edu.isi.bmkeg.ooevv.editor.controller.*;	
	import edu.isi.bmkeg.ooevv.events.*;
	
	import edu.isi.bmkeg.ooevv.model.*;
	import edu.isi.bmkeg.ooevv.editor.model.*;
	import edu.isi.bmkeg.ooevv.editor.service.*;
	import edu.isi.bmkeg.ooevv.editor.view.*;

	public final class OoevvElementEditorContext extends ModuleContext
	{
		
		public function OoevvElementEditorContext(contextView:DisplayObjectContainer,  injector:IInjector)
		{
			super(contextView, true, injector);
		}

		override public function startup():void
		{
			mediatorMap.mapView(OoevvElementSetControl, OoevvElementSetControlMediator);
			
			injector.mapSingleton(OoevvEditorModel);
			injector.mapSingletonOf(IOoevvService, OoevvService);
			
/*			commandMap.mapEvent(ListOoevvElementSetsEvent.LIST_OOEVV_ELEMENT_SETS, ListOoevvElementSetCommand);
			commandMap.mapEvent(SelectOoevvElementSetEvent.SELECT_OOEVV_ELEMENT_SET, SelectOoevvElementSetCommand);
			commandMap.mapEvent(LoadOoevvElementSetResultEvent.LOAD_OOEVV_ELEMENT_SET_RESULT, LoadOoevvElementSetResultCommand);*/
		
		}
		
		override public function dispose():void
		{
			mediatorMap.removeMediatorByView(contextView);
			super.dispose();
		}
		
	}
	
}