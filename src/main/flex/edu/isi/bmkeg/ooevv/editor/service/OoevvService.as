package edu.isi.bmkeg.ooevv.editor.service
{
		
	import edu.isi.bmkeg.ooevv.model.*;
	import edu.isi.bmkeg.ooevv.model.scale.*;
	import edu.isi.bmkeg.ooevv.events.*;
	import edu.isi.bmkeg.ooevv.editor.model.*;
	import edu.isi.bmkeg.ooevv.editor.utils.*;
	import edu.isi.bmkeg.utils.*;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.managers.CursorManager;
	import mx.rpc.AsyncToken;
	import mx.rpc.CallResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import org.robotlegs.mvcs.Actor;

	/**
	 * Uility methods for accessing the ArticlesService through Remoting.
	 */
	public class OoevvService
		extends Actor
		implements IOoevvService {
		
		[Inject]
		public var model:OoevvEditorModel;
		
		private var amfRemote:RemoteObject; 
		private var destination:String; 
		private var endpoint:String;
		
		private var crListOoevvElementSets:CallResponder = new CallResponder();
		private var crLoadOoevvElementSet:CallResponder = new CallResponder();
		private var crDeleteModel:CallResponder = new CallResponder();
		private var crLoadOoevvElement:CallResponder = new CallResponder();
		private var crLoadMeasurementScale:CallResponder = new CallResponder();
		
		public function OoevvService():void
		{
			init();
		}

		private function handleFault(event:FaultEvent):void
		{
			Alert.show(event.fault.faultString);
			CursorManager.removeBusyCursor();
		}
		
		public function init():void
		{
			amfRemote  = new RemoteObject();
			amfRemote.destination = "ooevvServiceImpl";
			amfRemote.endpoint = ServiceUtils.getRemotingEndpoint();
			//amfRemote.source = "CF.tbUsersService";
			
			crListOoevvElementSets.addEventListener(ResultEvent.RESULT, handleListOoevvElementSets);
			crListOoevvElementSets.addEventListener(FaultEvent.FAULT, handleFault);
			
			crLoadOoevvElementSet.addEventListener(ResultEvent.RESULT, handleLoadOoevvElementSet);
			crLoadOoevvElementSet.addEventListener(FaultEvent.FAULT, handleFault);
		
			crLoadOoevvElement.addEventListener(ResultEvent.RESULT, handleLoadOoevvElement);
			crLoadOoevvElement.addEventListener(FaultEvent.FAULT, handleFault);
			
			crLoadMeasurementScale.addEventListener(ResultEvent.RESULT, handleLoadMeasurementScale);
			crLoadMeasurementScale.addEventListener(FaultEvent.FAULT, handleFault);
			
			// set up dummies to set up import
			var v:ExperimentalVariable = new ExperimentalVariable();
			var p:OoevvProcess = new OoevvProcess();
			var e:OoevvEntity = new OoevvEntity();
			

			
		}
				
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~		
		// listAllOoevvElementSets():Object;
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~				
		public function listOoevvElementSets():void 
		{
			if( this.amfRemote == null )
				init();
			crListOoevvElementSets.token = amfRemote.listOoevvElementSets();			
		}
		
		public function handleListOoevvElementSets(event:ResultEvent):void 
		{					
			var result:ArrayCollection = ArrayCollection(event.result);
			var e:ListOoevvElementSetsResultEvent = new ListOoevvElementSetsResultEvent(result);
			this.dispatch(e);
		}
		
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~		
		// loadOoevvElementSet(udi:String):OoevvElementSet;
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~				
		public function loadOoevvElementSet(uid:String):void
		{
			crLoadOoevvElementSet.token = amfRemote.loadOoevvElementSet(uid);	
		}
		
		public function handleLoadOoevvElementSet(event:ResultEvent):void 
		{					
			model.ooevvElementSet = OoevvElementSet(event.result);
			var e:LoadOoevvElementSetResultEvent = new LoadOoevvElementSetResultEvent(model.ooevvElementSet);
			
			this.dispatch(e);
		}
		
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~		
		// deleteOoevvElementSet(uid:String):Boolean;
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~				
		public function deleteOoevvElementSet(uid:String):void
		{
			crDeleteModel.token = amfRemote.deleteModel(uid);
		}
		
		public function handleDeleteOoevvElementSet(event:ResultEvent):Boolean {					
			var result:Boolean = Boolean(event.result);
			return result;
		}
		
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~		
		// loadExperimentalVariable(uid:String):ExperimentalVariable;
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~				
		public function loadOoevvElement(uid:String):void
		{
			crLoadOoevvElement.token = amfRemote.loadOoevvElement(uid);
		}
		
		public function handleLoadOoevvElement(event:ResultEvent):void {					
			model.el = OoevvElement(event.result);
			var e:LoadOoevvElementResultEvent = new LoadOoevvElementResultEvent(model.el);
			this.dispatch(e);
		}
		
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~		
		// loadMeasurementScale(uid:String):MeasurementScale;
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~				
		public function loadMeasurementScale(scaleType:String, uid:String):void
		{
			crLoadMeasurementScale.token = amfRemote.loadMeasurementScale(scaleType, uid);
		}
		
		public function handleLoadMeasurementScale(event:ResultEvent):void {
			
			var s:String = event.result.classType;
			
			var ms:MeasurementScale = OoevvUtils.convertToMeasurementScale(s, event.result);
					
			//model.measurementScale = ms;
			//var e:LoadMeasurementScaleResultEvent = new LoadMeasurementScaleResultEvent(model.measurementScale);
			//this.dispatch(e);
			
		}
		
/*		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~		
		// loadOoevvEntity(uid:String):OoevvEntity;
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~				
		public function loadOoevvEntity(uid:String):void
		{
			crLoadOoevvEntity.token = amfRemote.loadOoevvEntity(uid);
		}
		
		public function handleLoadOoevvEntity(event:ResultEvent):void {					
			model.ooevvEntity = OoevvEntity(event.result);
			var e:LoadOoevvEntityResultEvent = new LoadOoevvEntityResultEvent(model.ooevvEntity);
			this.dispatch(e);
		}
		
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~		
		// loadOoevvProcess(uid:String):OoevvProcess;
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~				
		public function loadOoevvProcess(uid:String):void
		{
			crLoadOoevvProcess.token = amfRemote.loadOoevvProcess(uid);
		}
		
		public function handleLoadOoevvProcess(event:ResultEvent):void {					
			model.ooevvProcess = OoevvProcess(event.result);
			var e:LoadOoevvProcessResultEvent = new LoadOoevvProcessResultEvent(model.ooevvProcess);
			this.dispatch(e);
		}*/
		
	}

}