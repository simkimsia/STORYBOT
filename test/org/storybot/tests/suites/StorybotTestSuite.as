package org.storybot.tests.suites
{
	import org.storybot.tests.cases.parsers.TestStoryzerLoginResultParser;
	import org.storybot.tests.cases.parsers.TestStoryzerUserResultParser;
	import org.storybot.tests.cases.services.TestStoryzerLoginService;
	import org.storybot.tests.cases.services.TestStoryzerPublishService;
	import org.storybot.tests.cases.services.TestStoryzerUserService;
	
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class StorybotTestSuite
	{
		public var testStoryzerPublishService:TestStoryzerPublishService;
		public var testStoryzerLoginService:TestStoryzerLoginService;
		public var testStoryzerLoginResultParser:TestStoryzerLoginResultParser;
		public var testStoryzerUserService:TestStoryzerUserService;
		public var testStoryzerUserResultParser:TestStoryzerUserResultParser;
	}
}