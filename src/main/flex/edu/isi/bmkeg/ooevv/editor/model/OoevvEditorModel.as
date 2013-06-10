package edu.isi.bmkeg.ooevv.editor.model
{
		
	import edu.isi.bmkeg.ooevv.model.*;
	import edu.isi.bmkeg.ooevv.model.scale.*;
	
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	import mx.utils.UIDUtil;
	
	import org.robotlegs.mvcs.Actor;

	[Bindable]
	public class OoevvEditorModel extends Actor
	{
		
		public var oesList:ArrayCollection = new ArrayCollection();

		public var ooevvElementSet:OoevvElementSet;

		public var oeList:ArrayCollection = new ArrayCollection();
		
		public var el:OoevvElement;
				
		public var state:String;

		public var sync:Boolean;
				
	}

}