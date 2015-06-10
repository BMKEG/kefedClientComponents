// $Id: KefedLink.as 1482 2010-12-15 02:02:49Z tom $
//
//  $Date: 2010-12-14 18:02:49 -0800 (Tue, 14 Dec 2010) $
//  $Revision: 1482 $
//
package edu.isi.bmkeg.kefed.component.view.elements
{
	import flare.vis.data.EdgeSprite;
	import flare.vis.data.NodeSprite;
	import mx.utils.UIDUtil;
	

	public class KefedLink extends EdgeSprite
	{
		[Bindable]
		public var uid:String;
		
		public function KefedLink(uid:String=null, source:NodeSprite=null, 
				target:NodeSprite=null, directed:Boolean=true)	{
					
			this.uid = uid;
			super(source, target, directed);
		}
		
		/** Update the UID of this model.
		 *  Also recursively update the uids of all the
		 *  model nodes.
		 */
		public function updateUID():void{ 
			uid = UIDUtil.createUID();
		}
		
	}
	
}