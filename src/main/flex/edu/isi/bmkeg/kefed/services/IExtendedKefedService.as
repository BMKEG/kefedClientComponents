package edu.isi.bmkeg.kefed.services
{

	import edu.isi.bmkeg.kefed.model.design.*;
	import mx.collections.ArrayCollection;
	
	public interface IExtendedKefedService {

		// ~~~~~~~~~~~~~~~
		//  functions
		// ~~~~~~~~~~~~~~~
		
		function saveCompleteKefedModel(kefedModel:KefedModel):void;

		function retrieveCompleteKefedModel(id:Number):void;

		function deleteCompleteKefedModel(id:Number):void;

		function retrieveKefedModelTree(acId:Number):void;
		
		function createNewKefedModelForFragment(frgId:Number):void;
	
		function deleteKefedElements(uid:ArrayCollection):void;

		function deleteKefedEdges(uid:ArrayCollection):void;

		function insertKefedElement(ke:KefedModelElement, xml:String):void;
		
		function insertKefedEdge(ke:KefedModelEdge, xml:String):void;

		function moveKefedEdgesAndElements(uids:ArrayCollection, dx:int, dy:int):void;
		
	}

}
