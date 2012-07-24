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
				
	}
}