// $Id: ModelStoreEvent.as 1180 2010-09-22 17:19:40Z tom $

package edu.isi.bmkeg.kefed.component.view.store
{
	import edu.isi.bmkeg.kefed.component.view.elements.KefedModel;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	
	/** Events dispatched as part of the action of a
	 *  model store.  These are dispatched by the model store
	 *  implementations as asynchronous operations complete.
	 *  The return values of operations are returned as the values
	 *  of the fields of this event, for those events where that
	 *  makes sense.  Otherwise these fields have null as their value.
	 * 
	 * @author University of Southern California
	 * @date $Date: 2010-09-22 10:19:40 -0700 (Wed, 22 Sep 2010) $
	 * @version $Revision: 1180 $
	 * 
	 */
	public class ModelStoreEvent extends Event
	{
		/**
		 *  Constants used for event types in this class. 
		 */		
		public static const DELETE:String = "delete";
		public static const LIST:String = "list";
		public static const SAVE:String = "save";
    	public static const RETRIEVE:String = "retrieve";
    	public static const INSERT:String = "insert";
    	public static const ERROR:String = "error";
    	
    	/** The KefedModel that is returned as a result of a RETRIEVE
    	 *  operation.  Null otherwise. 
    	 */
    	public var model:KefedModel = null;


   		/** The collection of models that is returned as a result of a LIST
    	 *  operation.  Null otherwise.   The collection will contain objects
    	 *  of type ??? [Probably whatever we use as our shorthand model
    	 *  descriptor.]
    	 */
 		public var modelList:ArrayCollection = null;
		
		/** Create a new ModelStoreEvent and set the model and modelList
		 *  fields.  This will be used in response to list or load actions
		 *  and provide the means to get the return values.
		 * 
		 * @param type The type of event from the set of constants for this class
		 * @param model The KefedModel retrieve by load (optional)
		 * @param modelList List of KefedModels in reponse to list (optional)
		 * 
		 */
		public function ModelStoreEvent(type:String, model:KefedModel=null, modelList:ArrayCollection=null) {
			super(type);
			this.model = model;
			this.modelList = modelList;	
		}

	}
}