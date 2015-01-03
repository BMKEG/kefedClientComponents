package edu.isi.bmkeg.kefed.data.view.subElements {
		
	import edu.isi.bmkeg.ooevv.model.OoevvElement;
	
	import mx.containers.Box;
	import mx.controls.TextInput;
	import mx.events.FlexEvent;
	import mx.utils.StringUtil;


	/** UI Container base class for editing Kefed objects with names.
	 *
	 *  This is an abstract class for handling the editing of named
	 *  Kefed objects in a diagram.  This handles the management of
	 *  name changes from a TextInput component in a subclass.
	 * 
	 * @author University of Southern California
	 * @date $Date: 2010-12-14 17:33:48 -0800 (Tue, 14 Dec 2010) $
	 * @version $Revision: 1480 $
	 */

	public class NamedObjectTemplate extends Box {
		
		[Bindable]
		public var myObject:OoevvElement;
	
//		[Bindable]
//		public var diagram:DiagramView;
		
		/** Monotonic controls whether only monotonic changes are allowed
		 *  or whether all changes are allowed.  Monotonic changes only 
		 *  allow additional values to be added to the allowed values or
		 *  allowed units sections.  Renaming or removal of values are
		 *  prohibited when monotonic is <code>true</code>
		 */
		[Bindable]
		public var monotonic:Boolean = false;

		/** Change the name of the object in the corresponding diagram element
		 *  and also save the value in the appropriate slot of the object itself.
		 * 
		 *  This function should be specified as the event handler for the
		 *  "valueCommit" event on the TextInput component that is used to
		 *  display and show the name of the Kefed element.
		 * 
		 * @param event The event triggered by the name change.  Contains text element.
		 */
		protected function handleObjectNameChanged(event:FlexEvent):void {
	        var edit:TextInput = TextInput(event.currentTarget);
	        var name:String = StringUtil.trim(edit.text);        	
	        var uid:String = myObject.fullTermURI;        	
	      
	      	// Update displayed diagram name for this object 
			/*var dob:DiagramObject = DiagramObject(diagram.getElementByDataObjectId(uid));
	        if (dob.annotation)
	           	dob.annotation.text = name;
	         else
	           	diagram.createAnnotation(dob, name);
	         myObject.nameValue = name;*/
			
	    }

	}
}