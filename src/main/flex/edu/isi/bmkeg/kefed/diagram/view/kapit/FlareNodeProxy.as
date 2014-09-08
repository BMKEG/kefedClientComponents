// $Id: KefedObjectProxy.as 1180 2010-09-22 17:19:40Z tom $
//
//  $Date: 2010-09-22 10:19:40 -0700 (Wed, 22 Sep 2010) $
//  $Revision: 1180 $
//
package edu.isi.bmkeg.kefed.diagram.view.kapit
{
	import com.kapit.diagram.IDiagramElement;
	import com.kapit.diagram.layers.DiagramColumn;
	import com.kapit.diagram.layers.DiagramLane;
	import com.kapit.diagram.model.ISpriteProxy;
	import com.kapit.diagram.view.DiagramSprite;
	import com.kapit.diagram.view.DiagramView;
	
	import edu.isi.bmkeg.kefed.diagram.controller.events.*;
	import edu.isi.bmkeg.kefed.model.flare.FlareGraph;
	import edu.isi.bmkeg.kefed.model.flare.FlareNode;
	import edu.isi.bmkeg.kefed.diagram.view.KefedDiagramModule;
	
	import mx.utils.StringUtil;
	import mx.utils.UIDUtil;

	public class FlareNodeProxy implements ISpriteProxy
	{
			
		public static var _graph:FlareGraph = null;
		
		public static var _kefedDiagramView:KefedDiagramModule = null;
		
		protected var _view:DiagramView;
		
		public function FlareNodeProxy(view:DiagramView)
		{
			_view = view;
		}
	
		protected function getElementSpriteId(el:IDiagramElement):String
		{	
			if (el is DiagramSprite) {
				var s:DiagramSprite = el as DiagramSprite;
				return s.spriteid;
			}
			return null;
		}		
		
		public function createDataObject(el:IDiagramElement):String
		{
			var type:String = el.getTagName();
			var sprite:DiagramSprite = DiagramSprite(el);
			var spriteid:String = sprite.spriteid;
			var name:String = el.did;
			var uid:String = el.did;
			var obj:FlareNode = new FlareNode();
			obj.type = type;
			obj.spriteid = spriteid;
			obj.did = el.did;
			
			obj.xx = sprite.innerleft;
			obj.yy = sprite.innertop;
			obj.ww = sprite.innerwidth;
			obj.hh = sprite.innerheight;
			
			obj.uid = uid;
			obj.nameValue = "";
			obj.compositions = 0;
			obj.master = "";
			
			var xml:XML = _view.toXML();

			_kefedDiagramView.dispatchEvent( new AddFlareNodeEvent(obj, xml) );
			
			return uid;

		}
		
		public function removeDataObject(el:IDiagramElement):void
		{
			var uid:String = el.did;
			var xml:XML = _view.toXML();

			_kefedDiagramView.dispatchEvent( new RemoveFlareNodeEvent(uid, xml) );
		}
		
		public function allowLinkAction(el:IDiagramElement):Boolean
		{
			return true;
		}
		
		public function propertyModified(el:IDiagramElement, propname:String, propvalue:Object, shapeid:String):void
		{
			var s:DiagramSprite = null;
			if (el is DiagramSprite)
				s = el as DiagramSprite;

			if ("text" == propname)  {
						
				// Disable system's ability to rename nodes.
				/*_kefedDiagramView.dispatchEvent(
					new RenameFlareNodeEvent(
						el.dataobjectid, StringUtil.trim(propvalue.toString())
					));*/
				
			}
			if ("compositionmasterleave" == propname) {
				if (s && "rectangle-composed" == shapeid) {	
					s.spriteid = "rectangle";	
					s.dragenabled = true;
					s.selectable = true;
				}
			}			
			if ("compositionmaster" == propname) {
				if (s && "rectangle" == shapeid) {
					s.spriteid = "rectangle-composed";	
					s.dragenabled = true;
					s.selectable = true;		
				}
			}
			if ("compositionelement" == propname) {
			
			}			 
			if ("compositionelementremove" == propname) {

			}
		}
		
		public function preAcceptLinkSource(spriteid:String, sourcespriteid:String, el:IDiagramElement):Boolean
		{
			return spriteid.indexOf("-composed") == -1
			    && sourcespriteid.indexOf("-composed") == -1
			    && spriteid != DiagramMappings.COMMENT_SPRITE_ID
			    && sourcespriteid != DiagramMappings.COMMENT_SPRITE_ID;
		}
		
		public function preAcceptLinkTarget(spriteid:String, targetspriteid:String, el:IDiagramElement):Boolean
		{
		    return spriteid.indexOf("-composed") == -1
			    && targetspriteid.indexOf("-composed") == -1
			    && spriteid != DiagramMappings.COMMENT_SPRITE_ID
			    && targetspriteid != DiagramMappings.COMMENT_SPRITE_ID
				&& targetspriteid != DiagramMappings.PARAMETER_SPRITE_ID
				&& targetspriteid != DiagramMappings.CONSTANT_SPRITE_ID
				&& targetspriteid != DiagramMappings.ACTIVITY_SPRITE_ID
				&& targetspriteid != DiagramMappings.ENTITY_SPRITE_ID
				&& targetspriteid != DiagramMappings.MEASUREMENT_SPRITE_ID;
		}
		
		public function dataObjectPropertyModified(uid:String, propname:String, propvalue:Object):void
		{
		}
		
		public function acceptLinkTarget(el:IDiagramElement, target:IDiagramElement):Boolean
		{
			return getElementSpriteId(el) != DiagramMappings.COMMENT_SPRITE_ID 
					&& getElementSpriteId(target) != DiagramMappings.COMMENT_SPRITE_ID;
		}
		
		public function dataObjectRemoved(uid:String):void
		{
		
		}
		
		public function dataObjectLoaded(el:IDiagramElement):void
		{
		}
				
		public function acceptLinkSource(el:IDiagramElement, source:IDiagramElement):Boolean
		{
			return getElementSpriteId(el) != DiagramMappings.COMMENT_SPRITE_ID
					 && getElementSpriteId(source) != DiagramMappings.COMMENT_SPRITE_ID;
		}
		
		public function laneChanged(el:IDiagramElement, lane:DiagramLane):void
		{
		}

		public function columnChanged(el:IDiagramElement, column:DiagramColumn):void
		{
		}
				
		public function acceptPropertyModification(el:IDiagramElement,propname:String,propvalue:Object,shapeid:String):Boolean
		{
			if ("text" == propname)	{
				return false;				
			}
			if ("compositionmasterleave" == propname) {
				return true;
			}			
			if ("compositionmaster" == propname) {
				return ((el as DiagramSprite).masterobject == null
					 || (el as DiagramSprite).masterobject == propvalue);
			}
			if ("compositionelement" == propname) {
				return true;		
			}			 
			if ("compositionelementremove" == propname)	{
				return true;
			}			
			return true;
		}
		
		public function acceptRemoveObject(el:IDiagramElement):Boolean
		{
			var s:DiagramSprite = el as DiagramSprite;		
			
			if (s && s.masterobject)
				return false;	
			return true;

		}
		
	}
}