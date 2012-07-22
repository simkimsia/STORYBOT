package org.storybot.tests.cases.services
{
	import org.storybot.service.login.ILoginService;
		
	import org.storybot.service.login.StoryzerLoginService;
	import org.storybot.service.login.events.LoginResultEvent;
	import org.storybot.service.login.events.LoginErrorEvent;
	
	import org.storybot.service.login.helpers.ILoginResultParser;
	import org.storybot.service.login.helpers.StoryzerLoginResultParser;
	
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
	
	import org.hamcrest.core.not;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.collection.hasItem;
	
	import org.storybot.tests.mocks.MockEventDispatcher;
	
	import org.swiftsuspenders.Injector;
	
	import org.storybot.tests.mocks.MockSuccessLoginClient;
	import org.storybot.tests.mocks.MockFailureLoginClient;
	
	MockolateRunner; 
	
	[RunWith("mockolate.runner.MockolateRunner")]
	public class TestStoryzerLoginService extends TestCase
	{
		private var service:StoryzerLoginService;
		private var mockEventDispatcher:MockEventDispatcher;
		
		[Mock] 
		public var loginParams:Object;// we expect a hashmap Object aka associative array
		
		[Before]
		public function create():void
		{
			service = new StoryzerLoginService();
			mockEventDispatcher = new MockEventDispatcher();
			
			service.eventDispatcher = mockEventDispatcher;
			
			loginParams = {};// expect hashmap object aka associative array
			
			loginParams["username"] = 'kimsia@storyzer.com';
			loginParams['password'] = 'password';
		}
		
		[After]
		public function destroy():void
		{
			
		}
		
		// we probably need 2 tests for testing the expected results from the login
		// 1 for successful
		// 1 for error 
		
		[Test]
		public function testStoryzerSuccessfulLoginDispatchSuccessEvent():void {
			var successRestClient:MockSuccessLoginClient = new MockSuccessLoginClient();
			service.restClient = successRestClient;
			
			service.login(loginParams);
			assertThat(mockEventDispatcher.dispatchedEventTypes, hasItem(LoginResultEvent.RECEIVED));
		}
		
		[Test]
		public function testStoryzerFailureLoginDispatchFailureEvent():void {
			var failureRestClient:MockFailureLoginClient = new MockFailureLoginClient();
			service.restClient = failureRestClient;
			
			service.login(loginParams);
			assertThat(mockEventDispatcher.dispatchedEventTypes, hasItem(LoginErrorEvent.FAILED));
		}
		
	}
}