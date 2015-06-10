package edu.isi.bmkeg.kefed.designer.controller.elementLevel
{	
	import edu.isi.bmkeg.kefed.designer.model.KefedDesignerModel;
	import edu.isi.bmkeg.kefed.diagram.controller.events.*;
	import edu.isi.bmkeg.kefed.events.elementLevel.*;
	import edu.isi.bmkeg.kefed.model.design.*;
	import edu.isi.bmkeg.kefed.model.design.KefedModelElement;
	import edu.isi.bmkeg.kefed.model.flare.FlareNode;
	import edu.isi.bmkeg.kefed.rl.events.InsertMeasurementInstanceEvent;
	import edu.isi.bmkeg.kefed.rl.events.InsertVariableInstanceEvent;
	import edu.isi.bmkeg.kefed.services.extKefed.IExtendedKefedService;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	
	public class DragSelectionCommand extends Command
	{
	
		[Inject]
		public var event:DragSelectionEvent;
				
		[Inject]
		public var model:KefedDesignerModel;

		[Inject]
		public var service:IExtendedKefedService;
		
		override public function execute():void
		{
			
			var el:KefedModelElement = null;
			var dx:int = 0;
			var dy:int = 0;
			
			var uids:ArrayCollection = new ArrayCollection(); 
			/*var moveSelection:Boolean = false;
			for each (var el:KefedModelElement in model.kefedElements ) {
				if( el.uuid == event.uid ) {
					dx = event.newX;
					dy = event.newY;
					moveSelection = true;
				}
				uids.addItem( el.uuid );
			}
			
			if( moveSelection ) {

				service.moveKefedEdgesAndElements( uids, dx, dy );	

			} else {*/
			
				var dbRefX:int = 0;
				var dbRefY:int = 0;
				var dbX:int = 0;
				var dbY:int = 0;
				for each( var ke:KefedModelElement in model.kefedModel.elements ) {
					if( ke.uuid == event.refUid ) {
						dbRefX = ke.x;
						dbRefY = ke.y;
					} else if( ke.uuid == event.uid ) {
						dbX = ke.x;
						dbY = ke.y;
					}
				}
				
				//
				// here is the value needed to map the 
				// reference back to it's correct coordinates;
				// NOTE: NO SCALING.
				//
				var dxCorrection:int = dbRefX - event.refX;
				var dyCorrection:int = dbRefY - event.refY;
				
				var newX:int = event.newX + dxCorrection;
				var newY:int = event.newY + dyCorrection;
				
				dx = newX - dbX;
				dy = newY - dbY;
				
				if( dx != 0 && dy != 0 ) {
					uids = new ArrayCollection(); 
					uids.addItem( event.uid );
					service.moveKefedEdgesAndElements( uids, newX, newY );
				}
				
			//}
			
		}
		
	}
	
}