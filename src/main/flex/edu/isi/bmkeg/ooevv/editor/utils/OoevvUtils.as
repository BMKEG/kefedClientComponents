package edu.isi.bmkeg.ooevv.editor.utils
{
	import edu.isi.bmkeg.ooevv.model.scale.*;

	public class OoevvUtils
	{
		public function OoevvUtils()
		{
		}
		
		public static function convertToMeasurementScale(s:String, o:Object):MeasurementScale {
						
			var ms:MeasurementScale = null;
		
			if( s == null ) {
				throw new Error("LoadMeasurementScale Failed");
			} else if( s == "BinaryScale") {
				var bs:BinaryScale = BinaryScale(o);
				ms = bs;
			} else if( s == "BinaryScaleWithNamedValues") {
				var bswnv:BinaryScaleWithNamedValues = BinaryScaleWithNamedValues(o);
				ms = bswnv;
			} else if( s ==	"DecimalScale") {
				var ds:DecimalScale = DecimalScale(o);
				ms = ds;
			} else if( s ==	"IntegerScale") {
				var isc:IntegerScale = IntegerScale(o);
				ms = isc;
			} else if( s ==	"HierarchicalScale") {
				var hts:HierarchicalScale = HierarchicalScale(o);
				ms = hts;
			} else if( s ==	"OrdinalScale") {
				var os:OrdinalScale = OrdinalScale(o);
				ms = os;
			} else if( s ==	"OrdinalScaleWithMaxRanks") {
				var oswr:OrdinalScaleWithMaxRank = OrdinalScaleWithMaxRank(o);
				ms = oswr;
			} else if( s == "OrdinalScaleWithNamedRanks") {
				var oswnr:OrdinalScaleWithNamedRanks = OrdinalScaleWithNamedRanks(o);
				ms = oswnr;
			} else if( s == "CompositeScale") {
				var mcs:CompositeScale = CompositeScale(o);
				ms = mcs;
			} else if( s == "NominalScale") {
				var ns:NominalScale = NominalScale(o);
				ms = ns;
			} else if( s == "NominalScaleWithAllowedTerms") {
				var nswat:NominalScaleWithAllowedTerms = NominalScaleWithAllowedTerms(o);
				ms = nswat;
			} else if( s == "RelativeTermScale") {
				var rts:RelativeTermScale = RelativeTermScale(o);
				ms = rts;
			}
			
			return  ms;
			
		}
		
	}
}