package edu.isi.bmkeg.kefed.diagram.controller
{	
	import edu.isi.bmkeg.kefed.model.design.*;
	import edu.isi.bmkeg.kefed.diagram.controller.events.DropKefedNodeIntoDiagramEvent;
	import edu.isi.bmkeg.kefed.diagram.controller.events.LoadFlareGraphEvent;
	import edu.isi.bmkeg.kefed.diagram.model.KefedDiagramModel;
	import edu.isi.bmkeg.kefed.diagram.model.vo.FlareGraph;
	import edu.isi.bmkeg.kefed.diagram.model.vo.FlareNode;
	import edu.isi.bmkeg.kefed.diagram.view.KefedDiagramModule;
	
	import flash.events.Event;
	
	import mx.utils.UIDUtil;
	
	import org.robotlegs.mvcs.Command;
	
	public class DropKefedNodeIntoDiagramCommand extends Command
	{
		
		[Inject]
		public var event:DropKefedNodeIntoDiagramEvent;
		
		[Inject]
		public var kefedDiagramModel:KefedDiagramModel;
		
		[Inject]
		public var view:KefedDiagramModule;

		override public function execute():void
		{
			
			var xml:XML = event.xml;
			var sprites:XML = xml.panels.panel.lane.sprites[0];
			
			//	id="2CFDD60E-6FBE-95CC-4262-A0ACB71D7077" 
			// dataid="86134C5F-74F5-8654-8D65-A0ACB73EFB05" 
			var id:String = UIDUtil.createUID(); 
			var dataid:String = event.k.uuid; // uuid
			var dx:String = "NaN";
			var dy:String = "NaN";
			var w:Number = event.k.w;
			var h:Number = event.k.h;
			var spriteid:String = "";
			
			if( event.k is ConstantInstance ) {
				
				spriteid = "Constant";
				w = 25;
				h = 28;
			
			} else if( event.k is ParameterInstance ) {

				spriteid = "Parameter";
				w = 25;
				h = 76;
				
			} else if( event.k is MeasurementInstance ) {
			
				spriteid = "Measurement";
				w = 64;
				h = 64;	
				
			} else if( event.k is EntityInstance) {
				
				spriteid = "Entity";
				w = 120;
				h = 63;
				
			} else if( event.k is ProcessInstance) {

				spriteid = "Process";
				w = 120;
				h = 63;
				
			}
			
			var box:String = event.k.x + "," + event.k.y + 
					"," + w + "," + h;

			var anchorid:String = UIDUtil.createUID();
			var targetid:String = UIDUtil.createUID();
			
			var newXML:XML = <sprite id={id} dataid={dataid} dx="NaN" dy="NaN" box={box} spriteid={spriteid}>
					<anchor id={anchorid} dx="0" dy="0" target={targetid}/>
					</sprite>;
			
			sprites.appendChild( newXML );
			
			var annotations:XML = xml.panels.panel.lane.annotations[0];
			var dxVal:Number = - (w/2.0);
			var dyVal:Number = (h/2.0);
			box = event.k.x + "," + event.k.y + 
				"," + 120 + "," + 30;
			
			var newAnnot:XML = <annotation id={targetid} master={anchorid} dx={dxVal} dy={dyVal} box={box} spriteid="annotation"/>;
			newAnnot.appendChild(new XML("<![CDATA[" + event.k.defn.termValue + "]]>"));			
			annotations.appendChild(newAnnot);
			
			var node:FlareNode = new FlareNode();
			node.did = id;
			node.uid = dataid;
			node.nameValue = event.k.defn.termValue;
			node.spriteid = spriteid;
			
			var g:FlareGraph = kefedDiagramModel.flareGraph;
			g.addNode(node);
			
			dispatch(new LoadFlareGraphEvent(g, xml) );
			
		}
		
	}
	
}