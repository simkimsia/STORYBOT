package org.storybot.service.publish
{
	import flash.filesystem.File;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	import org.robotlegs.mvcs.Actor;
	import org.robotlegs.oil.async.Promise;
	import org.storybot.Constants;
	import org.storybot.Globals;
	import org.storybot.service.helpers.IFileUploadClient;
	import org.storybot.service.publish.IPublishService;
	import org.storybot.service.publish.events.PublishErrorEvent;
	import org.storybot.service.publish.events.PublishResultEvent;
	import org.storybot.service.publish.helpers.IPublishResultParser;
	
	
	public class StoryzerPublishService extends Actor implements IPublishService
	{
		[Inject]
		public var fileUploadClient:IFileUploadClient;
		
		private var _parser:IPublishResultParser;
		
		private const STORYZER_PUBLISH_STORY_URL:String = "http://api.storyzer.localhost/stories/add";
		
		public function publishStory(file:File):Promise {
			
			//var appendURLWToken:String = STORYZER_PUBLISH_STORY_URL + '?access_token=' + Globals.ACCESS_TOKEN;
			var appendURLWToken:String = STORYZER_PUBLISH_STORY_URL;
			
			var urlRequest:URLRequest = prepareRequest(appendURLWToken);
			
			// now we upload the file and other POST data
			return fileUploadClient.upload(file, urlRequest, "data[StoryFile][0][filename]")
				.addResultProcessor(onResultProcessor)
				.addResultHandler(onStoryPublishResult)
				.addErrorHandler(onStoryPublishError);
		}
		
		public function sampleMethod():void {
			dispatch(new PublishResultEvent(PublishResultEvent.RECEIVED));	
		}
		
		[Inject]
		public function set parser(value:IPublishResultParser):void
		{
			_parser = value;
		}
		
		private function onResultProcessor(result:*):* {
			//result will be string probably and here you can convert it to JSON
			return JSON.parse(result);
		}
		
		private function onStoryPublishResult(p:Promise):void {
			//here you can handle result
			eventDispatcher.dispatchEvent(new PublishResultEvent(PublishResultEvent.RECEIVED, p.result));
		}
		
		private function onStoryPublishError(p:Promise):void {
			//here you can handle error
			eventDispatcher.dispatchEvent(new PublishErrorEvent(PublishErrorEvent.FAILED, p.error));
		}
		
		private function prepareRequest(appendURLWToken:String):URLRequest {
			var urlRequest:URLRequest = new URLRequest(appendURLWToken);
			
			// set to method=POST
			urlRequest.method = URLRequestMethod.POST;
			
			var acceptHeader:URLRequestHeader = new URLRequestHeader("Accept", "application/json");
			urlRequest.requestHeaders.push(acceptHeader);
			var authorizationHeader:URLRequestHeader = new URLRequestHeader("Authorization", 'Bearer '/* + Globals.ACCESS_TOKEN*/);
			urlRequest.requestHeaders.push(authorizationHeader);
			
			urlRequest.data = prepareParams();
			return urlRequest;
		}
		
		private function prepareParams():URLVariables {
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
			return params;
		}
	}
}