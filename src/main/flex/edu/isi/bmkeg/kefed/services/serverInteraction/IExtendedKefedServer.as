package edu.isi.bmkeg.kefed.services.serverInteraction
{

	import mx.rpc.AbstractOperation;

	public interface IExtendedKefedServer {

		// ~~~~~~~~~~~~~~~
		//  functions
		// ~~~~~~~~~~~~~~~
		function get saveCompleteKefedModel():AbstractOperation;
		
		function get retrieveCompleteKefedModel():AbstractOperation;
		
	}

}