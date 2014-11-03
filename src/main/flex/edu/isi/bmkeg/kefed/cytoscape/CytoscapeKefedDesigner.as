package edu.isi.bmkeg.kefed.cytoscape
{
	import org.cytoscapeweb.CytoscapeWeb;
	
	import mx.events.DragEvent;
	import mx.resources.ResourceBundle;
	
	import edu.isi.bmkeg.kefed.diagram.controller.events.*;
	import edu.isi.bmkeg.kefed.model.design.*;
	
	import edu.isi.bmkeg.ooevv.model.*;
	import edu.isi.bmkeg.ooevv.rl.events.*;
	
	import flash.events.*;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.containers.Canvas;
	import mx.controls.Alert;
	import mx.core.DragSource;
	import mx.events.*;
	import mx.events.CloseEvent;
	import mx.managers.CursorManager;
	import mx.managers.DragManager;
	import mx.managers.PopUpManager;
	import mx.rpc.events.FaultEvent;
	import mx.utils.UIDUtil;
	
	import org.cytoscapeweb.view.components.GraphView;
	import org.cytoscapeweb.ApplicationFacade;
	
	public class CytoscapeKefedDesigner extends CytoscapeWeb
	{
		public var vbTypeDialog:VariableTypeDialog;
		
		public var k:KefedModelElement;

		public function CytoscapeKefedDesigner()
		{
			super();
			this.addEventListener("dragDrop", dragDropHandler);
			this.addEventListener("dragEnter", dragEnterHandler);
		}
		
		// The dragEnter event handler for the Canvas container
		// enables dropping.
		private function dragEnterHandler(event:DragEvent):void {
			DragManager.acceptDragDrop(CytoscapeKefedDesigner(event.currentTarget));
		}
		
		protected function dragDropHandler(event:DragEvent):void {
			
			// Explicitly handle the dragDrop event.            
			event.preventDefault();
			
			var itemsVector:Vector.<Object> = 
				event.dragSource.dataForFormat('itemsByIndex') as Vector.<Object>;
			
			var obj:Object = itemsVector[0];
			
			this.dispatchEvent( new FindOoevvElementByIdEvent(obj.vpdmfId) );
			
			var e:OoevvElement = new OoevvElement();
			e.elementType = obj.viewType;
			e.vpdmfId = obj.vpdmfId;
			e.termValue = obj[obj.viewType + "_2"];
			e.shortTermId = obj[obj.viewType + "_1"];
			
			var type:String = e.elementType;
			
			k = new KefedModelElement();
			k.x = event.localX;
			k.y = event.localY;
			k.w = 120;
			k.h = 63;
			k.defn = e;
			
			if( type == "SubVariable"  ) {
				
				return;
				
			} if( type == "ExperimentalVariable"  ) {
				
				askVbType();
				
			} else {
				
				var kk:KefedModelElement= null;
				if( type == "OoevvEntity" ) {
					
					kk = new EntityInstance();
					kk.elementType = "EntityInstance";
					
				} else if( e.elementType == "OoevvProcess" ) {
					
					kk = new ProcessInstance();
					kk.elementType = "ProcessInstance";
					
				}
				
				kk.uuid = UIDUtil.createUID(); 
				kk.x = k.x;
				kk.y = k.y;
				kk.w = k.w;
				kk.h = k.h;
				kk.defn = k.defn;
				k = kk;
				
				this.dispatchEvent( new DropKefedNodeIntoDiagramEvent(k, null ) ); //this.toXML() ) );
				
			}
			
			
		}
		
		private function askVbType():void {			
			
			vbTypeDialog = PopUpManager.createPopUp(this, VariableTypeDialog, true) as VariableTypeDialog;
			vbTypeDialog.addEventListener(CloseEvent.CLOSE, closeVbType);
			vbTypeDialog.OkButton.addEventListener(MouseEvent.CLICK, setVbType );
			vbTypeDialog.cancelButton.addEventListener(MouseEvent.CLICK, closeVbType);
			vbTypeDialog.vbName = k.defn.termValue;
			mx.managers.PopUpManager.centerPopUp(vbTypeDialog);
			
		}
		
		private function setVbType(e:Event):void {
			
			if( vbTypeDialog.t == null || vbTypeDialog.t == "")
				return;
			
			var kk:KefedModelElement= null;
			if( vbTypeDialog.t == "Measurement" ) {
				
				kk = new MeasurementInstance();
				kk.elementType = "MeasurementInstance";
				
			} else if( vbTypeDialog.t == "Parameter" ) {
				
				kk = new ParameterInstance();
				kk.elementType = "ParameterInstance";
				
			} else if( vbTypeDialog.t == "Constant" ) {
				
				kk = new ConstantInstance();
				kk.elementType = "ConstantInstance";
				
			}
			
			kk.uuid = UIDUtil.createUID(); 
			kk.x = k.x;
			kk.y = k.y;
			kk.w = k.w;
			kk.h = k.h;
			kk.defn = k.defn;
			k = kk;				
			
			this.dispatchEvent( new DropKefedNodeIntoDiagramEvent(k, null) ); //this.toXML() ) );
			
			mx.managers.PopUpManager.removePopUp(vbTypeDialog);
			
		}
		
		private function closeVbType(e:Event):void {
			mx.managers.PopUpManager.removePopUp(vbTypeDialog);
		}
		
	}
}