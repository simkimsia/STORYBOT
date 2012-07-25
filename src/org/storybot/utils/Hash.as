package org.storybot.utils
{
	import flash.utils.Dictionary;
	
	// copy from cakephp the Hash class
	public class Hash
	{
		public static function get(data:*, path:String):* 
		{
			if (!data || !path) {
				return null;
			}
			
			// now we explode the path separated by . into an array
			var parts:Array = path.split('.');
			
			for each (var key:String in parts) {
				if (data.hasOwnProperty(key)) {
					data = data[key];	
				} else {
					return null;
				}
			}
			
			return data;
		}
		
		/**
		 * Remove data matching $path from the $data array.
		 * You can use `{n}` and `{s}` to remove multiple elements
		 * from $data.
		 *
		 * @param array data The data to operate on
		 * @param string path A path expression to use to remove.
		 * @return array The modified array.
		 */
		public static function remove(data:Dictionary, path:String):Dictionary {
			var tokens:Array = path.split('.');
			
			var noCurlyBraceInPath:Boolean = (path.indexOf('{') == -1);
			
			if (noCurlyBraceInPath) {
				return Hash._simpleOp('remove', data, tokens);
			}
			
			var token:String = tokens.shift();
			var nextPath:String = tokens.join('.');
			for (var k:Object in data) {
				var value:* = data[k];
				var key:* = k;
				
				var match:Boolean = Hash._matchToken(key, token);
				if (match && (value is Dictionary)) {
					data[k] = Hash.remove(value, nextPath);
				} else if (match) {
					delete data[key];
				}
			}
			return data;
		} 
		
		
		/**
		 * Insert $values into an array with the given $path. You can use
		 * `{n}` and `{s}` elements to insert $data multiple times.
		 *
		 * @param array $data The data to insert into.
		 * @param string $path The path to insert at.
		 * @param mixed $values The values to insert.
		 * @return array The data with $values inserted.
		 */
		public static function insert(data:Dictionary, path:String, values:* = null):Dictionary {
			var tokens:Array = path.split('.');
			var noCurlyBraceInPath:Boolean = (path.indexOf('{') == -1);
			
			if (noCurlyBraceInPath) {
				return Hash._simpleOp('insert', data, tokens, values);
			}
			
			var token:String = tokens.shift();
			var nextPath:String = tokens.join('.');
			for (var k:Object in data) {
				var value:* = data[k];
				var key:* = k;
				
				if (Hash._matchToken(key, token)) {
					data[k] = Hash.insert(value, nextPath, values);
				}
			}
			return data;
		}

		/**
		 * Check a key against a token.
		 *
		 * @param string $key The key in the array being searched.
		 * @param string $token The token being matched.
		 * @return boolean
		 */
		protected static function _matchToken(key:String, token:String):Boolean {
			if (token === '{n}') {
				return (!isNaN(Number(key))) ;
			}
			if (token === '{s}') {
				return (key is String);
			}
			
			if (!isNaN(Number(token))) {
				return (key == token.toString());
			}
			
			return (key == token);
		}

		
		/**
		 * Perform a simple insert/remove operation.
		 *
		 * @param string $op The operation to do.
		 * @param array $data The data to operate on.
		 * @param array $path The path to work on.
		 * @param mixed $values The values to insert when doing inserts.
		 * @return array $data.
		 */
		protected static function _simpleOp(op:String, data:Dictionary, path:Array, values:* = null):Dictionary 
		{
			var _list:Dictionary = data;
			
			var count:int = path.length;
			var last:int = count - 1;
			
			for (var k:Object in path) {
				var key:* = path[k];

				var keyIsNumeric:Boolean = (!isNaN(Number(key)));
				
				if (keyIsNumeric && Number(key) > 0 || key === '0') {
					key = Number(key);
				}
			
				if (op === 'insert') {
					
					if (k === last) {
						_list[key] = values;
						return data;
					}
					
					if (!_list.hasOwnProperty(key)) {
						_list[key] = new Dictionary();
					}
					
					_list = _list[key];
					if (!(_list is Dictionary)) {
						_list = new Dictionary();
					}
					
				} else if (op === 'remove') {
					if (k === last) {
						delete _list[key];
						return data;
					}
					if (!(_list.hasOwnProperty(key))) {
						return data;
					}
					_list = _list[key];
				}

			}
			
			return _list;
		}
		
		

	}
}