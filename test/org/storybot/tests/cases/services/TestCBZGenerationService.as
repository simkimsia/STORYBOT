package org.storybot.tests.cases.services
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;

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
	import org.hamcrest.object.isTrue;
	import org.hamcrest.object.isFalse;

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
			// ensure the test123 does not exist
			removeTest123();
		}
		
		[After]
		public function destroy():void
		{
			service = null;
			mockEventDispatcher = null;
			// ensure the test123 does not exist
			removeTest123();
		}
		
		private static function prepareFilesForZipping():FileCollection {
			var file1:File = createDummyFile('dummyFile1.png');
			var file2:File = createDummyFile('dummyFile2.png');
			var file3:File = createDummyFile('dummyFile3.png');

			var fileArray:Array = new Array();
			fileArray.push(file1);
			fileArray.push(file2);
			fileArray.push(file3);
			
			return new FileCollection(fileArray);
		}

		private static function createDummyFile( filePath : String ) : File {
			var file : File = File.applicationStorageDirectory.resolvePath(filePath);
			if(!file.exists) {
				var fs : FileStream = new FileStream();
				fs.open( file, FileMode.WRITE );
				fs.writeByte(1);
				fs.close();
			}
			return file;
		}
		
		private static function removeTest123():void {
			var file:File = File.applicationStorageDirectory.resolvePath('test123.cbz');
			if (file.exists) {
                file.deleteFile();
            }
		}
		
		[Test]
		public function generate_successful_dispatchedEventSuccess():void {
			var file:File = File.applicationStorageDirectory.resolvePath('test123.cbz');
			assertThat(file.exists, isFalse());
			
			var files:FileCollection = prepareFilesForZipping();
			
			service.generate(files, 'test123.cbz');
			
			assertThat(mockEventDispatcher.dispatchedEventTypes, hasItem(FileCreatedEvent.FILE_CREATED));
			
			assertThat(file.exists, isTrue());
			
		}

	}
}