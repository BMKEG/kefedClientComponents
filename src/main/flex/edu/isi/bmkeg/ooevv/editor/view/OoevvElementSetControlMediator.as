package edu.isi.bmkeg.ooevv.editor.view
{
	
	import edu.isi.bmkeg.ooevv.model.*;
	import edu.isi.bmkeg.ooevv.model.qo.*;
	import edu.isi.bmkeg.ooevv.editor.controller.*;
	import edu.isi.bmkeg.ooevv.rl.events.*;
	import edu.isi.bmkeg.ooevv.editor.view.*;
	
	import mx.binding.utils.BindingUtils;
	import mx.binding.utils.ChangeWatcher;
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.Application;
	import mx.core.FlexGlobals;
	import mx.events.DataGridEvent;
	import mx.events.FlexEvent;
	import mx.events.IndexChangedEvent;
	import mx.events.ListEvent;
	import mx.managers.CursorManager;
	import mx.managers.PopUpManager;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ColorUtil;
	import mx.utils.StringUtil;
	
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	
	public class OoevvElementSetControlMediator extends ModuleMediator
	{

		[Inject]
		public var view:OoevvElementSetControl;
		
		override public function onRegister():void 
		{
			
			addViewListener(ListOoevvElementSetEvent.LIST_OOEVVELEMENTSET, dispatch);
			addContextListener(ListOoevvElementSetResultEvent.LIST_OOEVVELEMENTSET_RESULT, 
				updateOoevvElementListControl);

			addViewListener(ListOoevvElementEvent.LIST_OOEVVELEMENT, dispatch);
						
			var oes:OoevvElementSet_qo = new OoevvElementSet_qo();
			dispatch(new ListOoevvElementSetEvent(oes));
			
		}
		
		private function updateOoevvElementListControl(event:ListOoevvElementSetResultEvent):void {
			
			view.ooevvElementSetCombo.dataProvider = event.list; 
			
		}
		
	}
	
}