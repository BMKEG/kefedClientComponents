package edu.isi.bmkeg.ooevv.editor.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.ooevv.editor.model.*;
	import edu.isi.bmkeg.ooevv.events.*;
	import edu.isi.bmkeg.ooevv.model.qo.*;
	import edu.isi.bmkeg.ooevv.rl.events.*;
	import edu.isi.bmkeg.ooevv.rl.services.*;

	import edu.isi.bmkeg.pagedList.model.*;
	
	import flash.events.Event;
	
	public class SelectOoevvElementSetCommand extends Command
	{
	
		[Inject]
		public var event:SelectOoevvElementSetEvent;

		[Inject]
		public var model:OoevvElementPagedListModel;
				
		[Inject]
		public var service:IOoevvService;
		
		override public function execute():void
		{
			model.clear();
			
			var oe:OoevvElement_qo = new OoevvElement_qo();
			var oes:OoevvElementSet_qo = new OoevvElementSet_qo();
			oe.sets.addItem(oes);
			
			if( !isNaN(event.uid) ) { 
				oes.vpdmfId = event.uid + "";
			}
			
			if( event.oeTypeCode == 1 ) {
				oe.elementType = "OoevvProcess<vpdmf-or>OoevvEntity";				
			} else if( event.oeTypeCode == 2 ) {
				oe.elementType = "ExperimentalVariable";
			}

			dispatch( new FindOoevvElementSetByIdEvent(event.uid) );
			dispatch( new ListOoevvElementPagedEvent(oe, 0, 200) );
			
		}
		
	}
	
}