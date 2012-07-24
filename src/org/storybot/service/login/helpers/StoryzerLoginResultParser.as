package org.storybot.service.login.helpers
{
	
	public class StoryzerLoginResultParser implements ILoginResultParser
	{
		
		public var lastKnownResults:String;
		
		public function parseLoginResults(results:String):Object
		{
			/**
			 * should be parsing the string below
			 *  {"access_token":"0ee034ea293a35f887bb8c556b5dcc34fa1cbca9",
			 "expires_in":3600,"token_type":"bearer",
			 "scope":null,
			 "refresh_token":"45d1faec9dfdf9fd94da1e2e72c56bce8cc34909"}
			 **/
			var jsonStringResults:Object = JSON.parse(results)
				
			return jsonStringResults;
		}
	}
}