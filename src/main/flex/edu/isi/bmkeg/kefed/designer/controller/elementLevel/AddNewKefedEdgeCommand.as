package edu.isi.bmkeg.kefed.designer.controller.elementLevel
{	
	import edu.isi.bmkeg.kefed.model.design.*;
	import edu.isi.bmkeg.kefed.designer.events.elementLevel.AddNewKefedEdgeEvent;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
	
	import flash.events.ErrorEvent;
	import flash.events.Event;
	
	import flashx.textLayout.tlf_internal;
	
	import org.robotlegs.mvcs.Command;
	
	public class AddNewKefedEdgeCommand extends Command
	{
	
		[Inject]
		public var event:AddNewKefedEdgeEvent;
				
		[Inject]
		public var model:KefedDesignerModel;

		override public function execute():void
		{
			trace("Adding KefedModelEdge"); 
			var sourceUid:String = event.sourceUid;
			var targetUid:String = event.targetUid;
			var linkUid:String = event.edgeUid;
			
			var s:KefedModelElement = null;
			var t:KefedModelElement = null;
			for( var i:int=0; i<model.kefedModel.elements.length; i++) {
				var n:KefedModelElement = KefedModelElement(
						model.kefedModel.elements.getItemAt(i)
						);
				
				if( n.uuid == sourceUid ) {
					s = n;
				} else if( n.uuid == targetUid ) {
					t = n;
				}			
				
			}
			
			var errString:String = "";
			if( s == null ) 
				errString += "Can't find source node " + sourceUid + ". "; 
			
			if( t == null ) 
				errString += "Can't find target node " + targetUid + ".";
			
			if( errString.length > 0 ) {

				dispatch( new ErrorEvent(errString) );
			
			} else {
				
				var e:KefedModelEdge = new KefedModelEdge();
				e.uuid = linkUid;
				e.source = s;
				e.target = t;
					
				model.kefedModel.edges.addItem(e);
				e.model = model.kefedModel;
				
			}
			
			
		}
		
	}
	
}