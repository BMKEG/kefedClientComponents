package edu.isi.bmkeg.kefed.diagram.view
{
	import com.kapit.diagram.DiagramEvent;
	import com.kapit.diagram.actions.AbortAction;
	import com.kapit.diagram.layers.DiagramLane;
	import com.kapit.diagram.layers.DiagramPanel;
	import com.kapit.diagram.layouts.utils.Constants;
	import com.kapit.diagram.library.SVGAssetLibrary;
	import com.kapit.diagram.model.DiagramModel;
	import com.kapit.diagram.proxies.DiagramProxy;
	import com.kapit.diagram.proxies.KDLProxy;
	import com.kapit.diagram.view.DiagramObject;
	import com.kapit.diagram.view.DiagramSprite;
	import com.kapit.diagram.view.DiagramView;
	
	import edu.isi.bmkeg.kefed.diagram.controller.events.*;
	import edu.isi.bmkeg.kefed.diagram.model.KefedDiagramModel;
	import edu.isi.bmkeg.kefed.diagram.model.vo.*;
	import edu.isi.bmkeg.kefed.diagram.view.kapit.DiagramMappings;
	import edu.isi.bmkeg.kefed.diagram.view.kapit.FlareLinkProxy;
	import edu.isi.bmkeg.kefed.diagram.view.kapit.FlareNodeProxy;
	
	import flare.analytics.graph.LinkDistance;
	import flare.vis.data.NodeSprite;
	
	import flash.utils.getDefinitionByName;
	
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
	
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	
	// added to overcome 'class not found errors'
	//private var hackFix1:KefedObjectProxy;
	//private var hackFix2:KefedLinkProxy;
	
	public class KefedDiagramMediator extends ModuleMediator
	{

		[Inject]
		public var view:KefedDiagramModule;
		
		[Inject]
		public var model:KefedDiagramModel;

		// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

		override public function onRegister():void 
		{
			addViewListener(AddFlareEdgeEvent.ADD_FLARE_EDGE, handleAddFlareEdge);
			addViewListener(AddFlareNodeEvent.ADD_FLARE_NODE, handleAddFlareNode);
			addViewListener(ChangeZoomEvent.CHANGE_ZOOM, dispatch);
			addViewListener(RenameFlareNodeEvent.RENAME_FLARE_NODE, handleRenameFlareNode);
			addViewListener(RemoveFlareEdgeEvent.REMOVE_FLARE_EDGE, handleRemoveFlareEdge);
			addViewListener(RemoveFlareNodeEvent.REMOVE_FLARE_NODE, handleRemoveFlareNode);
			addViewListener(SelectFlareNodeEvent.SELECT_FLARE_NODE, handleOutgoingSelectFlareNode);
			addViewListener(ShowKefedSvgEvent.SHOW_KEFED_SVG, dispatch);
//			addViewListener(SaveKefedModelEvent.SAVE_KEFED_MODEL, dispatch);
			
			addContextListener(ChangeZoomEvent.CHANGE_ZOOM, changeZoom);
			addContextListener(LoadFlareGraphEvent.LOAD_FLARE_GRAPH, loadModel);
			
			addModuleListener(SelectFlareNodeEvent.SELECT_FLARE_NODE, handleIncomingSelectFlareNode);
			
			//			addContextListener(LoadKefedModelEvent.LOAD_KEFED_MODEL, changeZoom);
					
			//changeWatcher = BindingUtils.bindProperty(view, "kefedDiagramModel", this, "kefedDiagramModel");			
			
		}
		
		override public function onRemove():void 
		{				
			view.dispose();
		}

		// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
		private function handleAddFlareEdge(e:AddFlareEdgeEvent):void {
			
			if( this.model.shutDownGraph )
				return;
			
			dispatchToModules(e);
			dispatch(e);

			this.updateXml();

		}
		
		private function handleAddFlareNode(e:AddFlareNodeEvent):void {

			if( this.model.shutDownGraph )
				return;
			
			dispatchToModules(e);
			dispatch(e);
		
			this.updateXml();

		}
		
		private function handleRenameFlareNode(e:RenameFlareNodeEvent):void {
			
			if( this.model.shutDownGraph )
				return;
			
			dispatchToModules(e);
			dispatch(e);

			this.updateXml();

		}
		
		private function handleRemoveFlareEdge(e:RemoveFlareEdgeEvent):void {
			
			if( this.model.shutDownGraph )
				return;
			
			dispatchToModules(e);
			dispatch(e);

			this.updateXml();

		}
		
		private function handleRemoveFlareNode(e:RemoveFlareNodeEvent):void {
		
			if( this.model.shutDownGraph )
				return;
			
			dispatchToModules(e);
			dispatch(e);

			this.updateXml();
		
		}
		
		private function handleOutgoingSelectFlareNode(e:SelectFlareNodeEvent):void {
			
			if( this.model.shutDownGraph )
				return;
			
			dispatchToModules(e);
			dispatch(e);
						
		}
		
		private function handleIncomingSelectFlareNode(e:SelectFlareNodeEvent):void {
			
			var uid:String = e.uid;
			var dob:DiagramObject = DiagramObject(view.diagram.getElementByDataObjectId(uid));
			view.diagram.deselectAll();
			
			this.model.shutDownGraph = true;
			view.diagram.selectObject(dob);	
			this.model.shutDownGraph = false;
						
		}
		
		/**
		 * Send the XML of the diagram out to the world
		 */
		private function updateXml():void {
			dispatchToModules( new UpdateKapitXmlEvent(view.diagram.toXML(), new Date()) );
		}
		
		// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

		/** Compute the logarithmic zoom factor.
		 * 
		 * @param x The number
		 * @return 10^x / 10
		 */
		private function logZoom(x:Number):Number {
			return Math.pow(10,x) / 10;
		}
		
		/** Provide a tool tip showing the current zoom value as a scale factor
		 * 
		 * @param val The raw value of the zoom
		 * @return The scaled zoom factor
		 */
		private function logZoomDataTip(val:String):String {
			var x:Number = new Number(val);
			var y:Number = logZoom(x);
			y = Math.round(10*y) / 10;
			return "x" + String(y);
		}
		
		/** Set the zoom value and zoom the diagram.  The zoomLevel
		 *  is set logarithmically.
		 * 
		 *  @param zoomLevel The new zoom leve to set.
		 */
		private function changeZoom(event:ChangeZoomEvent):void {			
			var zoomLevel:Number = event.zoom;
			var z:Number = logZoom(zoomLevel);
			view.diagram.centeredZoom(z, false);
			view.zoomControl.value = zoomLevel;
		}
		
		public function loadModel(event:LoadFlareGraphEvent):void{
			
			CursorManager.setBusyCursor();
			
			this.model.shutDownGraph = true;
			this.model.flareGraph = event.model;
			
			if( view.diagram != null && view._proxy != null) {
				
				view.diagram.fromXML(event.xml);
				view._proxy.importGraph();
				view.dispatchEvent(new ChangeZoomEvent(1.0));
				
			} 

			view.diagram.deselectAll();
			
			this.model.shutDownGraph = false;
			
			CursorManager.removeBusyCursor();
			
		}
	
	}
	
}