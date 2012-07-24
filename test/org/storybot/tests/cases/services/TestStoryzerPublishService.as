package org.storybot.tests.cases.services
{
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
	import org.flexunit.assertThat;
	import org.flexunit.async.Async;
	
	import org.hamcrest.core.not;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.collection.hasItem;
	
	import org.storybot.events.PublishStoryEvent;
	
	import org.storybot.service.publish.IPublishService;
	import org.storybot.service.publish.StoryzerPublishService;
	import org.storybot.service.publish.events.PublishResultEvent;
	import org.storybot.service.publish.events.PublishErrorEvent;
	
	import org.storybot.service.publish.helpers.IPublishResultParser;
	import org.storybot.service.publish.helpers.StoryzerPublishResultParser;
	
	import org.storybot.tests.mocks.common.MockEventDispatcher;
	import org.storybot.tests.mocks.fileupload.MockFailureFileUploadClient;
	import org.storybot.tests.mocks.fileupload.MockSuccessFileUploadClient;
	import org.swiftsuspenders.Injector; 
	
	[RunWith("mockolate.runner.MockolateRunner")]
	public class TestStoryzerPublishService extends TestCase
	{
	
		private var service:StoryzerPublishService;
		private var mockEventDispatcher:MockEventDispatcher;
		
		[Mock] 
		public var mockStoryFile:File;
		
		[Before]
		public function create():void
		{
			service = new StoryzerPublishService();
			mockEventDispatcher = new MockEventDispatcher();
			
			service.eventDispatcher = mockEventDispatcher;
			
		}
		
		[Test]
		public function publishStory_successfulUpload_fileUploadClientReceivedFile():void {
			var fileUploadClient:MockSuccessFileUploadClient = new MockSuccessFileUploadClient();
			service.fileUploadClient = fileUploadClient;
			
			service.publishStory(mockStoryFile);
			assertThat(mockStoryFile, equalTo(fileUploadClient.lastFileUploaded));
		}
		
		[Test]
		public function publishStory_successfulUpload_dispatchedEventSuccess():void {
			service.fileUploadClient = new MockSuccessFileUploadClient();
			
			service.publishStory(mockStoryFile);
			assertThat(mockEventDispatcher.dispatchedEventTypes, hasItem(PublishResultEvent.RECEIVED));
		}
		
		[Test]
		public function publishStory_failedUpload_dispatchedEventFailed():void {
			service.fileUploadClient = new MockFailureFileUploadClient();
			
			service.publishStory(mockStoryFile);
			assertThat(mockEventDispatcher.dispatchedEventTypes, hasItem(PublishErrorEvent.FAILED));
		}
		
		[Test(async)]
		public function testSample():void {
			Async.proceedOnEvent(this, service.eventDispatcher, PublishResultEvent.RECEIVED, 2000);
			
			service.sampleMethod();
		}
		
		
	}
}