package edu.isi.bmkeg.ooevv.services.serverInteraction
{

	import mx.rpc.AbstractOperation;

	public interface IExtendedOoevvServer {

		// ~~~~~~~~~~~~~~~
		//  functions
		// ~~~~~~~~~~~~~~~
		function get uploadExcelFile():AbstractOperation;

		function get generateExcelFile():AbstractOperation;
		
		function get deleteOoevvElementSet():AbstractOperation;

	}

}