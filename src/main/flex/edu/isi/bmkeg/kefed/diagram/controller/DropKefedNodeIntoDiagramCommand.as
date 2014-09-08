package edu.isi.bmkeg.kefed.diagram.controller
{	
	import edu.isi.bmkeg.kefed.diagram.controller.events.DropKefedNodeIntoDiagramEvent;
	import edu.isi.bmkeg.kefed.events.modelLevel.LoadFlareGraphEvent;
	import edu.isi.bmkeg.kefed.diagram.model.KefedDiagramModel;
	import edu.isi.bmkeg.kefed.model.flare.FlareGraph;
	import edu.isi.bmkeg.kefed.model.flare.FlareNode;
	import edu.isi.bmkeg.kefed.diagram.view.KefedDiagramModule;

	import edu.isi.bmkeg.kefed.events.elementLevel.InsertKefedElementEvent;

	import edu.isi.bmkeg.kefed.model.design.*;
	
	import flash.events.Event;
	
	import mx.utils.UIDUtil;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;
	
	public class DropKefedNodeIntoDiagramCommand extends ModuleCommand
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
			var id:String = event.k.uuid;
			var dataid:String = UIDUtil.createUID(); // uuid
			var dx:String = "NaN";
			var dy:String = "NaN";
			var x:Number = event.k.x;
			var y:Number = event.k.y;
			var w:Number = event.k.w;
			var h:Number = event.k.h;
			var spriteid:String = "";

			var xLabel:Number = - (w/2.0);
			var yLabel:Number = (h/2.0);
			
			var label:String = event.k.defn.termValue;
			
			var nLines:int = Math.ceil(label.length / 12);
			
			if( event.k is ConstantInstance ) {
				
				spriteid = "Constant";
				w = 25;
				h = 28;

				xLabel = -120;
				yLabel = 0;

				
			} else if( event.k is ParameterInstance ) {

				spriteid = "Parameter";
				w = 25;
				h = 76;

				xLabel = -120;
				yLabel = 0;

			} else if( event.k is MeasurementInstance ) {
			
				spriteid = "Measurement";
				w = 64;
				h = 64;	

				xLabel = (w/2.0) - 60;
				yLabel = h;

			} else if( event.k is EntityInstance) {
				
				spriteid = "Entity";
				
				if( nLines > 2 ) {
					h = 63 * (nLines+1)/3;
					w = 140 * (nLines+1)/3;
				} else {			
					w = 140;
					h = 63;
				}

				xLabel = (w/2.0) - 60;
				yLabel = (h/2.0) - (10*nLines);
				
			} else if( event.k is ProcessInstance) {

				spriteid = "Process";
				if( nLines > 2 ) {
					h = 63 * (nLines+1)/3;
					w = 140 * (nLines+1)/3;
				} else {			
					w = 140;
					h = 63;
				}

				xLabel = (w/2.0) - 60;
				yLabel = (h/2.0) - (10*nLines);

			}
			
			var box:String = x + "," + y + "," + w + "," + h;

			var anchorid:String = UIDUtil.createUID();
			var targetid:String = UIDUtil.createUID();
			
			var newXML:XML = <sprite id={id} dataid={dataid} dx="NaN" dy="NaN" box={box} spriteid={spriteid}>
					<anchor id={anchorid} dx="0" dy="0" target={targetid}/>
					</sprite>;
			
			sprites.appendChild( newXML );

			var annotations:XML = xml.panels.panel.lane.annotations[0];

			box = (x + xLabel) + "," + (y + yLabel) + "," + 120 + "," + (20 * nLines);
			
			var newAnnot:XML = <annotation id={targetid} master={anchorid} dx={xLabel} dy={yLabel} box={box} spriteid="annotation"/>;
			newAnnot.appendChild(new XML("<![CDATA[" + label + "]]>"));			
			annotations.appendChild(newAnnot);
			
			var node:FlareNode = new FlareNode();
			node.did = id;
			node.uid = id;
			node.nameValue = event.k.defn.termValue;
			node.spriteid = spriteid;
			
			var g:FlareGraph = kefedDiagramModel.flareGraph;
			g.addNode(node);
			
			dispatch(new LoadFlareGraphEvent(g, xml) );
			
			dispatchToModules( new InsertKefedElementEvent(event.k, xml) );
			
		}
		
	}
	
}