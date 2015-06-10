// $Id: SparqlUtil.as 1594 2011-02-02 01:06:35Z tom $
//
//  $Date: 2011-02-01 17:06:35 -0800 (Tue, 01 Feb 2011) $
//  $Revision: 1594 $
//
package edu.isi.bmkeg.utils.sparql {
	import mx.collections.ArrayCollection;
	import mx.controls.DataGrid;
	import mx.controls.Label;
	import mx.controls.dataGridClasses.DataGridColumn;
	
	public class SparqlUtil {
		namespace sparql = "http://www.w3.org/2005/sparql-results#";
	
		/** Set the SPARQL query results to display in a DataGrid.
		 *  Handles parsing the results, formatting the columns and creating
		 *  the array of objects with each object representing a tuple
		 *  of the query answer.
		 * 
		 *  As an additional convenience, a label with the number or results
		 *  can be updated.
		 * 
		 *  Returns no values, but does update the results DataGrid and the
		 *  optional label field.
		 * 
		 * @param xmlDoc The XML document with the PowerLoom query results
		 * @param results The DataGrid used to display the query results
		 * @param countLabel An label that can be set with a report of the number of results (optional)
		 */
		public static function displayQueryResults(xmlDoc:XML, results:DataGrid, countLabel:Label=null): void {
						
			var fields:Array = getQueryFields(xmlDoc);
			var nColumns:int = fields.length;
			var columnHeaders:Array = new Array(nColumns);
			for (var j:int = 0; j < nColumns; j++) {
				columnHeaders[j] = new DataGridColumn(fields[j]);
				columnHeaders[j].dataField = fields[j];
			}
			var resultsCollection:ArrayCollection = getResultsAsObjects(xmlDoc, fields);

			if (countLabel != null) {
				var nRows:int = resultsCollection.length;
				countLabel.text = nRows.toString() + (nRows == 1 ? " answer" : " answers");
			}
			results.columns = columnHeaders;
			results.dataProvider = resultsCollection;
		}
		
		public static function getQueryFields(xmlDoc:XML):Array {
			var nColumns:int = xmlDoc.sparql::head.sparql::variable.length();
			var fields:Array = new Array(nColumns);
			for (var j:int = 0; j < nColumns; j++) {
				fields[j] = xmlDoc.sparql::head.sparql::variable[j].@name.toString();
			}
			return fields;
		}
		
		public static function getResultsAsObjects(xmlDoc:XML, fields:Array=null):ArrayCollection {
			if (fields == null) {
				fields = getQueryFields(xmlDoc);
			}
			var nRows:int = xmlDoc.sparql::results.sparql::result.length();
			var resultsCollection:ArrayCollection = new ArrayCollection();
			for (var i:int = 0; i < nRows; i++) {
				resultsCollection.addItem(makeTupleObject(fields, xmlDoc.sparql::results.sparql::result[i]));
			}
			return resultsCollection;
		}
		
		private static function makeTupleObject(fields:Array, tuple:XML):Object {
			var tupleObject:Object = new Object();
			for (var i:int=0; i < fields.length; i++) {
				// The binding has a child element with the value.  There are different
				// kinds of bindings such as <uri> or <literal> with datatype, but we
				// don't care right here.  We just want to get the string value.
				var bindingNode:XMLList = tuple.sparql::binding.(@name == fields[i]);
				var l:int = bindingNode.length();
				if (bindingNode.length() > 0) {
					var o1:Object = bindingNode[0];
					var o2:Object = o1.children();
					var o3:Object = o2[0];
				}
				tupleObject[fields[i]] = (bindingNode.length()==0) ? null : bindingNode[0].children()[0].toString();
			}
			return tupleObject;
		}
	

	}
}