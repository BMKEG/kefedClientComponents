package edu.isi.bmkeg.ooevv.services.serverInteraction.impl
{

	import edu.isi.bmkeg.ooevv.services.serverInteraction.*;

	import mx.collections.ArrayCollection;
	import mx.rpc.AbstractOperation;
	import mx.rpc.AbstractService;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	import mx.rpc.AbstractOperation;

	import edu.isi.bmkeg.utils.dao.Utils;

	public class ExtendedOoevvServerImpl 
			extends RemoteObject 
			implements IExtendedOoevvServer
	{

		private static const SERVICES_DEST:String = "extendedOoevvServiceImpl";

		public function ExtendedOoevvServerImpl()
		{
			destination = SERVICES_DEST;
			endpoint = Utils.getRemotingEndpoint();
			showBusyCursor = true;
		}
		
		// ~~~~~~~~~~~~~~~
		// functions
		// ~~~~~~~~~~~~~~~
		public function get uploadExcelFile():AbstractOperation
		{
			return getOperation("uploadExcelFile");
		}
		
		public function get generateExcelFile():AbstractOperation
		{
			return getOperation("generateExcelFile");
		}
		
		public function get deleteOoevvElementSet():AbstractOperation
		{
			return getOperation("deleteOoevvElementSet");
		}
		
		
	}

}