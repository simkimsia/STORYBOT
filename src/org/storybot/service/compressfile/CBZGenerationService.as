package org.storybot.service.compressfile
{
	import deng.fzip.FZip;
	
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	import org.robotlegs.mvcs.Actor;
	import org.storybot.collections.FileCollection;
	import org.storybot.events.FileCreatedEvent;
	import org.storybot.events.UnsuccessfulFileCreatedEvent;
	
	public class CBZGenerationService extends BaseGenerationService implements ICBZGenerationService
	{
		private var _zip:FZip;
		
		override public function generate(files:FileCollection, filename:String=null):void{
			_zip = new FZip();
			
			if (filename == null) {
				_newPath = (new Date()).milliseconds.toString() + ".cbz";	
			} else {
				_newPath = filename;
			}
			
			
			super.generate(files);
		}
		
		override protected function createPage(byteArray:ByteArray):void {
			_zip.addFile(_currentFile.name, byteArray);
			
			_destinationFile = File.applicationStorageDirectory.resolvePath(_newPath);
			var stream:FileStream = new FileStream();
			stream.open(_destinationFile, FileMode.WRITE);
			_zip.serialize(stream);
			//stream.addEventListener(Event.CLOSE, dispatchFileCreatedEvent);
			stream.close();
		}
		
		override protected function writeToFile():void{
			_zip.filesList = null;
			_zip.filesDict = null;
			dispatch(new FileCreatedEvent(FileCreatedEvent.FILE_CREATED, _destinationFile));
		}
		
	}
}