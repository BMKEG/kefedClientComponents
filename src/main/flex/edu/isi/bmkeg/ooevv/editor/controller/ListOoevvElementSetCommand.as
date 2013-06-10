package edu.isi.bmkeg.ooevv.editor.controller
{	
	import edu.isi.bmkeg.ooevv.editor.model.*;
	import edu.isi.bmkeg.ooevv.rl.events.*;
	import edu.isi.bmkeg.ooevv.model.*;
	import edu.isi.bmkeg.ooevv.model.qo.*;
	import edu.isi.bmkeg.ooevv.rl.services.IOoevvService;
	
	import edu.isi.bmkeg.pagedList.model.*;

	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class ListOoevvElementSetCommand extends Command
	{
	
		[Inject]
		public var event:ListOoevvElementSetEvent;

		[Inject]
		public var model:PagedListModel;
		
		[Inject]
		public var ooevvService:IOoevvService;
		
		override public function execute():void
		{
			var oes:OoevvElementSet_qo = event.object;
			ooevvService.listOoevvElementSet( oes );	
		}
		
	}
	
}