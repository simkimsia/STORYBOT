package org.storybot.tests.cases.services
{
	import org.storybot.service.login.ILoginService
	import org.storybot.service.login.StoryzerLoginService;
	import org.storybot.service.login.events.LoginResultEvent;
	import org.storybot.service.login.helpers.ILoginResultParser;
	import org.storybot.service.login.helpers.StoryzerLoginResultParser;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.filesystem.File;
	
	import flexunit.framework.TestCase;
	
	import mockolate.errors.VerificationError;
	import mockolate.nice;
	import mockolate.prepare;
	import mockolate.runner.MockolateRunner;
	import mockolate.stub;
	import mockolate.verify;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.hamcrest.core.not;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.hasPropertyWithValue;
	import org.hamcrest.object.nullValue;
	import org.swiftsuspenders.Injector;
	
	MockolateRunner; 
	
	[RunWith("mockolate.runner.MockolateRunner")]
	public class TestStoryzerLoginService extends TestCase
	{
		private var service:StoryzerLoginService;
		private var serviceDispatcher:EventDispatcher = new EventDispatcher();
		
		private var loginParams:Object = {}; // we expect a hashmap Object aka associative array
		
		
		public function TestStoryzerLoginService()
		{
		}
		
		[Before]
		override public function setUp():void
		{
			serviceDispatcher = new EventDispatcher();
			service = new StoryzerLoginService();
			service.eventDispatcher = serviceDispatcher;
			
			loginParams["username"] = 'kimsia@storyzer.com';
			loginParams['password'] = 'password';
		}
		
		[After]
		override public function tearDown():void
		{
			this.serviceDispatcher = null;
			this.service = null;
			this.loginParams = {};
		}
		
		[Test(async)]
		public function testStoryzerLogin():void
		{
			Async.proceedOnEvent(this, service.eventDispatcher, LoginResultEvent.RECEIVED, 2000);
			
			service.login(loginParams);
		}
		
	}
}