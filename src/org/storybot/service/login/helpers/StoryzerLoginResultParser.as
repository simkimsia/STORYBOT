package org.storybot.service.login.helpers
{
	
	public class StoryzerLoginResultParser implements ILoginResultParser
	{
		
		public var lastKnownResults:String;
		
		public function parseLoginResults(results:String):Object
		{
			var jsonStringResults:Object = JSON.parse(results)
			
			return jsonStringResults;
		}
	}
}