package org.storybot.config
{
	import flash.utils.Dictionary;
	
	import org.storybot.utils.Hash;
	
	public class Configure
	{
		
		private static var _values:Dictionary = new Dictionary();
		
		/**
		 * Used to delete a variable from Configure.
		 *
		 * Usage:
		 * {{{
		 * Configure::delete('Name'); will delete the entire Configure::Name
		 * Configure::delete('Name.key'); will delete only the Configure::Name[key]
		 * }}}
		 *
		 * @param string variable the var to be deleted
		 * @return void
		 */
		public static function remove(variable:String = null):void {
			var keys:Array = variable.split('.');
			var last:* = keys.pop();
			Configure._values = Hash.remove(Configure._values, variable);
		}

		
		/**
		 * Used to read information stored in Configure.  Its not
		 * possible to store `null` values in Configure.
		 *
		 * Usage:
		 * {{{
		 * Configure.read('Name'); will return all values for Name
		 * Configure.read('Name.key'); will return only the value of Configure.Name[key]
		 * }}}
		 *
		 * @param string key Variable to obtain.  Use '.' to access array elements.
		 * @return mixed value stored in configure, or null.
		 */
		public static function read(key:String = null):* {
			if (key === null) {
				return Configure._values;
			}
			return Hash.get(Configure._values, key);
		}
		
		import flash.utils.Dictionary;
		
		/**
		 * Used to store a dynamic variable in Configure.
		 *
		 * Usage:
		 * {{{
		 * Configure::write('One.key1', 'value of the Configure::One[key1]');
		 * Configure::write(array('One.key1' => 'value of the Configure::One[key1]'));
		 * Configure::write('One', array(
		 *     'key1' => 'value of the Configure::One[key1]',
		 *     'key2' => 'value of the Configure::One[key2]'
		 * );
		 *
		 * Configure::write(array(
		 *     'One.key1' => 'value of the Configure::One[key1]',
		 *     'One.key2' => 'value of the Configure::One[key2]'
		 * ));
		 * }}}
		 *
		 * @link http://book.cakephp.org/2.0/en/development/configuration.html#Configure::write
		 * @param string $config Name of var to write
		 * @param mixed $value Value to set for var
		 * @return boolean True if write was successful
		 */
		public static function write(config:*, value:* = null):Boolean {
			var newDictionary:Dictionary = new Dictionary();
			
			if ((config is Dictionary)) {
				newDictionary = config;
			} else {
				newDictionary[config] = value;
			}
			
			for (var k:Object in newDictionary) {
				var value:* = newDictionary[k];
				var name:* = k;

				Configure._values = Hash.insert(Configure._values, name, value);
			}
			
			return true;
		}


	}
}