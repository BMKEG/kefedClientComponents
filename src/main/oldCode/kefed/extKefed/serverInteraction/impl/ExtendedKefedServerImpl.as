package edu.isi.bmkeg.kefed.services.extKefed.serverInteraction.impl
{

	import edu.isi.bmkeg.kefed.services.extKefed.serverInteraction.*;

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
		
		public function get retrieveCompleteKefedModelFromUuid():AbstractOperation
		{
			return getOperation("retrieveCompleteKefedModelFromUuid");
		}
		
		public function get deleteCompleteKefedModelFromUid():AbstractOperation
		{
			return getOperation("deleteCompleteKefedModelFromUid");
		}
		
		public function get deleteCompleteKefedModel():AbstractOperation
		{
			return getOperation("deleteCompleteKefedModel");
		}
		
		public function get retrieveKefedModelTree():AbstractOperation
		{
			return getOperation("retrieveKefedModelTree");
		}
		
		public function get createNewKefedModelForFragment():AbstractOperation
		{
			return getOperation("createNewKefedModelForFragment");
		}
		
		public function get deleteKefedElements():AbstractOperation
		{
			return getOperation("deleteKefedElements");
		}
		
		public function get deleteKefedEdges():AbstractOperation
		{
			return getOperation("deleteKefedEdges");
		}
		
		public function get insertKefedElement():AbstractOperation
		{
			return getOperation("insertKefedElement");
		}
		
		public function get insertKefedEdge():AbstractOperation
		{
			return getOperation("insertKefedEdge");
		}
		
		public function get moveKefedEdgesAndElements():AbstractOperation
		{
			return getOperation("moveKefedEdgesAndElements");
		}
	}

}