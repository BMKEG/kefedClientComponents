package edu.isi.bmkeg.ooevv.editor.controller
{	
	import edu.isi.bmkeg.ooevv.editor.model.*;
	import edu.isi.bmkeg.ooevv.model.*;
	import edu.isi.bmkeg.ooevv.rl.events.*;
	import edu.isi.bmkeg.ooevv.rl.services.IOoevvService;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class ListOoevvElementSetResultCommand extends Command
	{
	
		[Inject]
		public var event:ListOoevvElementSetResultEvent;

		[Inject]
		public var model:OoevvEditorModel;

		[Inject]
		public var ooevvService:IOoevvService;
				
		override public function execute():void
		{
			var emptyLvi:LightViewInstance = new LightViewInstance();
			event.list.addItemAt(emptyLvi, 0);
			
			model.oesList = event.list;
		}
		
	}
	
}