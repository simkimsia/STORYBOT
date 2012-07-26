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
	import org.hamcrest.collection.hasItem;
	import org.hamcrest.core.not;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.notNullValue;
	import org.storybot.collections.FileCollection;
	import org.storybot.events.FileCreatedEvent;
	import org.storybot.service.compressfile.CBZGenerationService;
	import org.storybot.service.compressfile.ICBZGenerationService;
	import org.storybot.tests.mocks.common.MockEventDispatcher;
	
	public class TestCBZGenerationService
	{
		private var service:CBZGenerationService;
		private var mockEventDispatcher:MockEventDispatcher;
		
		[Before]
		public function create():void
		{
			service = new CBZGenerationService();
			mockEventDispatcher = new MockEventDispatcher();
			
			service.eventDispatcher = mockEventDispatcher;
		}
		
		[After]
		public function destroy():void
		{
			service = null;
			mockEventDispatcher = null;
		}
		
		[Test]
		public function generate_successful_dispatchedEventSuccess():void {
			
			var file1:File = new File('../../mocks/compressfile/files/page01.png');
			var file2:File = new File('../../mocks/compressfile/files/page02.png');
			var file3:File = new File('../../mocks/compressfile/files/page03.png');
			
			var fileArray:Array  = new Array();
			fileArray.push(file1);
			fileArray.push(file2);
			fileArray.push(file3);
			
			var files:FileCollection = new FileCollection(fileArray);
			service.generate(files, 'test123.cbz');
			
			assertThat(mockEventDispatcher.dispatchedEventTypes, hasItem(FileCreatedEvent.FILE_CREATED));
			
		}

	}
}