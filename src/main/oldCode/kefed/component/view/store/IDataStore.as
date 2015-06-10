// $Id: IDataStore.as 1180 2010-09-22 17:19:40Z tom $

package edu.isi.bmkeg.kefed.component.view.store
{
	import edu.isi.bmkeg.kefed.component.view.elements.KefedExperiment;
	import edu.isi.bmkeg.kefed.component.view.elements.KefedModel;
	
	import flash.events.IEventDispatcher;
	
	/** Interface for Kefed data store implementations.  These
	 *  will use asynchronous transactions, which means that users
	 *  will need to register appropriate event listeners to get
	 *  the results of any operations.  The events signalled will be
	 *  of type DataStoreEvent.
	 * 
	 * @author University of Southern California
	 * @date $Date: 2010-09-22 10:19:40 -0700 (Wed, 22 Sep 2010) $
	 * @version $Revision: 1180 $
	 * 
	 */
	public interface IDataStore extends IEventDispatcher
	{
		/** List the experiments that are present in the store.  Returns
		 *  after starting the load and dispatches a DataStoreEvent
		 *  with type DataStoreEvent.LIST when loading is complete.
		 *  Otherwise dispatches a DataStoreEvent.ERROR event.
		 * 
		 */
		function listData():void;
		
		/** List the experiments that are present in the store and
		 *  which are realizations of the given model.  Returns
		 *  after starting the load and dispatches a DataStoreEvent
		 *  with type DataStoreEvent.LIST when loading is complete.
		 *  Otherwise dispatches a DataStoreEvent.ERROR event.
		 * 
		 *  @param model The model whose corresponding data items are returned
		 */
		function listDataForModel(model:KefedModel):void;
		
		/** Retrieve the experiment that matches the given UID.  Returns
		 *  after starting the retrieval and dispatches a DataStoreEvent
		 *  with type DataStoreEvent.RETRIEVE when loading is complete.
		 *  Otherwise dispatches a DataStoreEvent.ERROR event.
		 * 
		 * @param uid The UID of the experiment to load
		 * 
		 */
		function retrieveData(uid:String):void;
		
		/** Insert the experiment.  Assumes that the experiment doesn't
		 *  exist in the store.  Returns after starting the insertion and
		 *  dispatches a DataStoreEvent with type DataStoreEvent.INSERT
		 *  when insertion is complete.
		 *  Otherwise dispatches a DataStoreEvent.ERROR event.
		 * 
		 * @param experiment The experiment to save to the store
		 * 
		 */
		function insertData(experiment:KefedExperiment):void;
		
		/** Save the experiment.  Assumes that the experiment already
		 *  exists in the store.  Returns after starting the save and
		 *  dispatches a DataStoreEvent with type DataStoreEvent.SAVE
		 *  when saving is complete.
		 *  Otherwise dispatches a DataStoreEvent.ERROR event.
		 * 
		 * @param experiment The experiment to save to the store
		 * 
		 */
		function saveData(experiment:KefedExperiment):void;
		
		/** Delete the experiment that matches the given UID.  Returns
		 *  immediately and dispatches a DataStoreEvent
		 *  with type DataStoreEvent.DELETE upon successful completion.
		 *  Otherwise dispatches a DataStoreEvent.ERROR event.
		 * 
		 * @param uid The UID of the experiment to delete
		 * 
		 */
		function deleteData(uid:String):void;
		
	}
}