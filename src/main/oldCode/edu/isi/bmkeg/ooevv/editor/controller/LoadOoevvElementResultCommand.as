package edu.isi.bmkeg.ooevv.editor.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.ooevv.editor.model.*;
	import edu.isi.bmkeg.ooevv.events.*;
	
	import flash.events.Event;
	
	public class LoadOoevvElementResultCommand extends Command
	{
		
		[Inject]
		public var event:LoadOoevvElementResultEvent;
		
		[Inject]
		public var ooevvEditorModel:OoevvEditorModel;
		
		override public function execute():void
		{
			ooevvEditorModel.el = event.result;
		}
		
	}
	
}