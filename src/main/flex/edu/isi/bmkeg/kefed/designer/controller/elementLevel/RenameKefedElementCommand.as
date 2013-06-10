package edu.isi.bmkeg.kefed.designer.controller.elementLevel
{	
	import edu.isi.bmkeg.kefed.model.design.*;
	
	import edu.isi.bmkeg.kefed.designer.events.elementLevel.RenameKefedElementEvent;
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;

	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	
	public class RenameKefedElementCommand extends Command
	{
	
		[Inject]
		public var event:RenameKefedElementEvent;
				
		[Inject]
		public var model:KefedDesignerModel;

		override public function execute():void
		{
			var uid:String = event.uid;
			var newName:String = event.newName;
			
			for( var j:int=0; j<model.kefedModel.elements.length; j++) {
				var n:KefedModelElement = KefedModelElement(
					model.kefedModel.elements.getItemAt(j)
				);
				
				if( n.uuid == uid ) {
					
					/* Use this as a lookup function. 
					Basically take the string entered here 
					and look it up from the OoEVV 
					Element List */ 
					
					break;

				}			
				
			}
			
		}
		
	}
	
}