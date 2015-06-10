package edu.isi.bmkeg.kefed.designer.controller.elementLevel
{	
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
	import edu.isi.bmkeg.kefed.events.elementLevel.InsertKefedEdgeEvent;
	import edu.isi.bmkeg.kefed.services.extKefed.IExtendedKefedService;
	import edu.isi.bmkeg.kefed.model.design.*;
	
	import flash.events.ErrorEvent;
	import flash.events.Event;
	
	import flashx.textLayout.tlf_internal;
	
	import org.robotlegs.mvcs.Command;
	
	public class InsertKefedEdgeCommand extends Command
	{
	
		[Inject]
		public var event:InsertKefedEdgeEvent;
				
		[Inject]
		public var model:KefedDesignerModel;

		[Inject]
		public var service:IExtendedKefedService;
		
		override public function execute():void
		{
			trace("Adding KefedModelEdge"); 
			var sourceUid:String = event.sourceUid;
			var targetUid:String = event.targetUid;
			var linkUid:String = event.edgeUid;
			
			var s:KefedModelElement = new KefedModelElement();
			s.uuid = sourceUid;
	
			var t:KefedModelElement = new KefedModelElement();
			t.uuid = targetUid;
			
			var e:KefedModelEdge = new KefedModelEdge();
			e.edgeType = "-";
			e.uuid = linkUid;
			e.source = s;
			e.target = t;
					
			e.model = model.kefedModel;
			e.model.diagramXML = event.xml;
			
			service.insertKefedEdge(e, event.xml); 
			
		}
		
	}
	
}