package org.storybot.service.user
{
	import org.robotlegs.oil.async.Promise;
	import org.robotlegs.oil.rest.IRestClient;
	import org.storybot.Globals;
	import org.storybot.config.Configure;
	import org.storybot.config.Constants;
	import org.storybot.model.User;

	import org.storybot.service.BaseService;
	import org.storybot.service.user.IUserService;
	import org.storybot.service.user.events.PullUserErrorEvent;
	import org.storybot.service.user.events.PullUserResultEvent;
	import org.storybot.service.user.events.PushUserErrorEvent;
	import org.storybot.service.user.events.PushUserResultEvent;
	import org.storybot.service.user.helpers.IUserResultParser;
	
	public class StoryzerUserService extends BaseService implements IUserService
	{
		public static const USER_URI:String = Constants.HTTP + Constants.STORYZER_DOMAIN + '/oauth/token?grant_type=password';
		
		[Inject]
		public var restClient:IRestClient;
		
		private var _parser:IUserResultParser;
		
		private const STORYZER_USER_URL:String = "https://api.storyzer.localhost/me.json";
		
		public function pullLoggedInUser():Promise
		{
			// create AuthorizationHeader for the OAuth Access Token 
			this.createOAuthAuthorizationHeader();
			
			// now we send the request via RESTClientBase
			return restClient.get(STORYZER_USER_URL, null, headers)
				.addResultProcessor(onResultProcessor)
				.addResultHandler(onPullLoggedInUserResult)
				.addErrorHandler(onPullLoggedInUserError);
		}
		
		[Inject]
		public function set parser(value:IUserResultParser):void
		{
			_parser = value;
		}
		
		public function get parser():IUserResultParser 
		{
			return _parser;
		}
		
		private function onResultProcessor(data:*, handle:Function):void {
			/**
			 * expected data
			 * {
			 * 	"result":
			 * 		{"User":
			 * 			{
			 * 			"id":"1",
			 * 			"email":"kimsia@storyzer.com",
			 * 			"username":"kimsia",
			 * 			"group_id":"1","created":"2012-03-20 08:22:01",
			 * 			"modified":"2012-03-20 08:22:01",
			 * 			"url":{"controller":"users","action":"view","id":"1"}
			 * 			}
			 * 		},
			 * 	"error":null
			 * }
			 * 
			 **/
			
			var user:User = _parser.parseUserResults(String(data));
			
			Configure.write('User', user);
			
			//use handle to pass the results (null - for error param, loginResult for data param)
			handle(null, user);
			
		}
		
		private function onPullLoggedInUserResult(p:Promise):void {
			//here you can handle result
			eventDispatcher.dispatchEvent(new PullUserResultEvent(PullUserResultEvent.RECEIVED, p.result));
		}
		
		private function onPullLoggedInUserError(p:Promise):void {
			// we always get this message Error #2032: Stream Error. URL: http://storyzer.localhost/oauth/token.json
			//here you can handle error
			eventDispatcher.dispatchEvent(new PullUserErrorEvent(PullUserErrorEvent.FAILED, 'Pull Logged In User Stats Fail.'));
		}


	}
}