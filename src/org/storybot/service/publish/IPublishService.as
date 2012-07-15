package org.storybot.service.publish
{
	import org.robotlegs.oil.async.Promise;
	
	import org.storybot.service.publish.helpers.IPublishResultParser;
	
	import flash.events.IEventDispatcher;
	import flash.filesystem.File;
	
	public interface IPublishService 
	{
		// function inside the StoryzerPublishService
		function publishStory(file:File):Promise;
		
		function sampleMethod():void;
		
		// set the parser something??
		function set parser(value:IPublishResultParser):void;
	}
}