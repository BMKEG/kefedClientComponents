package edu.isi.bmkeg.cosi.questionTree.controller
{	
	import edu.isi.bmkeg.cosi.questionTree.model.*;
	import edu.isi.bmkeg.cosi.model.*
	import edu.isi.bmkeg.cosi.rl.events.*;
	import edu.isi.bmkeg.cosi.rl.services.ICosiService;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Command;
	
	public class RetrieveInvestigationPagedCommand extends Command
	{
	
		[Inject]
		public var event:RetrieveInvestigationPagedEvent;

		[Inject]
		public var cosiService:ICosiService;
				
		override public function execute():void
		{
			var object:Investigation = Investigation(event.object);
			var offset:int = event.offset;
			var cnt:int = event.cnt;
				
			cosiService.retrieveInvestigationPaged(object, offset, cnt);
			
		}
		
	}
	
}