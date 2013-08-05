package edu.isi.bmkeg.ooevv.editor.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.ooevv.rl.events.*;
	
	import edu.isi.bmkeg.ooevv.editor.model.*;
	
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class ListOoevvElementPagedResultCommand extends Command
	{
	
		[Inject]
		public var event:ListOoevvElementPagedResultEvent;

		[Inject]
		public var model:OoevvElementPagedListModel;
				
		override public function execute():void
		{
			
			var l:ArrayCollection = new ArrayCollection();
			
			for each(var lvi:LightViewInstance in event.list) {
				
				var o:Object = new Object();
				o.vpdmfLabel = lvi.vpdmfLabel;
				o.viewType = lvi.defName;
				o.vpdmfId = lvi.vpdmfId;
				var fields:Array = lvi.indexTupleFields.split(/\<\|\>/);
				var tuple:Array = lvi.indexTuple.split(/\<\|\>/);
				
				for(var i:int=0; i<fields.length; i++) {
					var f:String = fields[i] as String;
					var v:String = tuple[i] as String;			
					if( v == null )
						v = "";
					v = v.replace(/,/,", ");
					o[f]=v;	
				}
				
				l.addItem(o);
				
			}
			
			if( event.offset == 0 ) {
				model.storeObjectsAt(event.offset, l.toArray(), true);
			} else {
				model.storeObjectsAt(event.offset, l.toArray(), false);
			}
			
		}
	
		
		
	}
	
}