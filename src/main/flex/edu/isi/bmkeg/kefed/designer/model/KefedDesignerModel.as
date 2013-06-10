package edu.isi.bmkeg.kefed.designer.model
{
	
	import edu.isi.bmkeg.kefed.model.design.KefedModel;
	import edu.isi.bmkeg.kefed.model.design.KefedModelElement;
	import edu.isi.bmkeg.ooevv.model.OoevvElementSet;
	
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	import mx.utils.UIDUtil;
	
	import org.robotlegs.mvcs.Actor;

	[Bindable]
	public class KefedDesignerModel extends Actor
	{
		
		public var modelList:ArrayCollection = new ArrayCollection();
		
		public var kefedModel:KefedModel = new KefedModel();
		
		// Copy of the KEfED model
		public var savedModel:KefedModel = new KefedModel();

		public var kefedElement:KefedModelElement;

		public var ooevvElementSet:OoevvElementSet;

		public var sync:Boolean = true;

		public var state:String = "";
		
		
	}

}