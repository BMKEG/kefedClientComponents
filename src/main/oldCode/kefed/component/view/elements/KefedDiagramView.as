// $Id: KefedDiagramView.as 328 2010-03-01 23:23:06Z tom $
//
//  $Date: 2010-03-01 15:23:06 -0800 (Mon, 01 Mar 2010) $
//  $Revision: 328 $
//
package edu.isi.bmkeg.kefed.component.view.elements
{

	import com.kapit.diagram.view.DiagramView;
	import com.kapit.diagram.IDiagramElement;
	
	public class KefedDiagramView extends DiagramView
	{

		public override function notifyElementMoved(arg0:IDiagramElement):void
		{
			super.notifyElementMoved(arg0);
		}

		public override function notifyElementCreated(arg0:IDiagramElement):void
		{
			super.notifyElementCreated(arg0);			
		}

	}

}