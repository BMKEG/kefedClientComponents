package edu.isi.bmkeg.ooevv.services.impl
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

	import edu.isi.bmkeg.ooevv.events.*;
	import edu.isi.bmkeg.ooevv.services.serverInteraction.*;
	import edu.isi.bmkeg.ooevv.services.*;

	import edu.isi.bmkeg.utils.dao.*;

	public class ExtendedOoevvServiceImpl extends Actor implements IExtendedOoevvService {

		private var _server:IExtendedOoevvServer;

		[Inject]
		public function get server():IExtendedOoevvServer

		{
			return _server;
		}

		public function set server(s:IExtendedOoevvServer):void
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
			var failureEvent:UploadExcelFileFaultEvent = new UploadExcelFileFaultEvent(event);
			dispatch(failureEvent);
		}

		// ~~~~~~~~~
		// functions
		// ~~~~~~~~~

		public function uploadExcelFile(excelFileData:Object, lookup:Boolean):void {
			server.uploadExcelFile.cancel();
			server.uploadExcelFile.addEventListener(ResultEvent.RESULT, uploadExcelFileResultHandler);
			server.uploadExcelFile.addEventListener(FaultEvent.FAULT, faultHandler);
			server.uploadExcelFile.send(excelFileData, lookup);
		}

		private function uploadExcelFileResultHandler(event:ResultEvent):void
		{
			var oesVpdmfId:Number = Number(event.result);
			dispatch(new UploadExcelFileResultEvent(oesVpdmfId));
		}
		
	}

}
