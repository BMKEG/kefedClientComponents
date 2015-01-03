package edu.isi.bmkeg.kefed.designer.controller.translateDiagram
{	
	
	import edu.isi.bmkeg.kefed.designer.model.*;
	import edu.isi.bmkeg.kefed.diagram.controller.events.SelectFlareNodesInDiagramEvent;
	import edu.isi.bmkeg.kefed.diagram.model.KefedDiagramModel;
	import edu.isi.bmkeg.kefed.events.elementLevel.*;
	import edu.isi.bmkeg.kefed.model.design.KefedModelEdge;
	import edu.isi.bmkeg.kefed.model.design.KefedModelElement;
	import edu.isi.bmkeg.kefed.model.flare.FlareEdge;
	
	import flash.events.ErrorEvent;
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.utils.UIDUtil;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	
	public class SelectFlareNodeCommand extends Command
	{
	
		[Inject]
		public var event:SelectFlareNodesInDiagramEvent;

		[Inject]
		public var moduleDispatcher:IModuleEventDispatcher;

		[Inject]
		public var model:KefedDesignerModel;

		
		override public function execute():void
		{
			
			var els:ArrayCollection = this.event.nodes;

			var lookup:Object = new Object();
			for each (var uid:String in event.nodes) {
				lookup[uid] = true;
			}

			if( model.startElement != null ) {
				
				if( els.length != 1 ) 
					return;
				
				var selection:KefedModelElement = null;
				for each (var el:KefedModelElement in model.kefedModel.elements) {
					if( lookup[el.uuid] != null ) {
						selection = el;
						break;
					}
				}
				
				var ev2:InsertKefedEdgeEvent = new InsertKefedEdgeEvent(
					model.startElement.uuid, 
					selection.uuid, 
					UIDUtil.createUID(), 
					<xml/>
				);
				
				this.dispatch(ev2);
				
				model.startElement = null;
				
			} else {
				
				model.kefedElements = new ArrayCollection();
				for each (var el2:KefedModelElement in model.kefedModel.elements) {
					if( lookup[el2.uuid] != null ) {
						model.kefedElements.addItem(el2);
					}
				}
				
				if( model.kefedElements.length == 1 ) {
					var ev3:SelectKefedElementEvent = new SelectKefedElementEvent( 
						model.kefedElements[0].uuid);
					dispatch(ev3);
				}
				
			}

		}
		
	}
	
}