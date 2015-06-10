// $Id: KefedAppEventDispatcher.as 328 2010-03-01 23:23:06Z tom $
//
//  $Date: 2010-03-01 15:23:06 -0800 (Mon, 01 Mar 2010) $
//  $Revision: 328 $
//
package edu.isi.bmkeg.kefed.component.view.app
{
	import flash.events.EventDispatcher;
	import edu.isi.bmkeg.kefed.component.view.elements.KefedModel;

	public class KefedAppEventDispatcher extends EventDispatcher {

		public function KefedAppEventDispatcher() {}
	
		public function dispatchBioScholarEvent(event:String, model:KefedModel=null):void {
			
			var e:KefedAppEvent = new KefedAppEvent(event, model);
			
			dispatchEvent(e);	
						
		}

	}

}