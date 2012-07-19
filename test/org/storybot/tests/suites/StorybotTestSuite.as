package org.storybot.tests.suites
{
	import org.storybot.tests.cases.services.TestStoryzerLoginService;
	import org.storybot.tests.cases.services.TestStoryzerPublishService;
	
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class StorybotTestSuite
	{
		public var testStoryzerPublishService:TestStoryzerPublishService;
		public var testStoryzerLoginService:TestStoryzerLoginService;
	}
}