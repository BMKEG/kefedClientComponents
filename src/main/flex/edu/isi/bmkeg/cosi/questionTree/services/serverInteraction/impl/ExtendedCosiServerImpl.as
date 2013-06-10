package edu.isi.bmkeg.cosi.questionTree.services.serverInteraction.impl
{

	import edu.isi.bmkeg.cosi.questionTree.services.serverInteraction.IExtendedCosiServer;

	import mx.collections.ArrayCollection;
	import mx.rpc.AbstractOperation;
	import mx.rpc.AbstractService;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	import mx.rpc.AbstractOperation;

	import edu.isi.bmkeg.utils.dao.Utils;

	public class ExtendedCosiServerImpl 
			extends RemoteObject 
			implements IExtendedCosiServer
	{

		private static const SERVICES_DEST:String = "ExtendedCosiServiceImpl";

		public function CosiServerImpl()
		{
			destination = SERVICES_DEST;
			endpoint = Utils.getRemotingEndpoint();
			showBusyCursor = true;
		}
	
		public function get loadQuestionTree():AbstractOperation
		{
			return getOperation("loadQuestionTree");
		}

	}

}