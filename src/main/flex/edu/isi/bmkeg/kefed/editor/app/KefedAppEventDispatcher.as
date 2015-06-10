// $Id$
//
//  $Date$
//  $Revision$
//
package edu.isi.bmkeg.kefed.editor.app
{
	import flash.events.EventDispatcher;
	import edu.isi.bmkeg.kefed.editor.elements.KefedModel;

	public class KefedAppEventDispatcher extends EventDispatcher {

		public function KefedAppEventDispatcher() {}
	
		public function dispatchBioScholarEvent(event:String, model:KefedModel=null):void {
			
			var e:KefedAppEvent = new KefedAppEvent(event, model);
			
			dispatchEvent(e);	
						
		}

	}

}