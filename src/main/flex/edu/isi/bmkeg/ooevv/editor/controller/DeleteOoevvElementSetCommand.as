package edu.isi.bmkeg.ooevv.editor.controller
{	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;
	
	import edu.isi.bmkeg.ooevv.editor.model.OoevvEditorModel;
	import edu.isi.bmkeg.ooevv.services.*;
	import edu.isi.bmkeg.ooevv.events.*;

	import edu.isi.bmkeg.utils.updownload.UploadCompleteEvent;
	
	import flash.events.Event;
	
	public class DeleteOoevvElementSetCommand extends ModuleCommand
	{
		
		[Inject]
		public var event:DeleteOoevvElementSetEvent;
		
		[Inject]
		public var model:OoevvEditorModel;
		
		[Inject]
		public var service:IExtendedOoevvService;
		
		override public function execute():void {	

			service.deleteOoevvElementSet(event.vpdmfId);
		
		}
		
	}
	
}