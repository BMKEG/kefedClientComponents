package edu.isi.bmkeg.cosi.questionTree.services.events
{

	import flash.events.Event;
	import edu.isi.bmkeg.cosi.model.Investigation;

	public class LoadQuestionTreeEvent extends Event
		{

		public static const LOAD_QUESTION_TREE:String = "loadQuestionTree";

		public function LoadQuestionTreeEvent()
		{
			super(LOAD_QUESTION_TREE);
		}

		override public function clone() : Event
		{
			return new LoadQuestionTreeEvent();
		}

	}
}
