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

	import org.storybot.service.login.ILoginService;
	import org.storybot.service.login.StoryzerLoginService;
	import org.storybot.service.login.events.LoginErrorEvent;
	import org.storybot.service.login.events.LoginResultEvent;
	import org.storybot.service.login.helpers.ILoginResultParser;
	import org.storybot.service.login.helpers.StoryzerLoginResultParser;
import org.storybot.tests.mocks.MockAsyncSuccessLoginClient;
import org.storybot.tests.mocks.MockEventDispatcher;
	import org.storybot.tests.mocks.MockFailureLoginClient;
	import org.storybot.tests.mocks.MockLoginResultParser;
	import org.storybot.tests.mocks.MockSuccessLoginClient;
	import org.swiftsuspenders.Injector;
	
	MockolateRunner; 
	
	[RunWith("mockolate.runner.MockolateRunner")]
	public class TestStoryzerLoginService extends TestCase
	{
		private var service:StoryzerLoginService;
		private var mockEventDispatcher:MockEventDispatcher;
		private var mockLoginResultParser:MockLoginResultParser;
		
		[Mock] 
		public var loginParams:Object;// we expect a hashmap Object aka associative array
		
		[Before]
		public function create():void
		{
			service = new StoryzerLoginService();
			mockEventDispatcher = new MockEventDispatcher();
			mockLoginResultParser = new MockLoginResultParser();
			
			service.eventDispatcher = mockEventDispatcher;
			service.parser = mockLoginResultParser;
			
			loginParams = {};// expect hashmap object aka associative array
			
			loginParams["username"] = 'kimsia@storyzer.com';
			loginParams['password'] = 'password';
		}
		
		[After]
		public function destroy():void
		{
			service = null;
			mockEventDispatcher = null;
			mockLoginResultParser = null;
			
			loginParams = {};
		}
		
		// we probably need 2 tests for testing the expected results from the login
		// 1 for successful
		// 1 for error 
		
		[Test]
		public function login_successfulLogin_dispatchedEventSuccess():void {
			var successRestClient:MockSuccessLoginClient = new MockSuccessLoginClient();
			service.restClient = successRestClient;
			
			service.login(loginParams);
			assertThat(mockEventDispatcher.dispatchedEventTypes, hasItem(LoginResultEvent.RECEIVED));
			
		}
		
		[Test(async)]
		public function login_successfulUpload_parser():void {
			var successRestClient:MockAsyncSuccessLoginClient = new MockAsyncSuccessLoginClient();
			service.restClient = successRestClient;
			service.login(loginParams);
			Async.delayCall(this, onParserCheck, 2);
		}

		private function onParserCheck():void {
			assertThat(mockLoginResultParser.lastKnownResults, notNullValue());
		}
		
		[Test]
		public function login_failedLogin_dispatchedEventFailed():void {
			var failureRestClient:MockFailureLoginClient = new MockFailureLoginClient();
			service.restClient = failureRestClient;
			
			service.login(loginParams);
			assertThat(mockEventDispatcher.dispatchedEventTypes, hasItem(LoginErrorEvent.FAILED));
		}
		
	}
}