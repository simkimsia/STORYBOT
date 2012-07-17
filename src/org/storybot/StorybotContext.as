package org.storybot
{
	import org.robotlegs.mvcs.Context;
	
	import org.storybot.config.Constants;
	
	import org.storybot.service.publish.StoryzerPublishService;
	import org.storybot.service.publish.IPublishService;
	import org.storybot.service.publish.helpers.StoryzerPublishResultParser;
	import org.storybot.service.publish.helpers.IPublishResultParser;
	
	import org.storybot.service.login.StoryzerLoginService;
	import org.storybot.service.login.ILoginService;
	import org.storybot.service.login.helpers.ILoginResultParser;
	import org.storybot.service.login.helpers.StoryzerLoginResultParser;

	
	public class StorybotContext extends Context
	{
		override public function startup():void
		{
			//mediatorMap.mapView(DropBox, DropBoxMediator);
			//mediatorMap.mapView(LoginForm, LoginFormMediator);
			
			injector.mapSingletonOf(IPublishService, StoryzerPublishService);
			injector.mapSingletonOf(IPublishResultParser, StoryzerPublishResultParser);
			
			injector.mapSingletonOf(ILoginService, StoryzerLoginService);
			injector.mapSingletonOf(ILoginResultParser, StoryzerLoginResultParser);
			
			injector.mapSingleton(Constants);
			
			//commandMap.mapEvent(FileDropEvent.FILE_DROP,PDFGenerateCommand);
			//commandMap.mapEvent(FileDropEvent.FILE_DROP, SaveStoryLocalCommand);
			//commandMap.mapEvent(FileDropEvent.FILE_DROP,CBZGenerateCommand);
			//commandMap.mapEvent(FileCreatedEvent.FILE_CREATED, PublishStoryCommand, FileCreatedEvent);
			//commandMap.mapEvent(FormSubmitEvent.SUBMIT, StoryzerLoginCommand);
			
			super.startup();
		}

	}
}