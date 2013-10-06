package edu.isi.bmkeg.kefed.services.serverInteraction.impl
{

	import edu.isi.bmkeg.kefed.services.serverInteraction.*;

	import mx.collections.ArrayCollection;
	import mx.rpc.AbstractOperation;
	import mx.rpc.AbstractService;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	import mx.rpc.AbstractOperation;

	import edu.isi.bmkeg.utils.dao.Utils;

	public class ExtendedKefedServerImpl 
			extends RemoteObject 
			implements IExtendedKefedServer
	{

			private static const SERVICES_DEST:String = "extendedKefedServiceImpl";

		public function ExtendedKefedServerImpl()
		{
			destination = SERVICES_DEST;
			endpoint = Utils.getRemotingEndpoint();
			showBusyCursor = true;
		}
		
		// ~~~~~~~~~~~~~~~
		// functions
		// ~~~~~~~~~~~~~~~
		public function get saveCompleteKefedModel():AbstractOperation
		{
			return getOperation("saveCompleteKefedModel");
		}

		public function get retrieveCompleteKefedModel():AbstractOperation
		{
			return getOperation("retrieveCompleteKefedModel");
		}
		
	}

}