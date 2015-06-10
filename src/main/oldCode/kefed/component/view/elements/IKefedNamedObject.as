package edu.isi.bmkeg.kefed.component.view.elements
{
	import mx.collections.ArrayCollection;
	
	/** Interface for KefedObjects that support a name, notes  and ontology terms.
	 * 
	 * @author University of Southern California
	 * @date $Date: 2011-01-03 17:05:27 -0800 (Mon, 03 Jan 2011) $
	 * @version $Revision: 1524 $
	 *
	 */
	[Bindable]
	public interface IKefedNamedObject
	{
		function get nameValue ():String;

		function set nameValue (newName:String):void;
		
		function get ontologyIds ():ArrayCollection;
		
		// Do we want this to be set-able?
		// Perhaps we just need to be able to mutate the underlying Collection.
		function set ontologyIds (newIds:ArrayCollection):void;
	}
}