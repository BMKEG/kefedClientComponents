package edu.isi.bmkeg.kefed.designer.model
{
	
	import edu.isi.bmkeg.kefed.model.flare.*;
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
		
		public var frgTree:XML = <root/>;
		
		public var kefedModelTree:XML = <root/>;
		
		public var kefedModel:KefedModel = new KefedModel();
		
		public var fg:FlareGraph = new FlareGraph();

		public var lastXmlUpdateTime:Date = new Date();
		
		// Copy of the KEfED model
		public var savedModel:KefedModel = new KefedModel();

		public var kefedElement:KefedModelElement;

		public var ooevvElementSet:OoevvElementSet;

		public var sync:Boolean = true;

		public var state:String = "";	
		
	}

}