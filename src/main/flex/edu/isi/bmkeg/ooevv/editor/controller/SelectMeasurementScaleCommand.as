package edu.isi.bmkeg.ooevv.editor.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.ooevv.editor.model.*;
	import edu.isi.bmkeg.ooevv.editor.service.*;
	import edu.isi.bmkeg.ooevv.events.*;
	
	import flash.events.Event;
	
	public class SelectMeasurementScaleCommand extends Command
	{
	
		[Inject]
		public var event:SelectMeasurementScaleEvent;

		[Inject]
		public var ooevvEditorModel:OoevvEditorModel;
						
		[Inject]
		public var ooevvService:IOoevvService;

		override public function execute():void
		{
//			ooevvService.loadMeasurementScale(event.scaleType, event.uid);
		}
		
	}
	
}