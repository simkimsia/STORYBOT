package org.storybot.tests.cases
{
	import org.storybot.events.PublishStoryEvent;
	import org.storybot.service.publish.IPublishService;
	import org.storybot.service.publish.StoryzerPublishService;
	import org.storybot.service.publish.events.PublishResultEvent;
	import org.storybot.service.publish.helpers.IPublishResultParser;
	import org.storybot.service.publish.helpers.StoryzerPublishResultParser;
	
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
	public class TestStoryzerPublishService extends TestCase
	{
		//private var _injector:Injector;
		
		//private var _service:IPublishService;
		private var service:StoryzerPublishService;
		private var serviceDispatcher:EventDispatcher = new EventDispatcher();
		
		//public var mockStoryFile:File;
		[Mock] public var mockStoryFile:File;
		
		//private static const CBZ_FILE:String = "test.cbz";
		private static const CBZ_FILE:String = "/Users/user/Desktop/mexxik/Documents/projects/skinning/Adobe-AIR-App-Skinning/test/org/storybot/tests/suites/StorybotTestSuite.as";
		
		public function TestStoryzerPublishService() {
			//_injector = new Injector();
			
			/*_injector.mapSingleton(EventDispatcher);
			_injector.mapSingletonOf(IPublishResultParser, StoryzerPublishResultParser);
			_injector.mapSingletonOf(IPublishService, StoryzerPublishService);
			
			_service = _injector.getInstance(IPublishService);*/
			
		}
		
		[Before]
		override public function setUp():void
		{
			serviceDispatcher = new EventDispatcher();
			service = new StoryzerPublishService();
			service.eventDispatcher = serviceDispatcher;
			
			//mockStoryFile = new File(CBZ_FILE);
			
			mockStoryFile = nice(File);
			
			stub(mockStoryFile).getter("name").returns(CBZ_FILE);
			// stubbing the mockStoryFile 
			//stub(mockStoryFile).getter("name").returns(CBZ_FILE);
			//stub(mockStoryFile).getter("size").returns(1);
		}
		
		[After]
		override public function tearDown():void
		{
			this.serviceDispatcher = null;
			this.service = null;
			
			//mockStoryFile = null;
		}
		
		[Test(async)]
		[Ignore]
		public function testPublishStory():void
		{
			this.serviceDispatcher.addEventListener( PublishStoryEvent.SERVER_CONFIRM_UPLOAD_COMPLETE, 
				Async.asyncHandler(this, handleStoryPublished, 8000, null, 
					handleServiceTimeout), false, 0, true);
			
			this.service.publishStory(mockStoryFile);
		}
		
		protected function handleServiceTimeout( object:Object ):void
		{
			Assert.fail('Pending Event Never Occurred');
		}
		
		protected function handleStoryPublished(event:PublishStoryEvent, object:Object):void
		{
			Assert.assertEquals("The story should be valid: ", 
				event.story.id > 0, true)	
		}
		
		[Test(async)]
		public function testSample():void {
			Async.proceedOnEvent(this, service.eventDispatcher, PublishResultEvent.RECEIVED, 2000);
			
			service.sampleMethod();
		}
		
		
	}
}