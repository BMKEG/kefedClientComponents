package edu.isi.bmkeg.kefed.designer.service
{
	import edu.isi.bmkeg.kefed.model.design.*;
	import edu.isi.bmkeg.ooevv.model.*;
	import mx.rpc.events.ResultEvent;

	public interface IKefedService
	{
		
		function listAllKefedModels():void;
		function handleListAllKefedModels(event:ResultEvent):Object;
		
		function queryKefedModels(queryModel:KefedModel):void;
		function handleQueryKefedModels(event:ResultEvent):Object;
		
		function retrieveModel(uuid:String):void;
		function handleRetrieveModel(event:ResultEvent):KefedModel;
		
		function insertEmptyKefedModel(kefed:KefedModel):void;
		function handleInsertEmptyKefedModel(event:ResultEvent):void;
		
		function saveEntireKefedModel(kefed:KefedModel):void;
		function handleSaveEntireKefedModel(event:ResultEvent):void;
		
		function listAllOoevvElementSets():void;
		function handleListAllOoevvElementSets(event:ResultEvent):Object;
		
		function loadOoevvElementSet(uid:String):void;
		function handleLoadOoevvElementSet(event:ResultEvent):OoevvElementSet;
		
		function deleteModel(uid:String):void;
		function handleDeleteModel(event:ResultEvent):Boolean;
		
	}
	
}