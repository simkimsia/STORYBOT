package org.storybot.tests.mocks.parser
{
	import org.storybot.service.login.helpers.ILoginResultParser;
	import org.storybot.model.vo.LoginData;

	public class MockLoginResultParser extends BaseMockResultParser implements ILoginResultParser
	{
		
		public function parseLoginResults(results:String):LoginData
		{
			lastKnownResults = results;
			return new LoginData();
		}
	}
}