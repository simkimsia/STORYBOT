//------------------------------------------------------------------------------
//  Copyright (c) 2011 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted you to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package org.robotlegs.oil.rest
{
	import flash.utils.describeType;
	import mx.collections.ArrayCollection;

	public class JSONClient extends RestClientBase
	{

		/*============================================================================*/
		/* Constructor                                                                */
		/*============================================================================*/

		public function JSONClient(rootURL:String = "")
		{
			super(rootURL);
			addParamsTransform(paramsTransform);
			addResultProcessor(resultProcessor);
		}


		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/

		public function isPrimitive(source:*):Boolean
		{
			return source is String ||
				source is Number ||
				source is uint ||
				source is int ||
				source is Boolean ||
				source == null;
		}

		/*============================================================================*/
		/* Protected Functions                                                        */
		/*============================================================================*/

		protected function paramsTransform(source:*):Object
		{
			if (source == null)
				return null;

			if (isPrimitive(source))
				return { value: source };

			if (source is Array)
				return { value: JSON.stringify(source)};

			source = source.valueOf();

			var property:String;
			var value:Object;
			var classInfo:XML = describeType(source);
			if (classInfo.@name.toString() == "Object")
			{
				// Dynamic Object
				for (property in source)
				{
					value = source[property];
					if (value is Function || isPrimitive(value))
						continue;
					source[property] = JSON.stringify(value);
				}
			}
			else
			{
				// Sealed Object
				for each (var v:XML in classInfo..*.(
					name() == "variable" ||
					(
					name() == "accessor" &&
					attribute("access").charAt(0) == "r")
					))
				{
					if (v.metadata && v.metadata.(@name == "Transient").length() > 0)
						continue;

					property = v.@name.toString();
					value = source[v.@name];
					if (value is Function || isPrimitive(value))
						continue;
					source[property] = JSON.stringify(value);
				}

			}

			return source;
		}

		protected function resultProcessor(data:*, callback:Function):void // NO PMD
		{
			// Hack:
			if (data == '[]')
			{
				callback(null, new ArrayCollection());
				return;
			}
			if (data == '')
			{
				callback(null, null);
				return;
			}
			callback(null, JSON.parse(String(data)));
		}
	}
}
