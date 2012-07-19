package org.storybot.service.login
{
	import org.robotlegs.oil.async.Promise;
	
	import org.storybot.service.login.helpers.ILoginResultParser;
	
	import flash.events.IEventDispatcher;
	
	public interface ILoginService 
	{
		// function inside the StoryzerLoginService
		function login(params:Object):Promise;
		
		// set the parser something??
		function set parser(value:ILoginResultParser):void;
	}
}