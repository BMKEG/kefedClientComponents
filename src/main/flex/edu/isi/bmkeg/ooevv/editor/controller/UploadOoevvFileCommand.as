package edu.isi.bmkeg.ooevv.editor.controller
{	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;
	
	import edu.isi.bmkeg.ooevv.editor.model.*;
	import edu.isi.bmkeg.ooevv.services.*;
	import edu.isi.bmkeg.ooevv.events.*;

	import edu.isi.bmkeg.utils.updownload.UploadCompleteEvent;
	
	import flash.events.Event;
	
	public class UploadOoevvFileCommand extends ModuleCommand
	{
		
		[Inject]
		public var event:UploadCompleteEvent;
		
		[Inject]
		public var service:IExtendedOoevvService;
		
		override public function execute():void {
			service.uploadExcelFile(event.data, false);
		}
		
	}
	
}