package org.storybot.tests.cases.parsers
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import flexunit.framework.TestCase;
	
	import mockolate.errors.VerificationError;
	import mockolate.nice;
	import mockolate.prepare;
	import mockolate.runner.MockolateRunner;
	import mockolate.stub;
	import mockolate.verify;
	
	import org.flexunit.Assert;
	import org.flexunit.assertThat;
	import org.flexunit.async.Async;
	import org.hamcrest.collection.hasItem;
	import org.hamcrest.core.not;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.hasProperties;
	import org.hamcrest.object.notNullValue;
	import org.hamcrest.object.instanceOf;
	import org.storybot.service.user.IUserService;
	import org.storybot.service.user.helpers.IUserResultParser;
	import org.storybot.service.user.helpers.StoryzerUserResultParser;
	import org.storybot.tests.mocks.parser.MockUserResultParser;
	import org.swiftsuspenders.Injector;
	
	import org.storybot.model.User;
	
	MockolateRunner; 
	
	[RunWith("mockolate.runner.MockolateRunner")]
	public class TestStoryzerUserResultParser extends TestCase
	{
		public var parser:StoryzerUserResultParser;
		
		[Before]
		public function create():void
		{
			parser = new StoryzerUserResultParser();
		}
		
		[After]
		public function destroy():void
		{
			parser = null;	
		}
		
		[Test]
		public function parserCorrectlyParsing():void {
			var correctInput:String = '{"result":{"User":{"id":"1","email":"kimsia@storyzer.com","username":"kimsia","group_id":"1","created":"2012-03-20 08:22:01","modified":"2012-03-20 08:22:01","url":{"controller":"users","action":"view","id":"1"}}},"error":null}';
			
			var expectedOutput:User = new User(); 
			expectedOutput.id = 1;
			expectedOutput.email = "kimsia@storyzer.com";
			expectedOutput.username = "kimsia";
			
			var actualOutput:Object = parser.parseUserResults(correctInput);
			
			assertThat(actualOutput, hasProperties(expectedOutput));
			assertThat(actualOutput, instanceOf(User));
			
		}
		
	}
}