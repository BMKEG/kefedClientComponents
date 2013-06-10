package edu.isi.bmkeg.cosi.questionTree.model
{
	
	import edu.isi.bmkeg.cosi.model.Investigation;
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	import mx.utils.UIDUtil;
	
	import org.robotlegs.mvcs.Actor;

	[Bindable]
	public class QuestionTreeModel extends Actor
	{
		
		public var investigations:ArrayCollection = new ArrayCollection();

		public var sync:Boolean = true;

		public var state:String = "";
		
	}

}