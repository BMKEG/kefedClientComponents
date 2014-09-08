package edu.isi.bmkeg.kefed.services.serverInteraction
{

	import mx.rpc.AbstractOperation;

	public interface IExtendedKefedServer {

		// ~~~~~~~~~~~~~~~
		//  functions
		// ~~~~~~~~~~~~~~~
		function get saveCompleteKefedModel():AbstractOperation;
		
		function get retrieveCompleteKefedModel():AbstractOperation;
		
		function get deleteCompleteKefedModel():AbstractOperation;

		function get retrieveKefedModelTree():AbstractOperation;
		
		function get createNewKefedModelForFragment():AbstractOperation;
		
		function get deleteKefedElement():AbstractOperation;

		function get deleteKefedEdge():AbstractOperation;
		
		function get insertKefedElement():AbstractOperation;
		
		function get insertKefedEdge():AbstractOperation;
	}

}