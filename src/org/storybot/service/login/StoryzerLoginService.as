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
		
		public function get parser():ILoginResultParser 
		{
			return _parser;
		}
		
		/**
		 * handler function on the result retrieved from the REST client post
		 **/
		private function onResultProcessor(data:*, handle:Function):void {
			// data expected is in the form of
			/**
			 *  {"access_token":"0ee034ea293a35f887bb8c556b5dcc34fa1cbca9",
				"expires_in":3600,"token_type":"bearer",
			 	"scope":null,
				"refresh_token":"45d1faec9dfdf9fd94da1e2e72c56bce8cc34909"}
			**/
			// here we catch for any possible error JSON strings
			// @TODO add in code to catch for errors
			// apparently no need... because for login any failure willl result in IoError
			// and this message Error #2032: Stream Error. URL: http://storyzer.localhost/oauth/token.json
			//loginResult goes from parser
			var loginResult:Object = _parser.parseLoginResults(String(data));
			//use handle to pass the results (null - for error param, loginResult for data param)
			handle(null, loginResult);
		}
		
		private function onLoginResult(p:Promise):void {
			//here you can handle result
			eventDispatcher.dispatchEvent(new LoginResultEvent(LoginResultEvent.RECEIVED, p.result));
		}
		
		private function onLoginError(p:Promise):void {
			
			//here you can handle error
			eventDispatcher.dispatchEvent(new LoginErrorEvent(LoginErrorEvent.FAILED, 'Login Fail.'));
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