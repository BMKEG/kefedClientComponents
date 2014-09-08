package edu.isi.bmkeg.kefed.designer.controller.translateDiagram
{	
	
	import edu.isi.bmkeg.kefed.designer.controller.UpdateKefedModelCommand;
	import edu.isi.bmkeg.kefed.designer.model.*;
	import edu.isi.bmkeg.kefed.diagram.controller.events.*;
	import edu.isi.bmkeg.kefed.diagram.model.KefedDiagramModel;
	import edu.isi.bmkeg.kefed.model.flare.FlareEdge;
	import edu.isi.bmkeg.kefed.events.elementLevel.InsertKefedEdgeEvent;
	import edu.isi.bmkeg.kefed.rl.events.UpdateKefedModelEvent;
	import edu.isi.bmkeg.kefed.model.design.KefedModelEdge;
	import edu.isi.bmkeg.kefed.model.design.KefedModelElement;
	
	import flash.events.ErrorEvent;
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	
	public class UpdateKapitXmlCommand extends Command
	{
	
		[Inject]
		public var event:UpdateKapitXmlEvent;

		[Inject]
		public var model:KefedDesignerModel;
						
		override public function execute():void
		{
			var xml:XML = event.xml;
			var updateTime:Date = event.updateTime;
			
			if( updateTime > model.lastXmlUpdateTime ) {
				trace("Updating XML at " + updateTime.toLocaleTimeString()); 
				model.lastXmlUpdateTime = updateTime;
				model.kefedModel.date = updateTime.toUTCString();
				model.kefedModel.diagramXML = xml.toXMLString();
			} else {
				trace("Skipping XML Update at " + updateTime.toLocaleTimeString()); 
			}
			
			dispatch(new UpdateKefedModelEvent(model.kefedModel));
			
		}
		
	}
	
}