package edu.isi.bmkeg.ooevv.editor.model
{
	import edu.isi.bmkeg.pagedList.model.PagedListModel;
	
	public class OoevvElementPagedListModel extends PagedListModel
	{
		public static var LIST_ID:String = "ooevvElementList"
		
		public function OoevvElementPagedListModel()
		{
			super();
			this.id = LIST_ID;
		}
	}
}