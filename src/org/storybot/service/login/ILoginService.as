package org.storybot.service.login
{
	import org.robotlegs.oil.async.Promise;
	
	import org.storybot.service.login.helpers.ILoginResultParser;
	
	import flash.events.IEventDispatcher;
	import flash.filesystem.File;
	
	public interface ILoginService 
	{
		// function inside the StoryzerLoginService
		function publishStory(file:File):Promise;
		
		function sampleMethod():void;
		
		// set the parser something??
		function set parser(value:ILoginResultParser):void;
	}
}