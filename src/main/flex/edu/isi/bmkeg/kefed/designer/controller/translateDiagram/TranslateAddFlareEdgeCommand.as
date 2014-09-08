package edu.isi.bmkeg.kefed.designer.controller.translateDiagram
{	
	
	import edu.isi.bmkeg.kefed.model.design.KefedModelEdge;
	import edu.isi.bmkeg.kefed.model.design.KefedModelElement;
	import edu.isi.bmkeg.kefed.events.elementLevel.InsertKefedEdgeEvent;
	import edu.isi.bmkeg.kefed.diagram.controller.events.AddFlareEdgeEvent;
	import edu.isi.bmkeg.kefed.diagram.model.KefedDiagramModel;
	import edu.isi.bmkeg.kefed.model.flare.FlareEdge;
	
	import flash.events.ErrorEvent;
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Command;	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	
	public class TranslateAddFlareEdgeCommand extends Command
	{
	
		[Inject]
		public var event:AddFlareEdgeEvent;
				
		[Inject]
		public var moduleDispatcher:IModuleEventDispatcher;
		
		override public function execute():void
		{
			trace("translating FlareEdge -> KefedModelEdge"); 
			var source:String = this.event.sourceUid;
			var target:String = this.event.targetUid;
			var edge:String = this.event.linkUid;
			var xml:XML = this.event.xml;

			var event:InsertKefedEdgeEvent = new InsertKefedEdgeEvent(source, target, edge, xml);
			
			dispatch(event);
					
		}
		
		
		
	}
	
}