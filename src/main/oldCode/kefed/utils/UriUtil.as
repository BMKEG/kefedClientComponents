// $Id: UriUtil.as 1594 2011-02-02 01:06:35Z tom $
package edu.isi.bmkeg.utils {
	/**  Collection of utility routines for working with URIs
	 *   including extracting parts of the URI.
	 * 
	 * @author University of Southern California
	 * @date $Date: 2011-02-01 17:06:35 -0800 (Tue, 01 Feb 2011) $
	 * @version $Revision: 1594 $
	 * 
	 */
	 public class UriUtil {
	 	/** Gets the name part of the URI. This is determined heuristically
		 *  by taking the fragment part of the URI if it exists.  Otherwise
		 *  the last path element will be taken.
		 * 
		 * @param uri The URI string.
		 * @return The name component of the URI.
		 */
		public static function getUriName (uri:String):String {
			var pos:int = getUriSplitPosition(uri);
			if (pos < 0) {
				return null;
			} else {
				return uri.substring(pos+1);
			}
		}
		
		/** Gets the prefix part of the URI. This is determined heuristically
		 *  by removing the fragment part of the URI if it exists.  Otherwise
		 *  the last path element will be removed.
		 * 
		 * @param uri The URI string.
		 * @return The part of the URI ahead of the name including the delimiter.
		 */
		public static function getUriPrefix (uri:String):String {
			var pos:int = getUriSplitPosition(uri);
			if (pos < 0) {
				return null;
			} else {
				return uri.substring(0,pos+1);
			}
		}
		
		/** Gets the head part of the URI. This is determined heuristically
		 *  by removing the fragment part and delimiter of the URI if it exists.
		 *  Otherwise the last path element and delimiter will be removed.
		 * 
		 * @param uri The URI string.
		 * @return The part of the URI ahead of the name without the delimiter.
		 */
		public static function getUriHead (uri:String):String {
			var pos:int = getUriSplitPosition(uri);
			if (pos < 0) {
				return null;
			} else {
				return uri.substring(0,pos);
			}
		}
		
		/** Helper function that locates the character that
		 *  is between the head and tail of a given URI that
		 *  conforms to standard naming conventions.
		 */
		private static function getUriSplitPosition(uri:String):int {
			for each (var delimiter:String in ["#","/"]) {
				var pos:int = uri.lastIndexOf(delimiter);
				if (pos >= 0) return pos;
			}
			return -1;
		}
	}
}