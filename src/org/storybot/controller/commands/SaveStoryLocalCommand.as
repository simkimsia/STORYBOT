package org.storybot.controller.commands
{
	import org.storybot.events.FileDropEvent;
	import org.storybot.service.StoryLocalPreparationService;
	
	import org.robotlegs.mvcs.Command;
	
	
	public class SaveStoryLocalCommand extends Command
	{
		
		[Inject]		
		public var event:FileDropEvent;
		
		[Inject]
		public var localStoryService:StoryLocalPreparationService;
		
		override public function execute():void {
			
			localStoryService.save(event.files, event.currentStoryFolder);	
			
			
		}
	}

}