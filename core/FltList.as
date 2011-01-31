package flewt.core 
{
	/**
	 * ...
	 * @author ruffenman
	 */
	public class FltList
	{		
		public function FltList() 
		{
			_length = 0;
		}
		
		public function pushBack(object:*):void
		{
			//if there is a tail (at least one node)
			if (_tail)
			{
				//add new node after tail
				_tail.next = new FltListNode(object);
				_tail.next.prev = _tail;
			}
			//else there is no tail and the list is empty
			else
			{
				//create first node
				_head = _tail = new FltListNode(object);
			}
			
			//increase length by one
			_length++;
		}
		
		public function pushFront(object:*):void
		{
			//if there is a head (at least one node)
			if (_head)
			{
				//add new node before head
				_head.prev = new FltListNode(object);
				_head.prev.next = _head;
				_head = _head.prev;
			}
			//else there is no head and the list is empty
			else
			{
				//create first node
				_head = _tail = new FltListNode(object);
			}
			
			//increase length by one
			_length++;
		}
		
		public function popBack():*
		{
			var object:*;
			
			//if there is a tail (at least one object)
			if (_tail)
			{
				//remove node from list
				object = _tail._object;
				_tail = _tail._prev;
				_tail._next._object = null;
				_tail._next._prev = null;
				_tail._next = null;
			}
			else
			{
				throw new RangeError("Tried to pop an item from an empty list");
			}
			
			//decrement list length
			_length--;
			
			return object;
		}
		
		public function popFront():*
		{
			var object:*;
			
			//if there is a head (at least one object)
			if (_head)
			{
				//remove node from list
				object = _head._object;
				_head = _head._next;
				_head._prev._object = null;
				_tail._prev._next = null;
				_tail._prev = null;
			}
			else
			{
				throw new RangeError("Tried to pop an item from an empty list");
			}
			
			//decrement list length
			_length--;
			
			return object;
		}
		
		public function removeNode(node:FltListNode):void
		{
			
		}
		
		public function get back():*
		{
			if (_tail)
			{
				return _tail.object;
			}
			else
			{
				throw new RangeError("Tried to get an item from an empty list");
				return null;
			}
		}
		
		public function get front():*
		{
			if (_head)
			{
				return _head.object;
			}
			else
			{
				throw new RangeError("Tried to get an item from an empty list");
				return null;
			}
		}
		
		public function get head():FltListNode
		{
			return _head;
		}
		
		public function get tail():FltListNode
		{
			return _tail;
		}
		
		public function get length():int
		{
			return _length;
		}
		
		private var _head:FltListNode;
		private var _tail:FltListNode;
		private var _length:int;
	}

}