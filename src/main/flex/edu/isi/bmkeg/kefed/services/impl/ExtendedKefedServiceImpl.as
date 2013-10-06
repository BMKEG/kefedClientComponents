package edu.isi.bmkeg.kefed.services.impl
{

	import edu.isi.bmkeg.kefed.model.design.*;
	import edu.isi.bmkeg.kefed.events.*;
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
		
	}

}
