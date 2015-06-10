package edu.isi.bmkeg.kefed.component.view.elements
{
	import mx.collections.ArrayCollection;
	
	/** Interface for KefedObjects that support a notes.
	 * 
	 * @author University of Southern California
	 * @date $Date: 2010-12-14 18:39:04 -0800 (Tue, 14 Dec 2010) $
	 * @version $Revision: 1487 $
	 *
	 */
	[Bindable]
	public interface IKefedAnnotatedObject
	{
		function get notes ():String;

		function set notes (newNotes:String):void;
	}
}
