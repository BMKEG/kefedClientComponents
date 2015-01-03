package edu.isi.bmkeg.ooevv.services
{

	public interface IExtendedOoevvService {

		// ~~~~~~~~~~~~~~~
		//  functions
		// ~~~~~~~~~~~~~~~
		
		function uploadExcelFile(excelFileData:Object, lookup:Boolean):void;
		
		function generateExcelFile(name:String):void;
		
		function deleteOoevvElementSet(vpdmfId:Number):void;

	}

}
