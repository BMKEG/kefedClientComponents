package edu.isi.bmkeg.ooevv.editor.service
{
	import edu.isi.bmkeg.ooevv.editor.model.*;
	import mx.rpc.events.ResultEvent;

	public interface IOoevvService
	{
		
		function listOoevvElementSets():void;
		function handleListOoevvElementSets(event:ResultEvent):void;
		
		function loadOoevvElementSet(uid:String):void;
		function handleLoadOoevvElementSet(event:ResultEvent):void;
		
		function deleteOoevvElementSet(uid:String):void;
		function handleDeleteOoevvElementSet(event:ResultEvent):Boolean;
		
		function loadOoevvElement(uid:String):void;
		function handleLoadOoevvElement(event:ResultEvent):void;

		function loadMeasurementScale(scaleType:String, uid:String):void;
		function handleLoadMeasurementScale(event:ResultEvent):void;

		
	}
	
}