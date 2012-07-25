package org.storybot.service.user.helpers
{
	
	import org.storybot.model.User;
	
	public interface IUserResultParser
	{
		function parseUserResults(results:String):User;
	}
}