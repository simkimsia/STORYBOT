package org.storybot.service.helpers
{
	public class StoryzerPublishResultParser implements IPublishResultParser
	{
		
		
		import org.storybot.model.Story;
		
		
		public function parsePublishResults(results:Object):Array
		{
			var jsonStringResults:String = JSON.stringify(results)
			
			return new Array() ;
		}
	}
}