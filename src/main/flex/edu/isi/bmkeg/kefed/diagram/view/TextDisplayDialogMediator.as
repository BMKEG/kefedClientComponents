package edu.isi.bmkeg.kefed.diagram.view
{

	import edu.isi.bmkeg.kefed.diagram.controller.events.*;
	
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;

	import org.robotlegs.mvcs.Mediator;
	
	public class TextDisplayDialogMediator extends Mediator
	{

		[Inject]
		public var view:TextDisplayDialog;
		
		override public function onRegister():void 
		{
			addViewListener(CloseEvent.CLOSE, removeMediator);			
		}
		
		private function removeMediator(event:CloseEvent):void {	
			PopUpManager.removePopUp(view);
			mediatorMap.removeMediator( this );
		}
		
	}
	
}