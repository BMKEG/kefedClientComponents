package edu.isi.bmkeg.kefed.designer.controller.translateDiagram
{	
	import edu.isi.bmkeg.kefed.designer.model.*;
	import edu.isi.bmkeg.kefed.diagram.controller.events.RemoveFlareNodeEvent;
	import edu.isi.bmkeg.kefed.diagram.model.KefedDiagramModel;
	import edu.isi.bmkeg.kefed.model.flare.FlareEdge;
	import edu.isi.bmkeg.kefed.events.elementLevel.DeleteKefedElementsEvent;
	import edu.isi.bmkeg.kefed.model.design.KefedModelEdge;
	import edu.isi.bmkeg.kefed.model.design.KefedModelElement;
	
	import flash.events.ErrorEvent;
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	
	public class TranslateRemoveFlareNodeCommand extends Command
	{
	
		[Inject]
		public var event:RemoveFlareNodeEvent;

		[Inject]
		public var moduleDispatcher:IModuleEventDispatcher;
				
		override public function execute():void
		{

/*			var uid:String = this.event.uids;
			var xml:XML = this.event.xml;
			
			var event:DeleteKefedElementsEvent = new DeleteKefedElementsEvent(uid, xml);
			
			dispatch(event);*/
	
		}
		
	}
	
}