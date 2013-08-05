package edu.isi.bmkeg.ooevv.editor.controller
{	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;
	
	import edu.isi.bmkeg.ooevv.editor.model.OoevvEditorModel;
	import edu.isi.bmkeg.ooevv.services.*;
	import edu.isi.bmkeg.ooevv.events.*;

	import edu.isi.bmkeg.utils.updownload.UploadCompleteEvent;
	
	import flash.events.*;
	import flash.utils.ByteArray;
	import flash.net.FileReference;
	
	public class GenerateExcelFileResultCommand extends ModuleCommand
	{
		
		[Inject]
		public var event:GenerateExcelFileResultEvent;
		
		[Inject]
		public var model:OoevvEditorModel;
				
		override public function execute():void {	

			model.blankXls = event.data;
		
		}
		
		
	}
	
}