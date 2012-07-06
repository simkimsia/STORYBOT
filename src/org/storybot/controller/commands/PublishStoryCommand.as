package org.storybot.controller.commands
{
	import org.storybot.events.FileCreatedEvent;
	import org.storybot.service.StoryzerPublishService;
	import org.storybot.service.IPublishService;
	
	import org.robotlegs.mvcs.Command;
	
	public class PublishStoryCommand extends Command
	{
		
		[Inject]		
		public var event:FileCreatedEvent;
		
		[Inject]
		public var service:IPublishService;
		
		override public function execute():void {			
			service.publishStory(event.file);
		}
	}
}