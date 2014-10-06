package edu.isi.bmkeg.kefed.cytoscape
{

	import com.hillelcoren.utils.ArrayCollectionUtils;
	
	import edu.isi.bmkeg.kefed.cytoscape.*;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
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
	public class CytoscapeWebMediator extends ModuleMediator 
	{

		[Inject]
		public var view:CytoscapeWeb;

		[Inject]
		public var model:KefedDesignerModel;
		
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

			addViewListener(RobotlegsListenerEvent.ROBOTLEGS_LISTENER + "Create Outlink", 
				handleCreateOutlink);
			
			addContextListener(InsertKefedElementEvent.INSERT_KEFED_ELEMENT, 
					handleGraphChange);
			
			addContextListener(DeleteKefedEdgeEvent.DELETE_KEFED_EDGE, 
					handleGraphChange);
			
			addContextListener(RetrieveCompleteKefedModelResultEvent.RETRIEVE_COMPLETE_KEFED_MODEL_RESULT, 
					handleLoadGraph);

			addContextListener(DeleteKefedElementEvent.REMOVE_KEFED_ELEMENT, 
					handleGraphChange);
			//addContextListener(SelectKefedElementEvent.SELECT_KEFED_ELEMENT, handleIncomingSelectElement);

			//addModuleListener(DoodadModuleEvent.DO_STUFF_REQUESTED, handleDoStuffRequest, DoodadModuleEvent);

			var extMed:ExternalMediator = ApplicationFacade.getInstance()
				.retrieveMediator( ExternalMediator.NAME ) as ExternalMediator;
			extMed.enableCallback("contextmenu");
			
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
		
		private function handleCreateOutlink(e:Event):void {
			
			//	view.model = model.kefedModel;
			trace("layout");
			
		}
		private function handleLoadGraph(e:RetrieveCompleteKefedModelResultEvent):void {
			
			var extMed:ExternalMediator = ApplicationFacade.getInstance()
				.retrieveMediator( ExternalMediator.NAME ) as ExternalMediator;

			var pp:Object = new Object();
			var network:Object = new Object();
			pp["network"] = network;
			var data:Object = new Object();
			network["data"] = data;
			var nodes:Array = new Array();
			data["nodes"] = nodes;

			for each (var nd:KefedModelElement in e.kefedModel.elements) {
				var node:Object = new Object();
				node["id"] = nd.uuid;
				node["label"] = nd.defn.termValue;
				node["type"] = nd.elementType;
				nodes.push(node);
			}
			
			var edges:Array = new Array();
			data["edges"] = edges;

			for each (var ed:KefedModelEdge in e.kefedModel.edges) {
				var edge:Object = new Object();
				edge["source"] = ed.source.uuid;
				edge["target"] = ed.target.uuid;
				edges.push( edge );
			}
			
			var dataschema:Object = {
				nodes: [ 
					{ name: "label", type: "string" }, 
					{ name: "type", type: "string" }
				]
			};
			network["dataSchema"] = dataschema;
			
			var layout:Object = new Object();
			var options:Object = new Object();
			layout["options"] = options;
			layout["name"] = "Preset";
			var points:Array = new Array();
			options["points"] = points;	
			for each (var nn:KefedModelElement in e.kefedModel.elements) {
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
			
			extMed.draw(pp);
			
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
				
	}
	
}