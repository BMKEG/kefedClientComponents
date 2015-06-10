package edu.isi.bmkeg.kefed.editor.elements
{
	import mx.collections.ArrayCollection;
	
	/** Interface for KefedObjects that support a name, notes  and ontology terms.
	 * 
	 * @author University of Southern California
	 * @date $Date$
	 * @version $Revision$
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