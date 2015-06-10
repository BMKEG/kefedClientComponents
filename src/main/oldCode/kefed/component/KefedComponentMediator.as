package edu.isi.bmkeg.kefed.component
{

	import com.maccherone.json.JSON;
	
	import edu.isi.bmkeg.bioscholar.model.KefedModelCuration;
	import edu.isi.bmkeg.bioscholar.model.qo.KefedModelCuration_qo;
	import edu.isi.bmkeg.bioscholar.rl.events.*;
	import edu.isi.bmkeg.kefed.component.model.*;
	import edu.isi.bmkeg.kefed.component.view.elements.KefedFullValueTemplate;
	import edu.isi.bmkeg.kefed.component.view.elements.KefedLink;
	import edu.isi.bmkeg.kefed.component.view.elements.KefedObject;
	import edu.isi.bmkeg.kefed.component.view.store.*;
	import edu.isi.bmkeg.kefed.component.view.store.events.*;
	import edu.isi.bmkeg.kefed.component.view.store.vpdmf.*;
	import edu.isi.bmkeg.kefed.designer.view.popups.*;
	import edu.isi.bmkeg.kefed.diagram.controller.events.*;
	import edu.isi.bmkeg.kefed.events.*;
	import edu.isi.bmkeg.kefed.events.elementLevel.*;
	import edu.isi.bmkeg.kefed.events.modelLevel.*;
	import edu.isi.bmkeg.kefed.model.data.Experiment;
	import edu.isi.bmkeg.kefed.model.design.BranchPoint;
	import edu.isi.bmkeg.kefed.model.design.ConstantInstance;
	import edu.isi.bmkeg.kefed.model.design.EntityInstance;
	import edu.isi.bmkeg.kefed.model.design.ForkPoint;
	import edu.isi.bmkeg.kefed.model.design.KefedModelEdge;
	import edu.isi.bmkeg.kefed.model.design.KefedModelElement;
	import edu.isi.bmkeg.kefed.model.design.MeasurementInstance;
	import edu.isi.bmkeg.kefed.model.design.ParameterInstance;
	import edu.isi.bmkeg.kefed.model.design.ProcessInstance;
	import edu.isi.bmkeg.kefed.model.qo.design.KefedModel_qo;
	import edu.isi.bmkeg.kefed.rl.events.*;
	import edu.isi.bmkeg.ooevv.model.*;
	import edu.isi.bmkeg.ooevv.model.scale.*;
	import edu.isi.bmkeg.ooevv.model.value.*;
	import edu.isi.bmkeg.terminology.model.Term;
	import edu.isi.bmkeg.terminology.model.qo.Ontology_qo;
	import edu.isi.bmkeg.terminology.model.qo.Term_qo;
	import edu.isi.bmkeg.terminology.rl.events.ListTermEvent;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.managers.PopUpManager;
	
	import org.alivepdf.layout.Unit;
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	
	public class KefedComponentMediator extends ModuleMediator 
	{

		[Inject]
		public var view:KefedComponent;

		[Inject]
		public var model:KefedComponentModel;
		
		override public function onRegister():void 
		{
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// Commands triggered from within the KefedComponent.
			addViewListener(
				TriggerDeleteKefedModelEvent.TRIGGER_DELETE_KEFED_MODELS, 
				triggerDeleteKefedModelHandler);
			
			addViewListener(
				TriggerDeleteKefedDataEvent.TRIGGER_DELETE_KEFED_DATA, 
				triggerDeleteKefedDataHandler);
			
			addViewListener(
				TriggerInsertKefedModelEvent.TRIGGER_INSERT_KEFED_MODEL, 
				triggerInsertKefedModelHandler);

			addViewListener(
				TriggerInsertKefedDataEvent.TRIGGER_INSERT_KEFED_DATA, 
				triggerInsertKefedDataHandler);
			
			addViewListener(
				TriggerListKefedModelsEvent.TRIGGER_LIST_KEFED_MODELS, 
				triggerListKefedModelsHandler);

			addViewListener(
				TriggerListKefedDataEvent.TRIGGER_LIST_KEFED_DATA, 
				triggerListKefedDataHandler);

			addViewListener(
				TriggerRetrieveKefedModelEvent.TRIGGER_RETRIEVE_KEFED_MODELS, 
				triggerRetrieveKefedModelHandler);
			
			addViewListener(
				TriggerRetrieveKefedDataEvent.TRIGGER_RETRIEVE_KEFED_DATA, 
				triggerRetrieveKefedDataHandler);

			addViewListener(
				TriggerSaveKefedModelEvent.TRIGGER_SAVE_KEFED_MODEL, 
				triggerSaveKefedModelHandler);

			addViewListener(
				TriggerSaveKefedDataEvent.TRIGGER_SAVE_KEFED_DATA, 
				triggerSaveKefedDataHandler);

			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~
			
			addContextListener(ListKefedModelResultEvent.LIST_KEFEDMODEL_RESULT, 
				listKefedModelResultEventHandler);
			
			addContextListener(RetrieveCompleteKefedModelResultEvent.RETRIEVE_COMPLETE_KEFED_MODEL_RESULT, 
				retrieveCompleteKefedModelHandler);

			addContextListener(DeleteCompleteKefedModelResultEvent.DELETE_COMPLETE_KEFED_MODEL_RESULT, 
				deleteKefedModelResultEventHandler);

			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~

			//
			// Run lookup functions to manage ontologies here.
			// 
			/*var t:Term_qo = new Term_qo();
			var o:Ontology_qo = new Ontology_qo();
			t.ontology = o;
			o.shortName = "ooevv"
			
			var e:ListTermEvent = new ListTermEvent(t);
			this.dispatch(e);*/
			
		}
		
		private function updateKefedModelResultHandler(e:UpdateKefedModelResultEvent):void {
			
			this.dispatch( new RetrieveCompleteKefedModelEvent(e.id) );
			this.dispatch( new RetrieveKefedModelTreeEvent( model.articleCitation.vpdmfId ) );
			
		}
			
		// ~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
		private function triggerDeleteKefedModelHandler(e:TriggerDeleteKefedModelEvent):void {
			
			var e2:DeleteCompleteKefedModelFromUidEvent = 
				new DeleteCompleteKefedModelFromUidEvent(e.uid);
			
			dispatch(e2);
			
		}
		
		private function deleteKefedModelResultEventHandler(e:DeleteCompleteKefedModelResultEvent):void {
			
			var qo:KefedModel_qo = new KefedModel_qo();
			var e2:ListKefedModelEvent = new ListKefedModelEvent(qo);
			dispatch(e2);

		}
		
		
		private function triggerDeleteKefedDataHandler(e:TriggerDeleteKefedDataEvent):void {			
			
		}

		private function triggerInsertKefedModelHandler(e:TriggerInsertKefedModelEvent):void {			
			
			var km:edu.isi.bmkeg.kefed.model.design.KefedModel = 
					this.convertComponentToModel(e.model);
			var e2:InsertInstantiatedKefedModelEvent = new InsertInstantiatedKefedModelEvent(km, true);
			dispatch(e2);
				
		}

		private function triggerInsertKefedDataHandler(e:TriggerInsertKefedDataEvent):void {			
			var data:edu.isi.bmkeg.kefed.component.view.elements.KefedExperiment = e.data;
			
			var mLookup:Object = new Object();
			var vbLookup:Object = new Object();
			for each(var ko:KefedObject in data.bNodes ) {
				if( ko.spriteid == "Measurement Specification" ) {
					vbLookup[ko.uid] = data.getDependOnsForMeasurement(ko);
					mLookup[ko.uid] = ko;
				}
			}
			
			var df:Object = new Object();
			df['name'] = data.modelName;
			df['type'] = data.type;
			
			var mm:Array = new Array();
			df["measurements"] = mm;
			for(var uuid:String in data.experimentData ) {
				for each(var mObj:Object in data.experimentData[uuid] ) {						
					var m:Object = new Object();
					var c:Object = new Object();
					var v:Object = new Object();
					mm.push(m);
					m['context'] = c;
					var params:ArrayCollection = vbLookup[ uuid ];
					for each(var param:KefedObject in params ) {
						c[ param.nameValue ] = mObj[param.uid];
					}
					m['value'] = v;
					v[ mLookup[uuid]['nameValue'] ] = mObj[uuid];
				}
			}
			
			var json:String = JSON.encode(df, true);
			
			trace(json);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			
			
		}
		
		// ~~~~~~~
		private function triggerListKefedModelsHandler(e:TriggerListKefedModelsEvent):void {			
			var qo:KefedModel_qo = new KefedModel_qo();
			var e2:ListKefedModelEvent = new ListKefedModelEvent(qo);
			dispatch(e2);
		}

		private function listKefedModelResultEventHandler(e:ListKefedModelResultEvent):void {

			var l:ArrayCollection = new ArrayCollection();			
			for each ( var lviObj:Object in model.kefedModelList ) {				
				var lvi:LightViewInstance = LightViewInstance(lviObj);
				var tuple:Object = lvi.convertToIndexTupleObject();
				var o:Object = {"modelName":tuple['KefedModel_1'], 
						"uid":tuple['KefedModel_3']};
				l.addItem(o);
			}
			var e2:ModelStoreEvent = new ModelStoreEvent(ModelStoreEvent.LIST, null, l); 
			view.inventory.modelStore.dispatchEvent( e2 );
			
		}
		
		// ~~~~~~~
		
		private function triggerListKefedDataHandler(e:TriggerListKefedDataEvent):void {			
			
		}

		// ~~~~~~~

		private function triggerRetrieveKefedModelHandler(e:TriggerRetrieveKefedModelEvent):void {		

			var e2:RetrieveCompleteKefedModelFromUuidEvent = new RetrieveCompleteKefedModelFromUuidEvent(e.uid);
			dispatch(e2);
			
		}
		
		private function retrieveCompleteKefedModelHandler(e:RetrieveCompleteKefedModelResultEvent):void {
			
			var kcm:edu.isi.bmkeg.kefed.component.view.elements.KefedModel = 
				this.convertModelToComponent( model.kefedModel );

			var e2:ModelStoreEvent = new ModelStoreEvent(ModelStoreEvent.RETRIEVE, kcm, null); 
			view.inventory.modelStore.dispatchEvent( e2 );
				
		}
		
		public function convertComponentToModel(
				kcm:edu.isi.bmkeg.kefed.component.view.elements.KefedModel
				): edu.isi.bmkeg.kefed.model.design.KefedModel {
			
			var km:edu.isi.bmkeg.kefed.model.design.KefedModel = 
				new edu.isi.bmkeg.kefed.model.design.KefedModel();
			
			km.diagramXML = kcm.diagramXML.toString();
			km.notes = kcm.description;
			km.uuid = kcm.uid;
			km.exptId = kcm.modelName;
			
			var hash:Object = new Object();
			for each( var e:KefedObject in kcm.bNodes ) {
				var kmEl:KefedModelElement = convertKefedObjectToKefedElement(e, kcm.diagramXML);
				km.elements.addItem( kmEl );
				kmEl.model = km;
				hash[kmEl.uuid] = kmEl;
			}
			
			for each( var ee:KefedLink in kcm.bEdges ) {
				
				var kmEd:KefedModelEdge = new KefedModelEdge();
				kmEd.uuid = ee.uid;
				
				var s:KefedObject = KefedObject(ee.source);
				var source:KefedModelElement = hash[s.uid];
				kmEd.source = source;
				
				var t:KefedObject = KefedObject(ee.target);
				var target:KefedModelElement = hash[t.uid];
				kmEd.target = target;
				
				km.edges.addItem(kmEd);
				kmEd.model = km;
				
			}
	
			return km;
			
		}
		
		public function convertModelToComponent(
				km:edu.isi.bmkeg.kefed.model.design.KefedModel
			): edu.isi.bmkeg.kefed.component.view.elements.KefedModel {
			
			var kcm:edu.isi.bmkeg.kefed.component.view.elements.KefedModel = 
				new edu.isi.bmkeg.kefed.component.view.elements.KefedModel();
			
			kcm.diagramXML = XML(km.diagramXML);
			kcm.description = km.notes;
			kcm.citeKey = "NA";
			kcm.type = "template";
			
			for each( var e:KefedModelElement in km.elements ) {
				kcm.addNode( convertKefedElementToFlareNode(e) );				
			}
			
			for each( var ee:KefedModelEdge in km.edges ) {
				kcm.createEdge(ee.source.uuid, ee.target.uuid, ee.uuid);
			}
			
			return kcm;
			
		}

		public function convertKefedObjectToKefedElement(
			k:KefedObject, 
			diagramXML:XML):KefedModelElement {
		
			var kme:KefedModelElement = null;
			var oe:OoevvElement = null;
						
			if( k.spriteid == "Constant Specification" ) {
	
				kme = new ConstantInstance();
				kme.elementType = "ConstantInstance";
				oe = this.buildExperimentalVariableFromKefedObject(k);				
					
			} else if( k.spriteid == "Parameter Specification" ) {

				kme = new ParameterInstance();
				kme.elementType = "ParameterInstance";
				oe = this.buildExperimentalVariableFromKefedObject(k);				
				
			} else if( k.spriteid == "Measurement Specification" ) {
				
				kme = new MeasurementInstance();
				kme.elementType = "MeasurementInstance";
				oe = this.buildExperimentalVariableFromKefedObject(k);

			} else if( k.spriteid == "Activity" ) {

				kme = new ProcessInstance();
				kme.elementType = "ProcessInstance";
				
				var p:OoevvProcess = new OoevvProcess();
				p.termType = "ExperimentalVariable";
				p.termValue = k.nameValue;				
				p.shortTermId = stripWhitespace(k.nameValue.toLowerCase());
				
				oe = p;

			} else if( k.spriteid == "Experimental Object" ) {

				kme = new EntityInstance();
				kme.elementType ="EntityInstance";

				var e:OoevvEntity = new OoevvEntity();
				e.termType = "ExperimentalVariable";
				e.termValue = k.nameValue;				
				e.shortTermId = stripWhitespace(k.nameValue.toLowerCase());
				
				oe = e;
				
			} else if( k.spriteid == "Fork" ) {

				kme = new ForkPoint();
				kme.elementType = "ForkPoint";

			} else if( k.spriteid == "Branch" ) {
				
				kme = new BranchPoint();
				kme.elementType = "BranchPoint";
			}
			
			kme.uuid = k.uid;
			kme.defn = oe;
			
			//
			// X + Y data is embedded in the diagram XML.
			// pull it out and explictly represent it in the kme representation
			// don't worry about labels here, but that may need to be added later. 
			//
			var elementXML:XMLList = diagramXML.panels.panel.lane.
				sprites.sprite.(attribute('dataid')==k.uid);
			var dimString:String = elementXML.@box[0];
			var dims:Array = dimString.split(",");
			kme.x = Number(dims[0]);
			kme.y = Number(dims[1]);
			kme.w = Number(dims[2]);
			kme.h = Number(dims[3]);
			
			return kme;
			
		}
		
		public function convertKefedElementToFlareNode(k:KefedModelElement):KefedObject {
			
			var n:KefedObject = new KefedObject();
			n.did = k.uuid + "-0000"; 
			n.uid = k.uuid;
			n.nameValue = k.defn.termValue;
			
			var dx:String = "NaN";
			var dy:String = "NaN";
			n.x = k.x;
			n.y = k.y;
			n.w = k.w;
			n.h = k.h;
			
			var spriteid:String = "";
			var label:String = k.defn.termValue;
			var nLines:int = Math.ceil(label.length / 12);
			
			if( k.elementType == "ConstantInstance" ) {
				
				spriteid = "Constant Specification";
				
			} else if( k.elementType == "ParameterInstance" ) {
				
				spriteid = "Parameter Specification";
				
			} else if( k.elementType == "MeasurementInstance" ) {
				
				spriteid = "Measurement Specification";
				
			} else if( k.elementType == "EntityInstance") {
				
				spriteid = "Experimental Object";
				
			} else if( k.elementType == "ProcessInstance") {
				
				spriteid = "Activity";
				
			} else if( k.elementType == "BranchPoint") {
				
				spriteid = "Branch";
				
			} else if( k.elementType == "ForkPoint") {
				
				spriteid = "Fork";
				
			} else {
				trace("Can't convert " + k.elementType );
			}
			
			n.spriteid = spriteid;
			
			return n;
			
		}
		
		private function buildExperimentalVariableFromKefedObject(k:KefedObject):ExperimentalVariable {
		
			var ev:ExperimentalVariable = new ExperimentalVariable();
			
			ev.termType = "ExperimentalVariable";
			
			ev.shortTermId = stripWhitespace(k.nameValue.toLowerCase());
			ev.termValue = k.nameValue;				
			
			if( k.valueType != null ) {
				var ms:MeasurementScale = this.convertValueTypeToScale( k.valueType, k.nameValue);
				ev.scale = ms;
			}
			
			return ev;
		
		}
		
		private function convertValueTypeToScale(vt:KefedFullValueTemplate, vbName:String):MeasurementScale {
			
			var tId:String = stripWhitespace(vbName.toLowerCase());
			var ms:MeasurementScale = null;
			
			if( vt.valueTypeName == "True/False" ) {
				
				var bs1:BinaryScale = new BinaryScale();
				bs1.termValue = vbName + "_scale";
				bs1.shortTermId = tId + "_scale";
				ms = bs1;
				
			}
			else if( vt.valueTypeName == "Integer" ) {
				
				var is1:IntegerScale = new IntegerScale();
				is1.termValue = vbName + "_scale";
				is1.shortTermId = tId + "_scale";
				ms = is1;
				
			}
			else if( vt.valueTypeName == "Decimal" ) {
				
				var ds1:DecimalScale = new DecimalScale();
				ds1.termValue = vbName + "_scale";
				ds1.shortTermId = tId + "_scale";
				ms = ds1;
				
			}
			else if( vt.valueTypeName == "Decimal with units" ) {
				
				var ds2:DecimalScale = new DecimalScale();
				ds2.termValue = vbName + "_scale";
				ds2.shortTermId = tId + "_scale";
				ms = ds2;
				
				for(var compUnit:String in vt.allowedUnits) {
					var u:Term = new Term();
					u.shortTermId = compUnit;
					u.termValue = compUnit;
					ds2.units = u;
					break;
				}
				
			}
			else if( vt.valueTypeName == "Term" ) {
				
			}
			else if( vt.valueTypeName == "Text" ) {
				
				var ns1:NominalScale = new NominalScale();
				ns1.termValue = vbName + "_scale";
				ns1.shortTermId = tId + "_scale";
				ms = ns1;
				
			}
			else if( vt.valueTypeName == "Text List" ) {
				
				var nswat1:NominalScaleWithAllowedTerms = new NominalScaleWithAllowedTerms();
				nswat1.termValue = vbName + "_scale";
				nswat1.shortTermId = tId + "_scale";
				ms = nswat1;
				
				for(var compUnit2:String in vt.allowedValues) {
					var v:Term = new Term();
					v.shortTermId = compUnit2;
					v.termValue = compUnit2;
					nswat1.nVal.addItem(v);
				}
				
			}
				
			else if( vt.valueTypeName == "Long Text" ) {
				
			}
			else if( vt.valueTypeName == "Region" ) {
				
			}
			else if( vt.valueTypeName == "Date" ) {
				
			}
			else if( vt.valueTypeName == "Time" ) {
				
			}
			else if( vt.valueTypeName == "DateTime" ) {
				
			}
			else if( vt.valueTypeName == "File" ) {
				
			}
			else if( vt.valueTypeName == "Image" ) {
				
			}
			else if( vt.multipleSlotFields.length > 0 ) {
				
			}
			
			return ms;
			
		}
		
		private function stripWhitespace(s:String):String {
			
			var ctrlR:RegExp = /\r+/;
				s  = s.replace(ctrlR," ");

			var space:RegExp = /\s+/;
			s = s.replace(space,"_");
			
			return s;
		}
		
		// ~~~~~~~

		private function triggerRetrieveKefedDataHandler(e:TriggerRetrieveKefedDataEvent):void {			
			
		}
		
		private function triggerSaveKefedModelHandler(e:TriggerSaveKefedModelEvent):void {			
			
		}
		
		private function triggerSaveKefedDataHandler(e:TriggerSaveKefedDataEvent):void {			
			
		}
		
		
		
	}
	
}