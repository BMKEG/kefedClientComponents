package edu.isi.bmkeg.kefed.services.extKefed.serverInteraction
{

	import mx.rpc.AbstractOperation;

	public interface IExtendedKefedServer {

		// ~~~~~~~~~~~~~~~
		//  functions
		// ~~~~~~~~~~~~~~~
		function get saveCompleteKefedModel():AbstractOperation;
		
		function get retrieveCompleteKefedModel():AbstractOperation;
		
		function get retrieveCompleteKefedModelFromUuid():AbstractOperation;
		
		function get deleteCompleteKefedModel():AbstractOperation;

		function get deleteCompleteKefedModelFromUid():AbstractOperation;

		function get retrieveKefedModelTree():AbstractOperation;
		
		function get createNewKefedModelForFragment():AbstractOperation;
		
		function get deleteKefedElements():AbstractOperation;

		function get deleteKefedEdges():AbstractOperation;
		
		function get insertKefedElement():AbstractOperation;
		
		function get insertKefedEdge():AbstractOperation;
		
		function get moveKefedEdgesAndElements():AbstractOperation;
		
	}

}