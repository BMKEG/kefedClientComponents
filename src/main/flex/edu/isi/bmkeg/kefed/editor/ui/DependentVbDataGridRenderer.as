package edu.isi.bmkeg.kefed.editor.ui
{
	import mx.controls.DataGrid;
	import mx.controls.dataGridClasses.DataGridItemRenderer;
	import mx.controls.listClasses.BaseListData;
	import mx.controls.dataGridClasses.DataGridColumn;


	import mx.collections.ArrayCollection;

	public class DependentVbDataGridRenderer extends DataGridItemRenderer
	{
		public function DependentVbDataGridRenderer()
		{
			super();
		}
		
		override public function validateProperties():void
		{

			var dg:DataGrid = DataGrid(this.listData.owner);
			var dp:ArrayCollection = ArrayCollection(dg.dataProvider);
			var rowZero:Object = dg.dataProvider[0];

			var col:DataGridColumn = dg.columns[ this.listData.columnIndex ];
				
			try {
								
				super.validateProperties();				
					
			} catch (err:Error) { 
			
				// code to react to the error, just skip the validation. 
				trace("Weird errors in data grid validation, skipping");
				
			} 
			
		}
		
	}

}