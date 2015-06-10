// $Id$
//
//  $Date$
//  $Revision$
//
package edu.isi.bmkeg.kefed.editor.elements
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