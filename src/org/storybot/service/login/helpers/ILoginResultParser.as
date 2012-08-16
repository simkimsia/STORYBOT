package org.storybot.service.login.helpers
{
	
	import org.storybot.model.vo.LoginData;
	
	public interface ILoginResultParser
	{
		function parseLoginResults(results:String):LoginData;
	}
}