package edu.isi.bmkeg.kefed.editor.elements
{
	import mx.collections.ArrayCollection;
	
	/** Interface for KefedObjects that support a notes.
	 * 
	 * @author University of Southern California
	 * @date $Date$
	 * @version $Revision$
	 *
	 */
	[Bindable]
	public interface IKefedAnnotatedObject
	{
		function get notes ():String;

		function set notes (newNotes:String):void;
	}
}
