// $Id: KefedPersevereEvent.as 1180 2010-09-22 17:19:40Z tom $
//
//  $Date: 2010-09-22 10:19:40 -0700 (Wed, 22 Sep 2010) $
//  $Revision: 1180 $
//
package edu.isi.bmkeg.kefed.component.view.elements
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	[Deprecated]
	public class KefedPersevereEvent extends Event
	{
		public static const SEARCH:String = "search";
		public static const DELETE:String = "delete";
		public static const LIST:String = "list";
		public static const SAVE:String = "save";
		public static const INSERT:String = "insert";
    	public static const LOAD:String = "load";
    	public static const ERROR:String = "error";
		
		public var model:KefedModel;
		public var modelList:ArrayCollection;
		
		public function KefedPersevereEvent(type:String, model:KefedModel, modelList:ArrayCollection)
		{
			super(type);
			this.model = model;
			this.modelList = modelList;
		}
		
	}
}