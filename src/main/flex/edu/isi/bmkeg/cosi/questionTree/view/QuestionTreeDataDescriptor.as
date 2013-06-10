package edu.isi.bmkeg.cosi.questionTree.view
{
	import edu.isi.bmkeg.cosi.model.*;
	
	import mx.collections.ArrayCollection;
	import mx.collections.CursorBookmark;
	import mx.collections.ICollectionView;
	import mx.collections.IViewCursor;
	import mx.controls.treeClasses.*;
	import mx.events.CollectionEvent;
	import mx.events.CollectionEventKind;
	
	public class QuestionTreeDataDescriptor implements ITreeDataDescriptor
	{
		
		// The getChildren method looks through the Investigations, 
		// Questions, KEfED models and Experiments and returns an appropriate 
		// serialization of the model.
		public function getChildren(node:Object,
									model:Object=null):ICollectionView
		{
			
			var children:ArrayCollection = new ArrayCollection();
			
			try {
			
				if (node is Investigation) {
					var invstgn:Investigation = Investigation(node); 
					if(invstgn.questions != null){
						for each(var q:Question in invstgn.questions) {
							// only add questions with no superQuestion at this stage 
							if( q.superQuestion == null ) {
								children.addItem(q);
							}
						}
					} 
				} else if(node is Question) {
					var q2:Question = Question(node); 
					if(q2.subQuestion != null){
						for each(var q3:Question in q2.subQuestion) {
							children.addItem(q3);
						}
					}
				}

			} catch (e:Error) {
				trace("[Descriptor] exception checking for getChildren");
			}
			
			if( children.length > 0 )
				return children;
			
			return null;
		}
		
		// The isBranch method simply returns true if the node contains any nodes
		public function isBranch(node:Object, model:Object=null):Boolean {
			try {
				if (node is Investigation) {
					var invstgn:Investigation = Investigation(node); 
					if(invstgn.questions != null){
						for each(var q:Question in invstgn.questions) {
							// only add questions with no superQuestion at this stage 
							if( q.superQuestion == null ) {
								return true;
							}
						}
					} 
				} else if(node is Question) {
					var q2:Question = Question(node); 
					if(q2.subQuestion != null){
						for each(var q3:Question in q2.subQuestion) {
							return true;
						}
					}
				}
			}
			catch (e:Error) {
				trace("[Descriptor] exception checking for isBranch");
			}
			return false;
		}
		
		// The hasChildren method Returns true if the
		// node actually has children. 
		public function hasChildren(node:Object, model:Object=null):Boolean {
			if (node == null) 
				return false;
			var children:ICollectionView = getChildren(node, model);
			try {
				if (children.length > 0)
					return true;
			}
			catch (e:Error) {
			}
			return false;
		}
		
		// The getData method simply returns the node as an Object.
		public function getData(node:Object, model:Object=null):Object {
			try {
				return node;
			}
			catch (e:Error) {
			}
			return null;
		}
		
		//
		// probably need to dispatch events to insert / update elements
		//
		public function addChildAt(parent:Object, 
								   child:Object, 
								   index:int, 
								   model:Object=null):Boolean {
			
			/*var event:CollectionEvent = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
			event.kind = CollectionEventKind.ADD;
			event.items = [child];
			event.location = index;
			if (!parent) {
				var iterator:IViewCursor = model.createCursor();
				iterator.seek(CursorBookmark.FIRST, index);
				iterator.insert(child);
			}
			else if (parent is Investigation) {
				var invstgn:Investigation = Investigation(parent); 
				var qtn:Question= Question(child); 
					
				invstgn.questions.addItemAt(qtn, index);
				if (model){
					model.dispatchEvent(event);
					model.itemUpdated(parent);
				}
				return true;
			}
			else if (parent is Question) {
				var qtn1:Question = Question(parent); 
				var qtn2:Question = Question(child); 
				
				qtn1.subQuestion.addItemAt(qtn2, index);
				qtn2.superQuestion = qtn1;
				if (model){
					model.dispatchEvent(event);
					model.itemUpdated(parent);
				}
				return true;
			}*/
			return false;
		}
		
		// The removeChildAt method does the following:
		// If the parent parameter is null or undefined,
		// removes the child at the specified index
		// in the model.
		// If the parent parameter is an Object and has a children field,
		// removes the child at the index parameter location in the parent.
		public function removeChildAt(parent:Object, child:Object, index:int, model:Object=null):Boolean
		{
			/*var event:CollectionEvent = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
			event.kind = CollectionEventKind.REMOVE;
			event.items = [child];
			event.location = index;
			
			//handle top level where there is no parent
			if (!parent) {
				
				var iterator:IViewCursor = model.createCursor();
				iterator.seek(CursorBookmark.FIRST, index);
				iterator.remove();
				if (model)
					model.dispatchEvent(event);
				return true;
			
			} else if (parent is Investigation) {
				
				var invstgn:Investigation = Investigation(parent); 
				var qtn:Question= Question(child); 
				
				if (parent.children != undefined) {
					parent.children.splice(index, 1);
					if (model) 
						model.dispatchEvent(event);
					return true;
				}
			}*/
			return false;
		}
	}
}