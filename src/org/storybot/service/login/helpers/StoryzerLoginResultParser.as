package org.storybot.service.login.helpers
{
	
	public class StoryzerLoginResultParser implements ILoginResultParser
	{
		public function parseLoginResults(results:Object):Array
		{
			var jsonStringResults:String = JSON.stringify(results)
			
			return new Array() ;
		}
	}
}