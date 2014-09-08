package edu.isi.bmkeg.kefed.designer.controller.translateDiagram
{	
	import edu.isi.bmkeg.kefed.model.design.*;
	
	import edu.isi.bmkeg.kefed.events.elementLevel.InsertKefedElementEvent;

	import edu.isi.bmkeg.kefed.diagram.controller.events.AddFlareNodeEvent;
	import edu.isi.bmkeg.kefed.model.flare.FlareNode;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	
	public class TranslateAddNewKefedElementCommand extends Command
	{
	
		[Inject]
		public var event:InsertKefedElementEvent;
				

		override public function execute():void
		{
			dispatch(event);
		}
		
	}
	
}