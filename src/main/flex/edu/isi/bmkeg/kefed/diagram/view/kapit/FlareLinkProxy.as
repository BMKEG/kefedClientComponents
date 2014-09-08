// $Id: KefedLinkProxy.as 1180 2010-09-22 17:19:40Z tom $
//
//  $Date: 2010-09-22 10:19:40 -0700 (Wed, 22 Sep 2010) $
//  $Revision: 1180 $
//
package edu.isi.bmkeg.kefed.diagram.view.kapit
{
	import com.kapit.diagram.IDiagramElement;
	import com.kapit.diagram.model.ILinkProxy;
	import com.kapit.diagram.view.DiagramLink;
	import com.kapit.diagram.view.DiagramView;
	
	import edu.isi.bmkeg.kefed.diagram.controller.events.*;
	import edu.isi.bmkeg.kefed.diagram.view.KefedDiagramModule;
	
	import mx.utils.UIDUtil;

	public class FlareLinkProxy implements ILinkProxy
	{
		public static var _kefedDiagramView:KefedDiagramModule = null;
				
		protected var _view:DiagramView;

		public function FlareLinkProxy(view:DiagramView)
		{
			_view = view;
		}		

		public function createDataObject(el:IDiagramElement):String
		{
						
			var type:String = el.getTagName();
			
			var l:DiagramLink = DiagramLink(el);
			var sourceid:String = DiagramLink(el).sourceobject.did;
			var targetid:String = DiagramLink(el).targetobject.did;
			var uid:String = el.did;
			var xml:XML = _view.toXML();
						
			_kefedDiagramView.dispatchEvent( new AddFlareEdgeEvent(sourceid, targetid, uid, xml) );
			
			return uid;
		}
		
		public function scopeChanged(link:DiagramLink, oldscope:String):void
		{
		}
		
		public function removeDataObject(el:IDiagramElement):void
		{
			var xml:XML = _view.toXML();
			_kefedDiagramView.dispatchEvent( new RemoveFlareEdgeEvent(el.did, xml) );
		}
		
		public function propertyModified(el:IDiagramElement, propname:String, propvalue:Object, shapeid:String):void
		{
		}
		
		public function dataObjectPropertyModified(uid:String, propname:String, propvalue:Object):void
		{
		}
		
		public function dataObjectRemoved(uid:String):void
		{
		}
		
		public function dataObjectLoaded(el:IDiagramElement):void
		{
		}
		
		public function acceptPropertyModification(el:IDiagramElement,propname:String,propvalue:Object,shapeid:String):Boolean
		{
			return true;
		}

		public function acceptRemoveObject(el:IDiagramElement):Boolean
		{
			//var xml:XML = _view.toXML();
			//_kefedDiagramView.dispatchEvent( new RemoveFlareEdgeEvent(el.did, xml) );
			return true;
		}
				
	}
}