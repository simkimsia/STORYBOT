package org.storybot.service
{
	import flash.net.URLRequestHeader;
	import org.robotlegs.mvcs.Actor;
	
	import org.storybot.model.vo.LoginData;
	import org.storybot.config.Configure;

	public class BaseService extends Actor
	{
		protected var authorizationHeader:URLRequestHeader;
		
		protected var addOAuthAccessTokenToHeader():Boolean {
			var oAuth:LoginData = Configure.read('OAuth');
			if (oAuth) {
				authorizationHeader = new URLRequestHeader("Authorization", 'Bearer ' + oAuth.access_token);
				return true;
			}
			return false;
		}
	}
}