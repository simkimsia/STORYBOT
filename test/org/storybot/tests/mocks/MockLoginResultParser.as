package org.storybot.tests.mocks
{
	import org.storybot.service.login.helpers.ILoginResultParser;

	public class MockLoginResultParser extends BaseMockResultParser implements ILoginResultParser
	{
		
		public function parseLoginResults(results:String):Object
		{
			lastKnownResults = results;
			return new Object;
		}
	}
}