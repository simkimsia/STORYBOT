package org.storybot.controller.commands
{
	
	import org.storybot.events.FormSubmitEvent;
	import org.storybot.service.login.ILoginService;
	
	import org.robotlegs.mvcs.Command;

	public class StoryzerLoginCommand extends Command
	{
		[Inject]		
		public var event:FormSubmitEvent;
		
		[Inject]
		public var service:ILoginService;
		
		override public function execute():void {
			service.login(event.params);
			trace(event.params);
		}


	}
}