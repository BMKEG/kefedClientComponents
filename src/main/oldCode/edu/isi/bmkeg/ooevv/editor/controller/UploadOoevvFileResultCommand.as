package edu.isi.bmkeg.ooevv.editor.controller
{	
	import edu.isi.bmkeg.ooevv.editor.model.OoevvEditorModel;
	import edu.isi.bmkeg.ooevv.events.*;
	import edu.isi.bmkeg.ooevv.rl.events.FindOoevvElementSetByIdEvent;
	import edu.isi.bmkeg.ooevv.services.*;
	import edu.isi.bmkeg.utils.updownload.UploadCompleteEvent;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;
	
	public class UploadOoevvFileResultCommand extends ModuleCommand
	{
		
		[Inject]
		public var event:UploadExcelFileResultEvent;
				
		override public function execute():void {
			
			var refreshEvent:FindOoevvElementSetByIdEvent = 
				new FindOoevvElementSetByIdEvent(event.oesVpdmfId);

			this.dispatch(refreshEvent);
		
		}
		
	}
	
}