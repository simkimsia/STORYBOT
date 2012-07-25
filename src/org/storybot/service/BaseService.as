package org.storybot.service
{
	import flash.net.URLRequestHeader;
	import org.robotlegs.mvcs.Actor;
	
	import org.storybot.model.vo.LoginData;
	import org.storybot.config.Configure;

	public class BaseService extends Actor
	{
		protected var headers:Array = [];
		
		protected function createOAuthAuthorizationHeader():URLRequestHeader {
			var oAuth:LoginData = Configure.read('OAuth');
			if (oAuth) {
				var authorizationHeader:URLRequestHeader = new URLRequestHeader("Authorization", 'Bearer ' + oAuth.access_token);
				headers.push(authorizationHeader);
				return authorizationHeader;
			}
			return null;
		}
	}
}