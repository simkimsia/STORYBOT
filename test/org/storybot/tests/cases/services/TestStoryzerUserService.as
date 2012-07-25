package org.storybot.tests.cases.services
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import flexunit.framework.TestCase;
	
	import mockolate.errors.VerificationError;
	import mockolate.nice;
	import mockolate.prepare;
	import mockolate.runner.MockolateRunner;
	import mockolate.stub;
	import mockolate.verify;
	
	import org.flexunit.Assert;
	import org.flexunit.assertThat;
	import org.flexunit.async.Async;
	import org.hamcrest.collection.hasItem;
	import org.hamcrest.core.not;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.notNullValue;
	
	import org.storybot.service.user.IUserService;
	import org.storybot.service.user.StoryzerUserService;
	import org.storybot.service.user.events.PullUserErrorEvent;
	import org.storybot.service.user.events.PullUserResultEvent;
	import org.storybot.service.user.helpers.IUserResultParser;
	import org.storybot.service.user.helpers.StoryzerUserResultParser;
	
	import org.storybot.tests.mocks.rest.MockAsyncSuccessRestClient;
	import org.storybot.tests.mocks.common.MockEventDispatcher;
	import org.storybot.tests.mocks.rest.MockFailureRestClient;
	import org.storybot.tests.mocks.parser.MockUserResultParser;
	import org.storybot.tests.mocks.rest.MockSuccessRestClient;
	import org.swiftsuspenders.Injector;
	
	MockolateRunner; 
	
	[RunWith("mockolate.runner.MockolateRunner")]
	public class TestStoryzerUserService extends TestCase
	{
		private var service:StoryzerUserService;
		private var mockEventDispatcher:MockEventDispatcher;
		private var mockUserResultParser:MockUserResultParser;
		
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
		
		// 3 tests
		// 1 for testing successful event dispatched
		// 1 for testing failure event dispatched
		// 1 for testing parser was correctly called for successful event
		
		[Test]
		public function pullUser_successful_dispatchedEventSuccess():void {
			var successRestClient:MockSuccessRestClient = new MockSuccessRestClient();
			service.restClient = successRestClient;
			
			service.pullLoggedInUser();
			assertThat(mockEventDispatcher.dispatchedEventTypes, hasItem(PullUserResultEvent.RECEIVED));
		}
		
		[Test(async)]
		public function pullUser_successful_parserActivated():void {
			var successRestClient:MockAsyncSuccessRestClient = new MockAsyncSuccessRestClient();
			service.restClient = successRestClient;
			service.pullLoggedInUser();
			Async.delayCall(this, onParserCheck, 2);
		}
		
		private function onParserCheck():void {
			assertThat(mockUserResultParser.lastKnownResults, notNullValue());
		}
		
		[Test]
		public function pullUser_failure_dispatchedEventFailure():void {
			var failureRestClient:MockFailureRestClient = new MockFailureRestClient();
			service.restClient = failureRestClient;
			
			service.pullLoggedInUser();
			assertThat(mockEventDispatcher.dispatchedEventTypes, hasItem(PullUserErrorEvent.FAILED));
		}

	}
}