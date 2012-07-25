package org.storybot.service.user
{
	import org.storybot.service.BaseService;
	
	import org.robotlegs.oil.async.Promise;
	import org.robotlegs.oil.rest.IRestClient;
	
	import org.storybot.config.Constants;
	import org.storybot.config.Configure;
	
	import org.storybot.Globals;
	
	import org.storybot.model.vo.LoginData;
	
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
		
		private const STORYZER_USER_URL:String = "https://api.storyzer.localhost/users?access_token";
		
		public function pullLoggedInUserSettings():Promise
		{
			var oAuth:LoginData = Configure.read('OAuth');
			oAuth.access_token
			
			// now we send the request via RESTClientBase
			return restClient.get(STORYZER_LOGIN_URL)
				.addResultProcessor(onResultProcessor)
				.addResultHandler(onLoginResult)
				.addErrorHandler(onLoginError);
		}

	}
}