package edu.isi.bmkeg.ooevv.editor.controller
{	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;
	
	import edu.isi.bmkeg.ooevv.editor.model.*;
	import edu.isi.bmkeg.ooevv.editor.service.*;
	import edu.isi.bmkeg.ooevv.events.*;
	
	import flash.events.Event;
	
	public class LoadOoevvElementSetResultCommand extends ModuleCommand
	{
		
		[Inject]
		public var event:LoadOoevvElementSetResultEvent;
		
		[Inject]
		public var ooevvEditorModel:OoevvEditorModel;
		
		override public function execute():void
		{
			ooevvEditorModel.ooevvElementSet = event.result;
		}
		
	}
	
}