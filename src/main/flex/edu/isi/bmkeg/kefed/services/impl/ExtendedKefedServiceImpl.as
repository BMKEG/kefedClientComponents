package edu.isi.bmkeg.kefed.services.impl
{

	import edu.isi.bmkeg.kefed.model.design.*;
	import edu.isi.bmkeg.kefed.events.*;
	import edu.isi.bmkeg.kefed.events.modelLevel.*;
	import edu.isi.bmkeg.kefed.events.elementLevel.*;
	import edu.isi.bmkeg.kefed.services.*;
	import edu.isi.bmkeg.kefed.services.serverInteraction.*;
	import edu.isi.bmkeg.utils.dao.*;
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AbstractService;
	import mx.rpc.AsyncResponder;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.robotlegs.mvcs.Actor;

	public class ExtendedKefedServiceImpl extends Actor implements IExtendedKefedService {

		private var _server:IExtendedKefedServer;

		[Inject]
		public function get server():IExtendedKefedServer

		{
			return _server;
		}

		public function set server(s:IExtendedKefedServer):void
		{
			_server = s;
			initServer();
		}

		private function initServer():void
		{
			if (_server is AbstractService)
			{
				AbstractService(_server).addEventListener(FaultEvent.FAULT,faultHandler);
			}
		}

		private function asyncResponderFailHandler(fail:Object, token:Object):void
		{
			faultHandler(fail as FaultEvent);
		}

		private function faultHandler(event:FaultEvent):void
		{
			dispatch(event);
		}

		// ~~~~~~~~~
		// functions
		// ~~~~~~~~~

		public function saveCompleteKefedModel(kefedModel:KefedModel):void {
			server.saveCompleteKefedModel.cancel();
			server.saveCompleteKefedModel.addEventListener(ResultEvent.RESULT, saveCompleteKefedModelResultHandler);
			server.saveCompleteKefedModel.addEventListener(FaultEvent.FAULT, faultHandler);
			server.saveCompleteKefedModel.send(kefedModel);
		}
		
		private function saveCompleteKefedModelResultHandler(event:ResultEvent):void
		{
			var success:Boolean = Boolean(event.result);
			dispatch(new SaveCompleteKefedModelResultEvent(success));
		}
		
		// ~~~~~~~~~
		
		public function retrieveCompleteKefedModel(id:Number):void {
			server.retrieveCompleteKefedModel.cancel();
			server.retrieveCompleteKefedModel.addEventListener(ResultEvent.RESULT, retrieveCompleteKefedModelResultHandler);
			server.retrieveCompleteKefedModel.addEventListener(FaultEvent.FAULT, faultHandler);
			server.retrieveCompleteKefedModel.send(id);
		}
		
		private function retrieveCompleteKefedModelResultHandler(event:ResultEvent):void
		{
			var kefedModel:KefedModel = KefedModel(event.result);
			dispatch(new RetrieveCompleteKefedModelResultEvent(kefedModel));
		}		

		// ~~~~~~~~~
		
		public function deleteCompleteKefedModel(id:Number):void {
			server.deleteCompleteKefedModel.cancel();
			server.deleteCompleteKefedModel.addEventListener(ResultEvent.RESULT, deleteCompleteKefedModelResultHandler);
			server.deleteCompleteKefedModel.addEventListener(FaultEvent.FAULT, faultHandler);
			server.deleteCompleteKefedModel.send(id);
		}
		
		private function deleteCompleteKefedModelResultHandler(event:ResultEvent):void
		{
			var complete:Boolean = Boolean(event.result);
			dispatch(new DeleteCompleteKefedModelResultEvent(complete));
		}		
		
		// ~~~~~~~~~
		
		public function retrieveKefedModelTree():void 
		{
			server.retrieveKefedModelTree.cancel();
			server.retrieveKefedModelTree.addEventListener(ResultEvent.RESULT, retrieveKefedModelTreeResultHandler);
			server.retrieveKefedModelTree.addEventListener(FaultEvent.FAULT, faultHandler);
			server.retrieveKefedModelTree.send();
		}
		
		private function retrieveKefedModelTreeResultHandler(event:ResultEvent):void
		{
			var tree:XML = event.result as XML;
			dispatch(new RetrieveKefedModelTreeResultEvent(tree));
		}		
		
		// ~~~~~~~~~
		
		public function createNewKefedModelForFragment(frgId:Number):void 
		{
			server.createNewKefedModelForFragment.cancel();
			server.createNewKefedModelForFragment.addEventListener(ResultEvent.RESULT, createNewKefedModelForFragmentResultHandler);
			server.createNewKefedModelForFragment.addEventListener(FaultEvent.FAULT, faultHandler);
			server.createNewKefedModelForFragment.send(frgId);
		}
		
		private function createNewKefedModelForFragmentResultHandler(event:ResultEvent):void
		{
			var model:KefedModel = KefedModel(event.result);
			dispatch(new CreateNewKefedModelForFragmentResultEvent(model));
		}		
		
		// ~~~~~~~~~
		
		public function deleteKefedElement(uid:String, xml:String):void 
		{
			server.deleteKefedElement.cancel();
			server.deleteKefedElement.addEventListener(ResultEvent.RESULT, deleteKefedNodeResultHandler);
			server.deleteKefedElement.addEventListener(FaultEvent.FAULT, faultHandler);
			server.deleteKefedElement.send(uid, xml);
		}
		
		private function deleteKefedNodeResultHandler(event:ResultEvent):void
		{
			var success:Boolean = Boolean(event.result);
			dispatch(new DeleteKefedElementResultEvent(success));
		}	

		// ~~~~~~~~~
		
		public function deleteKefedEdge(uid:String, xml:String):void 
		{
			server.deleteKefedEdge.cancel();
			server.deleteKefedEdge.addEventListener(ResultEvent.RESULT, deleteKefedEdgeResultHandler);
			server.deleteKefedEdge.addEventListener(FaultEvent.FAULT, faultHandler);
			server.deleteKefedEdge.send(uid, xml);
		}
		
		private function deleteKefedEdgeResultHandler(event:ResultEvent):void
		{
			var success:Boolean = Boolean(event.result);
			dispatch(new DeleteKefedEdgeResultEvent(success));
		
		}	
		
		// ~~~~~~~~~
		
		public function insertKefedElement(ke:KefedModelElement, xml:String):void 
		{
			server.insertKefedElement.cancel();
			server.insertKefedElement.addEventListener(ResultEvent.RESULT, insertKefedNodeResultHandler);
			server.insertKefedElement.addEventListener(FaultEvent.FAULT, faultHandler);
			server.insertKefedElement.send(ke, xml);
		}
		
		private function insertKefedNodeResultHandler(event:ResultEvent):void
		{
			var success:Boolean = Boolean(event.result);
			dispatch(new InsertKefedElementResultEvent(success));
		}	
		
		// ~~~~~~~~~
		
		public function insertKefedEdge(ke:KefedModelEdge, xml:String):void 
		{
			server.insertKefedEdge.cancel();
			server.insertKefedEdge.addEventListener(ResultEvent.RESULT, insertKefedEdgeResultHandler);
			server.insertKefedEdge.addEventListener(FaultEvent.FAULT, faultHandler);
			server.insertKefedEdge.send(ke, xml);
		}
		
		private function insertKefedEdgeResultHandler(event:ResultEvent):void
		{
			var success:Boolean = Boolean(event.result);
			dispatch(new InsertKefedEdgeResultEvent(success));
		}	
				
	}

}
