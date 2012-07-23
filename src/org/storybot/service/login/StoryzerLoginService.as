package org.storybot.service.login
{
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	import mx.utils.Base64Encoder;
	
	import org.robotlegs.mvcs.Actor;
	import org.robotlegs.oil.async.Promise;
	import org.robotlegs.oil.rest.IRestClient;
	import org.storybot.Globals;
	import org.storybot.config.Configure;
	import org.storybot.config.Constants;
	import org.storybot.service.login.ILoginService;
	import org.storybot.service.login.events.LoginErrorEvent;
	import org.storybot.service.login.events.LoginResultEvent;
	import org.storybot.service.login.helpers.ILoginResultParser;
	
	public class StoryzerLoginService extends Actor implements ILoginService
	{
		
		public static const LOGIN_URI:String = Constants.HTTP + Constants.STORYZER_DOMAIN + '/oauth/token?grant_type=password';
		
		[Inject]
		public var restClient:IRestClient;
		
		private var _parser:ILoginResultParser;
		
		private const STORYZER_LOGIN_URL:String = "http://storyzer.localhost/oauth/token.json";

		public function login(params:Object):Promise
		{
			// prepare the params for OAuth Password token request
			prepareParams(params);
			
			// now we send the request via RESTClientBase
			return restClient.post(STORYZER_LOGIN_URL, params)
				.addResultProcessor(onResultProcessor)
				.addResultHandler(onLoginResult)
				.addErrorHandler(onLoginError);
		}
		
		[Inject]
		public function set parser(value:ILoginResultParser):void
		{
			_parser = value;
		}
		
		/**
		 * handler function on the result retrieved from the REST client post
		 **/
		private function onResultProcessor(result:*):void {
			//result will be string probably and here you can convert it to JSON
			var loginResult:Object = _parser.parseLoginResults(String(result));
			
		}
		
		private function onLoginResult(p:Promise):void {
			//here you can handle result
			eventDispatcher.dispatchEvent(new LoginResultEvent(LoginResultEvent.RECEIVED, p.result));
		}
		
		private function onLoginError(p:Promise):void {
			//here you can handle error
			eventDispatcher.dispatchEvent(new LoginErrorEvent(LoginErrorEvent.FAILED, p.error));
		}
		
		/**
		 * 
		 * prepare the parameters for the url request
		 * params is Object type, so this is pass by reference
		 * 
		 * */
		private function prepareParams(params:Object):void {
			
			// necessary for OAuth2.0 password
			params['grant_type'] = "password"; 
			params['client_id'] = Constants.CLIENT_ID;
			params['client_secret'] = Constants.CLIENT_SECRET;
			
		}
		
				
		//wrote this function
		private function handleFaultError( event:FaultEvent ):void
		{
			trace( "got you.!!! " + event.toString() );
			trace(event.message.body);
		}
		
		//wrote this function
		private function handleResult( event:ResultEvent ):void
		{
			trace( "got you.!!! " + event.toString() );
			trace(event.result);
		}
		
		//wrote this function
		private function handleError( event:IOErrorEvent ):void
		{
			trace( "got you.!!! " + event.toString() );
		}
		
		protected function handleResponse(evt:Event):void
		{
			/*
			var jsonresponse:Object = JSON.parse(_loader.data);
			
			
			Configure.write('access_token', jsonresponse.access_token);
			Configure.write('refresh_token', jsonresponse.refresh_token);
			//Globals.REFRESH_TOKEN = jsonresponse.refresh_token;
			trace(_loader.data);
			*/
		}
		
	}
}