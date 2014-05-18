package edu.isi.bmkeg.ooevv.editor.controller
{	
	import edu.isi.bmkeg.ooevv.editor.model.*;
	import edu.isi.bmkeg.ooevv.events.*;
	import edu.isi.bmkeg.ooevv.services.*;
	import edu.isi.bmkeg.utils.updownload.UploadCompleteEvent;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;
	
	public class UploadOoevvFileCommand extends ModuleCommand
	{
		
		[Inject]
		public var event:UploadOoevvFileEvent;
		
		[Inject]
		public var service:IExtendedOoevvService;
		
		override public function execute():void {
			service.uploadExcelFile(event.data, false);
		}
		
	}
	
}