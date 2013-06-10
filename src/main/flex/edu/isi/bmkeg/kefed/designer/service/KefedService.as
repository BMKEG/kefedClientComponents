package edu.isi.bmkeg.kefed.designer.service
{
		
	import edu.isi.bmkeg.kefed.diagram.model.KefedDiagramModel;
	import edu.isi.bmkeg.kefed.model.design.*;
	import edu.isi.bmkeg.ooevv.model.*;
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
	public class KefedService
		extends Actor
		implements IKefedService {
		
		[Inject]
		public var model:KefedDiagramModel;
		
		private var amfRemote:RemoteObject; 
		private var destination:String; 
		private var endpoint:String;
		
		private var crListAllKefedModels:CallResponder = new CallResponder();
		private var crQueryKefedModels:CallResponder = new CallResponder();
		private var crRetrieveModel:CallResponder = new CallResponder();
		private var crInsertEmptyKefedModel:CallResponder = new CallResponder();
		private var crSaveEntireKefedModel:CallResponder = new CallResponder();
		private var crListAllOoevvElementSets:CallResponder = new CallResponder();
		private var crLoadOoevvElementSet:CallResponder = new CallResponder();
		private var crDeleteModel:CallResponder = new CallResponder();
		
		public function KefedService()
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
			amfRemote.destination = "kefedModelServiceImpl";
			amfRemote.endpoint = ServiceUtils.getRemotingEndpoint();
			//amfRemote.source = "CF.tbUsersService";
			
			crListAllKefedModels.addEventListener(ResultEvent.RESULT, handleListAllKefedModels);
			crListAllKefedModels.addEventListener(FaultEvent.FAULT, handleFault);
			
			
		}
		
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~		
		// listAllKefedModels():Object;
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~		
		public function listAllKefedModels():void	{
			crListAllKefedModels.token = amfRemote.listAllKefedModels();
		}
		
		public function handleListAllKefedModels(event:ResultEvent):Object {					
			var result:Object = Object(event.result);
			return result;
		}
		
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~		
		// queryKefedModels(queryModel:KefedModel):Object;
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~		
		public function queryKefedModels(queryModel:KefedModel):void {
			crQueryKefedModels.token = amfRemote.queryKefedModels(queryModel);
		}

		public function handleQueryKefedModels(event:ResultEvent):Object {					
			var result:Object = Object(event.result);
			return result;
		}

		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~		
		// retrieveModel(uuid:String):KefedModel;
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~				
		public function retrieveModel(uuid:String):void {
			crRetrieveModel.token = amfRemote.retrieveModel(uuid);
		}
		
		public function handleRetrieveModel(event:ResultEvent):KefedModel {					
			var result:KefedModel = KefedModel(event.result);
			return result;
		}
		
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~		
		// insertEmptyKefedModel(kefed:KefedModel):void;
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~				
		public function insertEmptyKefedModel(kefed:KefedModel):void
		{
			crInsertEmptyKefedModel.token = amfRemote.insertEmptyKefedModel(kefed);			
		}
		
		public function handleInsertEmptyKefedModel(event:ResultEvent):void {					
			//var result:KefedModel = KefedModel(event.result);
			//return result;
		}
		
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~		
		// saveEntireKefedModel(kefed:KefedModel):void;
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~				
		public function saveEntireKefedModel(kefed:KefedModel):void 
		{
			crSaveEntireKefedModel.token = amfRemote.saveEntireKefedModel(kefed);
		}
		
		public function handleSaveEntireKefedModel(event:ResultEvent):void {					
			//var result:KefedModel = KefedModel(event.result);
			//return result;
		}
		
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~		
		// listAllOoevvElementSets():Object;
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~				
		public function listAllOoevvElementSets():void 
		{
			crListAllOoevvElementSets.token = amfRemote.listAllOoevvElementSets();
		}
		
		public function handleListAllOoevvElementSets(event:ResultEvent):Object {					
			var result:Object = Object(event.result);
			return result;
		}
		
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~		
		// loadOoevvElementSet(udi:String):OoevvElementSet;
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~				
		public function loadOoevvElementSet(uid:String):void
		{
			crLoadOoevvElementSet.token = amfRemote.loadOoevvElementSet(uid);	
		}
		
		public function handleLoadOoevvElementSet(event:ResultEvent):OoevvElementSet {					
			var result:OoevvElementSet = OoevvElementSet(event.result);
			return result;
		}
		
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~		
		// deleteModel(uid:String):Boolean;
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~				
		public function deleteModel(uid:String):void
		{
			crDeleteModel.token = amfRemote.deleteModel(uid);
		}
		
		public function handleDeleteModel(event:ResultEvent):Boolean {					
			var result:Boolean = Boolean(event.result);
			return result;
		}
		
	}

}