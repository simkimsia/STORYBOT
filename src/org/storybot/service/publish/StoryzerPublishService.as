package org.storybot.service.publish
{
	import org.storybot.Globals;
	import org.storybot.service.publish.events.PublishResultEvent;
	import org.storybot.service.publish.helpers.IPublishResultParser;
	
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.utils.ByteArray;
	
	import org.robotlegs.mvcs.Actor;
	
	public class StoryzerPublishService extends Actor implements IPublishService
	{
		
		private var _parser:IPublishResultParser;
		
		[Inject]
		public function set parser(value:IPublishResultParser):void
		{
			_parser = value;
		}

		
		private var _loader:URLLoader;
		private var _file:File;
		
		public function StoryzerPublishService()
		{
			_loader = new URLLoader();
			_file = new File();
		}
		
		private const STORYZER_PUBLISH_STORY_URL:String = "http://api.storyzer.localhost/stories/add";
		private const STORYZER_PUBLISH_ARTWORK_URL:String = "http://stage.storyzer.com/works/add";
		
		public function sampleMethod():void {
			dispatch(new PublishResultEvent(PublishResultEvent.SAMPLE));	
		}
		
		public function publishStory(file:File):void {
			// assign the file into private var _file
			_file = file;
			
			//var appendURLWToken:String = STORYZER_PUBLISH_STORY_URL + '?access_token=' + Globals.ACCESS_TOKEN;
			var appendURLWToken:String = STORYZER_PUBLISH_STORY_URL;
			
			var urlRequest:URLRequest = new URLRequest(appendURLWToken);
			
			trace(appendURLWToken);
			
			// set to method=POST
			urlRequest.method = URLRequestMethod.POST;
			
			var acceptHeader:URLRequestHeader = new URLRequestHeader("Accept", "application/json");
			urlRequest.requestHeaders.push(acceptHeader);
			var authorizationHeader:URLRequestHeader = new URLRequestHeader("Authorization", 'Bearer ' + Globals.ACCESS_TOKEN);
			urlRequest.requestHeaders.push(authorizationHeader);
			
			var params:URLVariables = new URLVariables();
			
			params['data[Story][title]'] = 'Title1';
			params['data[Story][description]'] = 'desc';
			params['data[Story][publisher]'] = '';
			params['data[Story][list_price]'] = '11.00';
			params['data[Story][currency]'] = 'SGD';
			
						
			params['data[StoriesInList][0][listId]'] = 1;
			
			// apparently Adobe AIR will send this as Submit Query, so we overwrite it
			params['data[Upload]'] = 'Publish Story';
			// Adobe AIR will also send data[Filename]
			
			urlRequest.data = params;
			
			addFileListeners();
			
			
			
			// now we upload the file and other POST data
			_file.upload(urlRequest, "data[StoryFile][0][filename]");
		}
		
		private function handleError(event:SecurityErrorEvent):void
		{
			removeLoaderListeners();
		}
		
		private function handleLoadComplete(event:Event):void
		{
			var data:Object = _loader.data;
			var results:Array = _parser.parsePublishResults(data);
			dispatch(new PublishResultEvent(PublishResultEvent.RECEIVED, results))
			removeLoaderListeners();
		}
		
		private function handleFileOpen(event:Event):void
		{
			// leave empty for time being first
		}
		
		private function handleFileUploadProgress(event:ProgressEvent):void
		{
			// leave empty for time being first
		}
		
		private function handleFileComplete(event:Event):void
		{
			// leave empty for time being first
		}
		
		private function handleUploadCompleteData(event:DataEvent):void
		{
			// leave empty for time being first
			trace("uploadCompleteData data: " + event.data);
		}
		
		private function handleFileUploadError(event:Event):void
		{
			// leave empty for time being first
		}
		
		private function handleHTTPResponse(event:HTTPStatusEvent):void
		{
			// leave empty for time being first
		}
		
		private function addFileListeners():void {
			_file.addEventListener(Event.OPEN, handleFileOpen);
			_file.addEventListener(ProgressEvent.PROGRESS, handleFileUploadProgress);
			_file.addEventListener(Event.COMPLETE, handleFileComplete);
			
			// uploadCompleteData:DataEvent - dispatched when data has been received from server after successful file upload
			_file.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA, handleUploadCompleteData); 
			
			// error related events
			_file.addEventListener(SecurityErrorEvent.SECURITY_ERROR, handleFileUploadError);
			_file.addEventListener(HTTPStatusEvent.HTTP_STATUS, handleFileUploadError);
			_file.addEventListener(IOErrorEvent.IO_ERROR, handleFileUploadError);
			
			_file.addEventListener(HTTPStatusEvent.HTTP_RESPONSE_STATUS, handleHTTPResponse);
			
		}
		
		private function addLoaderListeners():void
		{
			_loader.addEventListener(IOErrorEvent.IO_ERROR, handleError);
			_loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, handleError);
			_loader.addEventListener(Event.COMPLETE, handleLoadComplete);
			
		}
		
		private function removeLoaderListeners():void
		{
			_loader.removeEventListener(IOErrorEvent.IO_ERROR, handleError);
			_loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, handleError);
			_loader.removeEventListener(Event.COMPLETE, handleLoadComplete);
		}
		
		private function removeFileListeners():void
		{
			_file.removeEventListener(Event.OPEN, handleFileOpen);
			_file.removeEventListener(ProgressEvent.PROGRESS, handleFileUploadProgress);
			_file.removeEventListener(Event.COMPLETE, handleFileComplete);
			
			// uploadCompleteData:DataEvent - dispatched when data has been received from server after successful file upload
			_file.removeEventListener(DataEvent.UPLOAD_COMPLETE_DATA, handleUploadCompleteData); 
			
			// error related events
			_file.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, handleFileUploadError);
			_file.removeEventListener(HTTPStatusEvent.HTTP_STATUS, handleFileUploadError);
			_file.removeEventListener(IOErrorEvent.IO_ERROR, handleFileUploadError);
			
			_file.removeEventListener(HTTPStatusEvent.HTTP_RESPONSE_STATUS, handleHTTPResponse);
		}

	}
}