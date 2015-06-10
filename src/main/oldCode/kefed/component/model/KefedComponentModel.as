package edu.isi.bmkeg.kefed.component.model
{
	
	import edu.isi.bmkeg.digitalLibrary.model.citations.*;
	import edu.isi.bmkeg.kefed.component.view.elements.KefedModel;
	import edu.isi.bmkeg.kefed.model.design.KefedModel;
	import edu.isi.bmkeg.kefed.model.design.KefedModelEdge;
	import edu.isi.bmkeg.kefed.model.design.KefedModelElement;
	import edu.isi.bmkeg.kefed.model.flare.*;
	import edu.isi.bmkeg.ooevv.model.OoevvElementSet;
	
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	import mx.utils.UIDUtil;
	
	import org.robotlegs.mvcs.Actor;

	[Bindable]
	public class KefedComponentModel extends Actor
	{
		
		public var articleCitation:ArticleCitation;
		
		public var frgTree:XML = <root/>;
		
		public var kefedModelList:ArrayCollection = new ArrayCollection();
		
		public var kefedModel:edu.isi.bmkeg.kefed.model.design.KefedModel = 
			new edu.isi.bmkeg.kefed.model.design.KefedModel();
		
		public var kcm:edu.isi.bmkeg.kefed.component.view.elements.KefedModel = 
			new edu.isi.bmkeg.kefed.component.view.elements.KefedModel()

		public var lastXmlUpdateTime:Date = new Date();
		
		public var startElement:KefedModelElement;

		public var kefedElements:ArrayCollection = new ArrayCollection();

		public var kefedEdges:ArrayCollection = new ArrayCollection();

		public var ooevvEntities:Object = new Object();
		public var ooevvProcesses:Object = new Object();
		public var ooevvVariables:Object = new Object();
		public var ooevvScales:Object = new Object();
		
		public var ooevvElementSet:OoevvElementSet;

		public var sync:Boolean = true;

		public var state:String = "";	
		
	}

}