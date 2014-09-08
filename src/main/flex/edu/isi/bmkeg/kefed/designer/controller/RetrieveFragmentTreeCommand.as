package edu.isi.bmkeg.kefed.designer.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.digitalLibrary.events.*;
	import edu.isi.bmkeg.digitalLibrary.services.IExtendedDigitalLibraryService;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel
	
	import flash.events.Event;
	
	public class RetrieveFragmentTreeCommand extends Command
	{
	
		[Inject]
		public var event:RetrieveFragmentTreeEvent;

		[Inject]
		public var srv:IExtendedDigitalLibraryService;
				
		override public function execute():void
		{
			srv.retrieveFragmentTree();
		}
		
	}
	
}