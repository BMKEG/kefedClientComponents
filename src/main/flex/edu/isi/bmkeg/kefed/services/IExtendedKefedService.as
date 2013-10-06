package edu.isi.bmkeg.kefed.services
{

	import edu.isi.bmkeg.kefed.model.design.KefedModel;
	import mx.collections.ArrayCollection;
	
	public interface IExtendedKefedService {

		// ~~~~~~~~~~~~~~~
		//  functions
		// ~~~~~~~~~~~~~~~
		
		function saveCompleteKefedModel(kefedModel:KefedModel):void;

		function retrieveCompleteKefedModel(id:Number):void;

	}

}
