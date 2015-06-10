package edu.isi.bmkeg.kefed.diagram.model
{
	
	import edu.isi.bmkeg.kefed.model.flare.FlareEdge;
	import edu.isi.bmkeg.kefed.model.flare.FlareGraph;
	import edu.isi.bmkeg.kefed.model.flare.FlareNode;
	import edu.isi.bmkeg.kefed.diagram.controller.events.*;
	import edu.isi.bmkeg.kefed.model.design.*;
	
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	import mx.utils.UIDUtil;
	
	import org.robotlegs.mvcs.Actor;

	[Bindable]
	public class KefedDiagramModel extends Actor
	{
		
		public var exptId:String;
		public var notes:String;
		public var version:int;
		
		public var flareGraph:FlareGraph;
		public var xml:XML;

		public var selectedFlareNode:FlareNode;
		public var selectedFlareEdge:FlareEdge;
		
		public var zoomFactor:Number = 1;
		public var svg:XML;
		
		public var shutDownGraph:Boolean = false;	
		
		public var saveAllowed:Boolean = true;
		
		public function KefedDiagramModel()
		{
			this.flareGraph = new FlareGraph();
		}	
		
		public function selectNode(uid:String):void {
			for(var i:int=0;i<flareGraph.bNodes.length;i++) {
				if (flareGraph.bNodes.getItemAt(i).uid == uid) {
					selectedFlareNode = FlareNode(flareGraph.bNodes.getItemAt(i));
					return;	
				}
			}
			selectedFlareNode = null;
		}
				
		public function createFlareEdge(sourceUid:String, targetUid:String, linkUid:String):String
		{
			
			var source:FlareNode = this.flareGraph.getFlareNodeFromUID(sourceUid);
			var target:FlareNode = this.flareGraph.getFlareNodeFromUID(targetUid);
			
			var link:FlareEdge = new FlareEdge(linkUid, source, target, true);
			
			if (this.flareGraph) {
				source.addOutEdge(link);
				target.addInEdge(link);
				this.flareGraph.addEdge(link);
			}
			
			return linkUid;
			
		}
		
		public function removeFlareEdge(uid:String):void
		{
			var edge:FlareEdge = this.flareGraph.getFlareEdgeFromUID(uid);
			this.flareGraph.removeEdge(edge);
		}
		
		public function addFlareNode(fn:FlareNode):String
		{
			
			this.flareGraph.addNode(fn);
			
			return fn.uid;
			
		}
		
		public function removeFlareNode(uid:String):String
		{
			
			for(var i:int=0; i < this.flareGraph.nodes.length; i++) {
				var obj:FlareNode = this.flareGraph.nodes[i];
				if (obj.uid == uid) {
					this.flareGraph.remove(obj);
					return uid;
				}
			}
			
			return null;
			
		}
		
		public function renameFlareNode(uid:String, name:String):String 
		{
			for(var i:int=0; i < this.flareGraph.nodes.length; i++) {
				var obj:FlareNode = this.flareGraph.nodes[i];
				if (obj.uid == uid) {
					obj.nameValue = name;
					return uid;
				}
			}
			
			return null;
					
		}
		
		public function changeZoom(zoomFactor:Number):void {
			this.zoomFactor = zoomFactor;
		}

		public function loadFlareGraph(g:FlareGraph, xml:XML):void {
			//this.kefedModel = kefedModel;
		}
		
			
	}

}