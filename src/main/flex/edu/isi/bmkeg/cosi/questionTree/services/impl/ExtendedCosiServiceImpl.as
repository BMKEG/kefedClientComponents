package edu.isi.bmkeg.cosi.questionTree.services.impl
{

	import flash.events.Event;
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AbstractService;
	import mx.rpc.AsyncResponder;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import org.robotlegs.mvcs.Actor;

	import edu.isi.bmkeg.cosi.model.Question;
	import edu.isi.bmkeg.cosi.model.Investigation;
	import edu.isi.bmkeg.cosi.questionTree.services.events.*;

	import edu.isi.bmkeg.cosi.questionTree.services.serverInteraction.*;

	import edu.isi.bmkeg.cosi.questionTree.services.*;

	import edu.isi.bmkeg.utils.dao.ServiceFailureEvent;

	public class ExtendedCosiServiceImpl extends Actor implements IExtendedCosiService {

		private var _server:IExtendedCosiServer;

		[Inject]
		public function get server():IExtendedCosiServer

		{
			return _server;
		}

		public function set server(s:IExtendedCosiServer):void
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
			var failureEvent:ServiceFailureEvent = new ServiceFailureEvent(event);
			dispatch(failureEvent);
		}

		// ~~~~~~~~~~~~~~~
		// functions
		// ~~~~~~~~~~~~~~~

		public function loadQuestionTree():void {
			server.loadQuestionTree.cancel();
			server.loadQuestionTree.addEventListener(ResultEvent.RESULT, loadQuestionTreeResultHandler);
			server.loadQuestionTree.send();
		}


		// ~~~~~~~~~~~~~~~~~~~~
		// Count result handler
		// ~~~~~~~~~~~~~~~~~~~~

		private function loadQuestionTreeResultHandler(event:ResultEvent):void
		{
			var list:ArrayCollection = ArrayCollection(event.result);
			dispatch(new LoadQuestionTreeResultEvent(list));
		}


	}

}
