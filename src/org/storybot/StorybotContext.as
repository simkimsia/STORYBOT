package org.storybot
{
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.oil.rest.IRestClient;
	import org.robotlegs.oil.rest.RestClientBase;
	import org.storybot.config.Constants;
	import org.storybot.controller.commands.StoryzerLoginCommand;
	import org.storybot.events.FormSubmitEvent;
	import org.storybot.service.login.ILoginService;
	import org.storybot.service.login.StoryzerLoginService;
	import org.storybot.service.login.helpers.ILoginResultParser;
	import org.storybot.service.login.helpers.StoryzerLoginResultParser;
	import org.storybot.service.publish.IPublishService;
	import org.storybot.service.publish.StoryzerPublishService;
	import org.storybot.service.publish.helpers.IPublishResultParser;
	import org.storybot.service.publish.helpers.StoryzerPublishResultParser;
	import org.storybot.view.LoginForm;
	import org.storybot.view.LoginFormMediator;

	public class StorybotContext extends Context
	{
		override public function startup():void
		{
			//mediatorMap.mapView(DropBox, DropBoxMediator);
			mediatorMap.mapView(LoginForm, LoginFormMediator);
			
			injector.mapSingletonOf(IPublishService, StoryzerPublishService);
			injector.mapSingletonOf(IPublishResultParser, StoryzerPublishResultParser);
			
			injector.mapSingletonOf(ILoginService, StoryzerLoginService);
			injector.mapSingletonOf(ILoginResultParser, StoryzerLoginResultParser);
			
			injector.mapSingletonOf(IRestClient, RestClientBase);
			
			injector.mapSingleton(Constants);
			
			//commandMap.mapEvent(FileDropEvent.FILE_DROP,PDFGenerateCommand);
			//commandMap.mapEvent(FileDropEvent.FILE_DROP, SaveStoryLocalCommand);
			//commandMap.mapEvent(FileDropEvent.FILE_DROP,CBZGenerateCommand);
			//commandMap.mapEvent(FileCreatedEvent.FILE_CREATED, PublishStoryCommand, FileCreatedEvent);
			commandMap.mapEvent(FormSubmitEvent.SUBMIT, StoryzerLoginCommand);
			
			super.startup();
		}

	}
}