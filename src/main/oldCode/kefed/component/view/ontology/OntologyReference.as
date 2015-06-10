// $Id: OntologyReference.as 1180 2010-09-22 17:19:40Z tom $
//
//  $Date: 2010-09-22 10:19:40 -0700 (Wed, 22 Sep 2010) $
//  $Revision: 1180 $
//

package edu.isi.bmkeg.kefed.component.view.ontology
{
	/** Class that holds references to an ontology term.  We store
	 *  the name of the ontology, the identifier of the term in that
	 *  ontology and a local name, which is the human-readable name
	 *  for the term.
	 */
	public class OntologyReference {
		public var ontology:String;
		public var ontologyIdentifier:String;
		public var ontologyLocalName:String;
		
		/** Create a new OntologyReference
		 * 
		 * @param ont The ontology name
		 * @param id The term ID in the ontology
		 * @param name A human-readable string name.  [Optional]
		 */
		public function OntologyReference(ont:String, id:String, name:String)
		{
			ontology = ont;
			ontologyIdentifier = id;
			ontologyLocalName = name;			
		}
		
		public function toString():String {
			return ontology + ":" + ontologyLocalName;
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
			if (obj is OntologyReference) {
				var other:OntologyReference = OntologyReference(obj);
				return other.ontologyIdentifier == this.ontologyIdentifier
				       && other.ontology == this.ontology
				       && other.ontologyLocalName == this.ontologyLocalName;
			} else if (obj is String) {
				return obj == this.ontologyIdentifier;
			} else {
				return false;
			}
		}

	}
}