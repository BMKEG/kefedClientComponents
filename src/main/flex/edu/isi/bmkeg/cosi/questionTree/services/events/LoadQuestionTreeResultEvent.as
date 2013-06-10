package edu.isi.bmkeg.cosi.questionTree.services.events
{

	import flash.events.Event;
	import edu.isi.bmkeg.cosi.model.Investigation;

	import mx.collections.ArrayCollection;
	
	public class LoadQuestionTreeResultEvent extends Event
	{

		public static const LOAD_QUESTION_TREE_RESULT:String = "loadQuestionTreeResult";

		public var list:ArrayCollection;

		public function LoadQuestionTreeResultEvent(list:ArrayCollection)
		{
			super(LOAD_QUESTION_TREE_RESULT);
			this.list = list;
		}

		override public function clone() : Event
		{
			return new LoadQuestionTreeResultEvent(list);
		}

	}

}
