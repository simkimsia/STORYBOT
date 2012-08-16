package org.storybot.tests.mocks.parser
{
	import org.storybot.service.user.helpers.IUserResultParser;
	import org.storybot.model.User;
	
	public class MockUserResultParser extends BaseMockResultParser implements IUserResultParser
	{	
		public function parseUserResults(results:String):User
		{
			lastKnownResults = results;
			return new User();
		}
	}
}