package org.storybot.service.user
{
	import flash.events.IEventDispatcher;
	import flash.filesystem.File;
	
	import org.robotlegs.oil.async.Promise;
	import org.storybot.model.User;
	import org.storybot.service.user.helpers.IUserResultParser;
	
	public interface IUserService 
	{
		// function inside the StoryzerPublishService
		function pullLoggedInUser():Promise;
		
		//function pushLoggedInUser(user:User):Promise;
		
		// set the parser
		function set parser(value:IUserResultParser):void;
		
		function get parser():IUserResultParser;
	}
}