package org.storybot.service.login.helpers
{
	
	import org.storybot.model.vo.LoginData;
	
	public class StoryzerLoginResultParser implements ILoginResultParser
	{
		
		public var lastKnownResults:String;
		
		public function parseLoginResults(results:String):LoginData
		{
			/**
			 * should be parsing the string below
			 *  {"access_token":"0ee034ea293a35f887bb8c556b5dcc34fa1cbca9",
			 "expires_in":3600,"token_type":"bearer",
			 "scope":null,
			 "refresh_token":"45d1faec9dfdf9fd94da1e2e72c56bce8cc34909"}
			 **/
			var jsonStringResults:Object = JSON.parse(results)
				
			var loginData:LoginData = new LoginData();
			
			// @TODO how to ensure that jsonStringResults have the following properties
			// defensive programming issues
			loginData.access_token = jsonStringResults.access_token;
			loginData.refresh_token = jsonStringResults.refresh_token;
			loginData.expires_in = jsonStringResults.expires_in;
			loginData.scope = jsonStringResults.scope;
			loginData.token_type = jsonStringResults.token_type;
				
			return loginData;
		}
	}
}