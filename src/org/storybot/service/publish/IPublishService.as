package org.storybot.service.publish
{
	
	import org.storybot.service.publish.helpers.IPublishResultParser;
	
	import flash.events.IEventDispatcher;
	import flash.filesystem.File;
	
	public interface IPublishService 
	{
		// function inside the StoryzerPublishService
		function publishStory(file:File):void;
		
		function sampleMethod():void;
		
		// set the parser something??
		function set parser(value:IPublishResultParser):void;
	}
}