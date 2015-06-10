// $Id: OntologyTermReference.as 1594 2011-02-02 01:06:35Z tom $
//
//  $Date: 2011-02-01 17:06:35 -0800 (Tue, 01 Feb 2011) $
//  $Revision: 1594 $
//

package edu.isi.bmkeg.kefed.component.view.ontology
{
	/** Class that holds references to an ontology term.  We store
	 *  the name of the ontology, the identifier of the term in that
	 *  ontology and a local name, which is the human-readable name
	 *  for the term.
	 * 
	 * TODO: Consider keeping a list of ontology term references
	 *  and returning one that matches the ontology + ontologyIdentifier
	 *  when a new one gets created.
	 * 
	 * @author University of Southern California
	 * @date $Date: 2011-02-01 17:06:35 -0800 (Tue, 01 Feb 2011) $
	 * @version $Revision: 1594 $
	 */
	public class OntologyTermReference {
		/** The id of the ontology in which the term is located. */
		public var ontologyId:String;
		/** The name of the ontology in which the term is located. */
		public var ontologyDisplayName:String;
		/** The unique identifier inside the ontology that identifies the term. */
		public var termId:String;
		/** The name used to display this term in a hopefully human-readable fashion. */
		public var displayName:String;
		/** The local name in the ontology for the term. [Optional] */
		public var localName:String;
//		/** A URL that can go to a display of the term in some external viewer. [Very Optional] */
//		public var termURL:String;
		/** A longer description of the meaning of the term. [Optional] */
		public var description:String;
		
		/** Create a new OntologyReference
		 * 
		 * @param ontId the ontology id
		 * @param ontName The ontology name
		 * @param id The term ID in the ontology
		 * @param displayName A human-readable string name. 
		 * @param localName A local ontology name. [Optional]
		 * @param description A more detailed description of the term [Optional]
		 * @return OntologyReference
		 */
		public static function create (ontId:String, ontName:String, id:String, displayName:String, localName:String=null, description:String=""):OntologyTermReference {
			var ref:OntologyTermReference = new OntologyTermReference();
			ref.ontologyId = ontId;
			ref.ontologyDisplayName = ontName;
			ref.termId = id;
			ref.displayName = displayName;
			ref.localName = localName;
			ref.description = description;
			return ref;			
		}
		
		public function toString():String {
			var ontologyPart:String = (ontologyDisplayName && ontologyDisplayName.length > 0) ? ontologyDisplayName : ontologyId;
			var termPart:String = (localName && localName.length > 0) ? localName : termId;
			return ontologyPart + ":" + termPart;
		}
		
		/** Test function to find if this term is a match
		 *  for the parameter.
		 * 
		 *  A bit tricky because it will accept either another
		 *  OntologyReference object or a String.  Ontology references
		 *  match if all fields match.  A string will be matched against
		 *  the ontologyIdentifier field.  This aids backward compatibility.
		 * 
		 * @param obj The object to match against
		 */
		public function matches(obj:Object):Boolean {
			if (obj is OntologyTermReference) {
				var other:OntologyTermReference = OntologyTermReference(obj);
				return other.termId == this.termId
				       && other.ontologyId == this.ontologyId
				       && other.localName == this.localName;
			} else if (obj is String) {
				return obj == this.termId;
			} else {
				return false;
			}
		}

	}
}