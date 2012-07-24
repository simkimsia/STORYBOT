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
	import org.storybot.service.login.ILoginService;
	import org.storybot.service.login.helpers.ILoginResultParser;
	import org.storybot.service.login.helpers.StoryzerLoginResultParser;
	import org.storybot.tests.mocks.parser.MockLoginResultParser;
	import org.swiftsuspenders.Injector;
	
	MockolateRunner; 
	
	[RunWith("mockolate.runner.MockolateRunner")]
	public class TestStoryzerLoginResultParser extends TestCase
	{
		public var parser:StoryzerLoginResultParser;
		
		[Before]
		public function create():void
		{
			parser = new StoryzerLoginResultParser();
		}
		
		[After]
		public function destroy():void
		{
			parser = null;	
		}
		
		[Test]
		public function parserCorrectlyParsing():void {
			var correctInput:String = '{"access_token":"0ee034ea293a35f887bb8c556b5dcc34fa1cbca9","expires_in":3600,"token_type":"bearer","scope":null,"refresh_token":"45d1faec9dfdf9fd94da1e2e72c56bce8cc34909"}';
			var expectedOutput:Object = {"access_token":"0ee034ea293a35f887bb8c556b5dcc34fa1cbca9","token_type":"bearer","scope":null,"refresh_token":"45d1faec9dfdf9fd94da1e2e72c56bce8cc34909"};
			
			var actualOutput:Object = parser.parseLoginResults(correctInput);
			
			assertThat(actualOutput, hasProperties(expectedOutput));
			
		}

	}
}