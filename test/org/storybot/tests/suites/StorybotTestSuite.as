package org.storybot.tests.suites
{
	import org.storybot.tests.cases.TestStoryzerLoginService;
	import org.storybot.tests.cases.TestStoryzerPublishService;
	
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class StorybotTestSuite
	{
		public var testStoryzerPublishService:TestStoryzerPublishService;
		public var testStoryzerLoginService:TestStoryzerLoginService;
	}
}