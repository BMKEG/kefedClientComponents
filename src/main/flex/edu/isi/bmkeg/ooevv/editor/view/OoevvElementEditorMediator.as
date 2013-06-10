package edu.isi.bmkeg.ooevv.editor.view
{
	
	import edu.isi.bmkeg.ooevv.model.*;
	import edu.isi.bmkeg.ooevv.model.scale.*;
	import edu.isi.bmkeg.ooevv.editor.controller.*;
	import edu.isi.bmkeg.ooevv.events.*;
	import edu.isi.bmkeg.ooevv.editor.model.*;
	import edu.isi.bmkeg.ooevv.editor.view.*;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	
	// added to overcome 'class not found errors'
	//private var hackFix1:KefedObjectProxy;
	//private var hackFix2:KefedLinkProxy;
	
	public class OoevvElementEditorMediator extends ModuleMediator
	{

		[Inject]
		public var view:OoevvElementEditor;
		
		[Inject]
		public var model:OoevvEditorModel;
		
		override public function onRegister():void 
		{
		
			addViewListener(SelectExperimentalVariableEvent.SELECT_EXPERIMENTAL_VARIABLE, dispatch);
			
			addContextListener(LoadOoevvElementResultEvent.LOAD_OOEVV_ELEMENT_RESULT, updateOoevvElementForm);

		}
		
		override public function onRemove():void 
		{				
			view.vbs = new ArrayCollection();
//			changeWatcher.unwatch();

		}		

		override protected function dispatch(event:Event):Boolean {
			view.turnOnLoadingIndicator();
			return super.dispatch(event);
		}
		
		private function updateOoevvElementForm(event:LoadOoevvElementResultEvent):void {
			
			view.turnOffLoadingIndicator();

			var oe:OoevvElement = OoevvElement(event.result);		
			
			if( oe.elementType == "ExperimentalVariable" ) {
				
				this.updateExperimentalVariableForm(ExperimentalVariable(oe));		

			} else if( oe.elementType == "OoevvProcess" ) {

				this.updateOoevvProcessForm(OoevvProcess(oe));		

			} else if( oe.elementType == "OoevvEntity" ) {

				this.updateOoevvEntityForm(OoevvEntity(oe));		

			}
						
		}
		
		private function updateExperimentalVariableForm(ev:ExperimentalVariable):void {
			
			view.vb = ev;
						
			view.currentState = ev.scale.classType;
	
			var ms:MeasurementScale = ev.scale;
			var s:String = ms.classType;
			
			if( s == null ) {
			
				throw new Error("LoadMeasurementScale Failed");
			
			} else if( s == "BinaryScaleWithNamedValues") {
				
				var bswnv:BinaryScaleWithNamedValues = BinaryScaleWithNamedValues(ms);				
				view.bswnvTrue.text = bswnv.trueValue.termValue;
				view.bswnvFalse.text = bswnv.falseValue.termValue;
				
			} else if( s ==	"DecimalScale") {
				
				var ds:DecimalScale = DecimalScale(ms);
				
				view.nsCircular.selected = ds.circular;
				view.nsMax.text = new String(ds.maximumDoubleValue);
				view.nsMin.text = new String(ds.minimumDoubleValue);
				
				if( ds.units != null ) {
					view.nsUnitsName.text = ds.units.termValue;
					view.nsUnitsOntologyId.text = ds.units.ontology.shortName;
					view.nsUnitsTermId.text = ds.units.shortTermId;
				}
				
			} else if( s ==	"IntegerScale") {

				var isc:IntegerScale = IntegerScale(ms);

				view.nsCircular.selected = isc.circular;
				view.nsMax.text = new String(isc.maximumIntegerValue);
				view.nsMin.text = new String(isc.minimumIntegerValue);
				
				if( isc.units != null ) {
					view.nsUnitsName.text = isc.units.termValue;
					view.nsUnitsOntologyId.text = isc.units.ontology.shortName;
					view.nsUnitsTermId.text = isc.units.shortTermId;
				}
				
			} else if( s ==	"HierarchicalScale") {
				
				var hs:HierarchicalScale = HierarchicalScale(ms);
				/*view.hsTopName = hs.hierarchicalValues.getItemAt(0)
				ms = hts;*/
				
			} else if( s ==	"OrdinalScaleWithMaxRanks") {
				
				var oswr:OrdinalScaleWithMaxRank = OrdinalScaleWithMaxRank(ms);
				
				view.oswmr.text = new String(oswr.maximumRank);
				
			} else if( s == "OrdinalScaleWithNamedRanks") {

				var oswnr:OrdinalScaleWithNamedRanks = OrdinalScaleWithNamedRanks(ms);
				
				view.owwnrTable.dataProvider = oswnr.ordinalValues;
								
			} else if( s == "CompositeScale") {

				var mvcs:CompositeScale= CompositeScale(ms);

				view.mvcsTable.dataProvider = mvcs.hasParts;
				
			} else if( s == "NominalScaleWithAllowedTerms") {

				var nswat:NominalScaleWithAllowedTerms = NominalScaleWithAllowedTerms(ms);

				view.nswatTable.dataProvider = nswat.nominalValues;

			} else if( s == "RelativeTermScale") {
//				var rts:RelativeTermScale = RelativeTermScale(o);
//				ms = rts;
			}
			
		}
		
		private function updateOoevvProcessForm(op:OoevvProcess):void {
			
			view.op = op;
			
			view.currentState = "OoevvProcess";
			
		}
		
		private function updateOoevvEntityForm(oe:OoevvEntity):void {
			
			view.oe	= oe;
			
			view.currentState = "OoevvEntity";
			
		}

	}

}