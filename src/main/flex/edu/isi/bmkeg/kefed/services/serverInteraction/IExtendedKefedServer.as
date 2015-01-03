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
		
		function get deleteKefedElements():AbstractOperation;

		function get deleteKefedEdges():AbstractOperation;
		
		function get insertKefedElement():AbstractOperation;
		
		function get insertKefedEdge():AbstractOperation;
		
		function get moveKefedEdgesAndElements():AbstractOperation;
		
	}

}