package org.storybot.tests.cases.services
{
	import org.storybot.tests.mocks.common.MockEventDispatcher;
	
	public class TestStoryzerCBZGenerateService
	{
		private var service:CBZGenerationService;
		private var mockEventDispatcher:MockEventDispatcher;
		
		[Before]
		public function create():void
		{
			service = new StoryzerUserService();
			mockEventDispatcher = new MockEventDispatcher();
			mockUserResultParser = new MockUserResultParser();
			
			service.eventDispatcher = mockEventDispatcher;
			service.parser = mockUserResultParser;
			
		}
		
		[After]
		public function destroy():void
		{
			service = null;
			mockEventDispatcher = null;
			mockUserResultParser = null;
			
		}

	}
}