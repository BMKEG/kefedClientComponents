package edu.isi.bmkeg.kefed.cytoscape
{

	import com.hillelcoren.utils.ArrayCollectionUtils;
	
	import edu.isi.bmkeg.kefed.cytoscape.*;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
	import edu.isi.bmkeg.kefed.diagram.controller.events.*;
	import edu.isi.bmkeg.kefed.events.*;
	import edu.isi.bmkeg.kefed.events.elementLevel.*;
	import edu.isi.bmkeg.kefed.events.modelLevel.*;
	import edu.isi.bmkeg.kefed.model.design.*;
	import edu.isi.bmkeg.kefed.rl.events.*;
	import edu.isi.bmkeg.utils.ServiceUtils;
	
	import flash.events.Event;
	import flash.external.ExternalInterface;
	import flash.utils.flash_proxy;
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
	
	import org.cytoscapeweb.ApplicationFacade;
	import org.cytoscapeweb.CytoscapeWeb;
	import org.cytoscapeweb.events.*;
	import org.cytoscapeweb.model.*;
	import org.cytoscapeweb.model.ConfigProxy;
	import org.cytoscapeweb.model.ContextMenuProxy;
	import org.cytoscapeweb.model.GraphProxy;
	import org.cytoscapeweb.model.converters.*;
	import org.cytoscapeweb.model.data.ConfigVO;
	import org.cytoscapeweb.model.data.VisualStyleVO;
	import org.cytoscapeweb.rlTriggerEvents.*;
	import org.cytoscapeweb.util.ExternalFunctions;
	import org.cytoscapeweb.util.Groups;
	import org.cytoscapeweb.util.Layouts;
	import org.cytoscapeweb.view.*;
	import org.cytoscapeweb.view.ApplicationMediator;
	import org.cytoscapeweb.view.ExternalMediator;
	import org.cytoscapeweb.view.GraphMediator;
	import org.puremvc.as3.patterns.observer.Notification;
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	
	/**
	 * Note that, because CytoscapeWeb uses PureMVC, the interaction with the component will largely
	 * be based on callbacks rather than events. 
	 */ 
	public class CytoscapeKefedDesignerMediator extends ModuleMediator 
	{

		[Inject]
		public var view:CytoscapeKefedDesigner;

		[Inject]
		public var model:KefedDesignerModel;

		private var loaded:Boolean = false;
		private var linkStart:String = "";

		private var facade:ApplicationFacade;
		private var extMed:ExternalMediator = ApplicationFacade.getInstance()
			.retrieveMediator( ExternalMediator.NAME ) as ExternalMediator;

		private var configProxy:ConfigProxy = ApplicationFacade.getInstance()
			.retrieveProxy( ConfigProxy.NAME ) as ConfigProxy;
		
		override public function onRegister():void 
		{
			
			facade = ApplicationFacade.getInstance();
//			addViewListener(ApplicationEvent.AS3, handleOutgoingSelectElement);
			
			addViewListener(RobotlegsReadyCallbackEvent.ROBOTLEGS_READY_CALLBACK, 
					graphReady);

			addViewListener(RobotlegsListenerEvent.ROBOTLEGS_LISTENER + "contextmenu", 
				handleCallback_menu);

			addViewListener("RobotlegsContextMenuCallback__Create Outlink",
				handleCreateOutlink);

			addViewListener(RobotlegsListenerEvent.ROBOTLEGS_LISTENER + "select", 
				handleSelect);

			addViewListener(RobotlegsListenerEvent.ROBOTLEGS_LISTENER + "deselect", 
				handleDeselect);

			addViewListener(RobotlegsListenerEvent.ROBOTLEGS_LISTENER + "dragstop", 
				handleDragstop);
			
			addViewListener(DropKefedNodeIntoDiagramEvent.DROP_KEFED_NODE_INTO_DIAGRAM, 
				handleDropKefedNodeIntoDiagram);
			
			addContextListener(InsertKefedElementEvent.INSERT_KEFED_ELEMENT, 
					handleGraphChange);
			
			addContextListener(DeleteKefedEdgesEvent.DELETE_KEFED_EDGE, 
					handleGraphChange);
			
			addContextListener(RetrieveCompleteKefedModelResultEvent.RETRIEVE_COMPLETE_KEFED_MODEL_RESULT, 
					handleLoadGraph);

			addContextListener(DeleteKefedElementsEvent.REMOVE_KEFED_ELEMENTS, 
					handleGraphChange);
			//addContextListener(SelectKefedElementEvent.SELECT_KEFED_ELEMENT, handleIncomingSelectElement);

			//addModuleListener(DoodadModuleEvent.DO_STUFF_REQUESTED, handleDoStuffRequest, DoodadModuleEvent);

			var extMed:ExternalMediator = ApplicationFacade.getInstance()
				.retrieveMediator( ExternalMediator.NAME ) as ExternalMediator;
			extMed.enableCallback("contextmenu");
			extMed.enableCallback("select");
			extMed.enableCallback("deselect");
			extMed.enableCallback("dragstop");
							
		}
		
		private function handleGraphChange(e:Event):void {
			
			trace("graph change");
			//	view.model = model.kefedModel;
			
		}
		
		private function graphReady(e:Event):void {
			
			var extMed:ExternalMediator = ApplicationFacade.getInstance()
				.retrieveMediator( ExternalMediator.NAME ) as ExternalMediator;
			
			extMed.addContextMenuItem("Create Outlink", Groups.NODES);
			
			trace("graph ready");
		
		}
		
		private function handleCallback_menu(e:Event):void {
			
			//	view.model = model.kefedModel;
			trace("layout");
			
		}
		
		private function handleCreateOutlink(e:RobotlegsContextMenuCallbackEvent):void {
			
			var ev:StartFlareEdgeInDiagramEvent = new StartFlareEdgeInDiagramEvent(e.uuid);
			this.dispatchToModules(ev);
			
		}
		
		private function handleSelect(e:Event):void {
			
			var eventData:ArrayCollection = new ArrayCollection();
			
			//
			// Nodes selected is an array in the data field
			//
			var selection:Array = e["data"] as Array;
			var groups:String = "";
			if( selection.length > 0 ) {
				groups = selection[0].group;
			} else {
				return;
			}
			
			if( groups == "nodes" ) { 
				
				var nodes:ArrayCollection = new ArrayCollection();
				for each( var s:Object in selection ) {
					nodes.addItem( s.data.id );
				}	
				var ev:SelectFlareNodesInDiagramEvent = 
						new SelectFlareNodesInDiagramEvent(nodes);
				this.dispatchToModules(ev);		
				
			} else if( groups == "edges" ) { 
					
				var edges:ArrayCollection = new ArrayCollection();
				for each( var s2:Object in selection ) {
					var o:Object = new Object();
					o.sourceId = s2.data.source;
					o.targetId = s2.data.target;
					edges.addItem( o );
				}	
				var ev2:SelectFlareEdgesInDiagramEvent = 
						new SelectFlareEdgesInDiagramEvent(edges);
				this.dispatchToModules(ev2);
				
			}
			
		}
		
		private function handleDeselect(e:Event):void {
			
			var ev:DeselectElementsInDiagramEvent = 
					new DeselectElementsInDiagramEvent();
			this.dispatchToModules(ev);
			
		}
		
		private function handleDragstop(e:RobotlegsListenerEvent):void {
			
			var uid:String = e.data.uid;
			var refUid:String = "";
			var newX:int = e.data.x;
			var newY:int = e.data.y;
			
			var ev:DragSelectionEvent = 
				new DragSelectionEvent(e.data.uid, 
					e.data.newX, e.data.newY, e.data.refUid,
					e.data.refX, e.data.refY );
			this.dispatchToModules(ev);
			
		}
		
		private function handleLoadGraph(e:RetrieveCompleteKefedModelResultEvent):void {
			
			var extMed:ExternalMediator = ApplicationFacade.getInstance()
				.retrieveMediator( ExternalMediator.NAME ) as ExternalMediator;
			

			if( !loaded ) {
				
				var pp:Object = buildCytoscapeNetworkObject(e.kefedModel);
				extMed.draw(pp);		
				loaded = true;
			
			} else {

				var list:Array = buildCytoscapeElementsList(e.kefedModel);
				
				var network:Object = extMed.readNetworkModel();
				
				var edges:Array = network.data.edges;
				var edgeIds:Array = new Array();
				for each (var ed:Object in edges) {
					edgeIds.push(ed["id"]);
				}
				extMed.removeElements("edges", edgeIds);
				
				var nodes:Array = network.data.nodes;
				var nodeIds:Array = new Array();
				for each (var n:Object in nodes) {
					nodeIds.push(n["id"]);
				}
				extMed.removeElements("nodes", nodeIds);
				
				extMed.addElements( list );
				extMed.panToCenter();
				
			}
			
		}
		
		private function buildCytoscapeNetworkObject(m:KefedModel):Object {
			
			var pp:Object = new Object();
			var network:Object = new Object();
			pp["network"] = network;
			var data:Object = new Object();
			network["data"] = data;
			var nodes:Array = new Array();
			data["nodes"] = nodes;
			
			for each (var nd:KefedModelElement in m.elements) {
				var node:Object = new Object();
				node["id"] = nd.uuid;
				node["group"] = Groups.NODES;
				node["label"] = nd.defn.termValue;
				node["type"] = nd.elementType;
				nodes.push(node);
			}
			
			var edges:Array = new Array();
			data["edges"] = edges;
			
			for each (var ed:KefedModelEdge in m.edges) {
				var edge:Object = new Object();
				edge["group"] = Groups.EDGES;
				edge["source"] = ed.source.uuid;
				edge["target"] = ed.target.uuid;
				edge["directed"] = true;
				edges.push( edge );
			}
			
			var dataschema:Object = {
				nodes: [ 
					{ name: "label", type: "string" }, 
					{ name: "type", type: "string" },
					{ name: "group", type: "string" } 
				],
				edges: [ 
					{ name: "group", type: "string" } 
				]
			};
			network["dataSchema"] = dataschema;
			
			var layout:Object = new Object();
			var options:Object = new Object();
			layout["options"] = options;
			layout["name"] = "Preset";
			var points:Array = new Array();
			options["points"] = points;	
			for each (var nn:KefedModelElement in m.elements) {
				var nnode:Object = new Object();
				nnode["id"] = nn.uuid;
				nnode["x"] = nn.x;
				nnode["y"] = nn.y;
				points.push(nnode);
			}
			pp["layout"] = layout;
			
			var url:String = ServiceUtils.getAppUrl();
			var p:int = url.lastIndexOf("/");
			url = url.substr(0,p);	
			
			var imageMapper:Object= {
				attrName: "type",
				entries: [ 
					{ attrValue: "ProcessInstance", 
						value: url+"/images/kefedElements/process.jpg" },
					{ attrValue: "EntityInstance",
						value: url+"/images/kefedElements/entity.jpg" },
					{ attrValue: "MeasurementInstance", 
						value: url+"/images/kefedElements/measurement.jpg" },
					{ attrValue: "ParameterInstance", 
						value: url+"/images/kefedElements/parameter.jpg" },
					{ attrValue: "ConstantInstance", 
						value: url+"/images/kefedElements/constant.jpg" }
				]
			};
			
			var heightMapper:Object= {
				attrName: "type",
				entries: [ 
					{ attrValue: "ProcessInstance", 
						value: (141/3) },
					{ attrValue: "EntityInstance",
						value: 141/3 },
					{ attrValue: "MeasurementInstance", 
						value: 145/3 },
					{ attrValue: "ParameterInstance", 
						value: 170/3 },
					{ attrValue: "ConstantInstance", 
						value: 70/3 }
				]
			};
			
			var widthMapper:Object= {
				attrName: "type",
				entries: [ 
					{ attrValue: "ProcessInstance", 
						value: 260/3 },
					{ attrValue: "EntityInstance",
						value: 260/3 },
					{ attrValue: "MeasurementInstance", 
						value: 145/3 },
					{ attrValue: "ParameterInstance", 
						value: 64/3 },
					{ attrValue: "ConstantInstance", 
						value: 64/3 }
				]
			};
			
			var style:Object = {
				nodes: {
					shape: "RECTANGLE",
					borderWidth: 1,
					borderColor: "#ffffff",
					image: { discreteMapper: imageMapper },
					width: { discreteMapper: widthMapper },
					height: { discreteMapper: heightMapper }
				}
			};
			
			pp["visualStyle"] = style;
			
			return pp;
		}
		
		private function buildCytoscapeElementsList(m:KefedModel):Array {
			
			var elements:Array = new Array();
			
			for each (var nd:KefedModelElement in m.elements) {
				var node:Object = new Object();
				node["x"] = nd.x;
				node["y"] = nd.y;
				node["group"] = Groups.NODES;
				var data:Object = new Object();
				node["data"] = data;
				data["id"] = nd.uuid;
				data["label"] = nd.defn.termValue;
				data["type"] = nd.elementType;
				elements.push(node);
			}
						
			for each (var ed:KefedModelEdge in m.edges) {
				var edge:Object = new Object();
				edge["group"] = Groups.EDGES;
				var data2:Object = new Object();
				edge["data"] = data2;
				data2["source"] = ed.source.uuid;
				data2["target"] = ed.target.uuid;
				data2["directed"] = true;
				elements.push( edge );
			}
			
			return elements;
		}
		
		/*private function handleIncomingSelectElement(e:SelectKefedElementEvent):void {
			var nRows:int = model.kefedModel.elements.length;
			for( var i:int = 0; i<nRows; i++) {
				var k:KefedModelElement = KefedModelElement(model.kefedModel.elements.getItemAt(i));
				if( e.uid == k.uuid ) {
					view.objectsGrid.selectedIndex = i;
					return;
				}
			}
		}*/
		
		private function handleOutgoingSelectElement(e:SelectKefedElementEvent):void {

			this.dispatch(e);
			this.dispatchToModules(new SelectFlareNodeEvent(e.uid));

		}
			
		private function handleDropKefedNodeIntoDiagram(e:Event):void {	
			
			this.dispatch(e);
			this.dispatchToModules(e);
		
		}		
		
	}
	
}