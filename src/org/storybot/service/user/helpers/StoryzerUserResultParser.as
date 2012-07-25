package org.storybot.service.user.helpers
{
	import org.storybot.model.User;
	
	public class StoryzerUserResultParser
	{
		public var lastKnownResults:String;
		
		public function parseUserResults(results:String):User
		{
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
			var jsonStringResults:Object = JSON.parse(results)
			
			var user:User = new User();
			
			// @TODO how to ensure that jsonStringResults have the following properties
			// defensive programming issues
			user.id			= jsonStringResults.result.User.id;
			user.username	= jsonStringResults.result.User.username;
			user.email		= jsonStringResults.result.User.email;
			
			return user;
		}

	}
}