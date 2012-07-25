package org.storybot.controller.commands
{
	
	import org.storybot.service.user.IUserService;
	
	import org.robotlegs.mvcs.Command;
	
	public class StoryzerPullUserStatsCommand extends Command
	{
		
		
		[Inject]
		public var service:IUserService;
		
		override public function execute():void {
			service.pullLoggedInUser();
		}
		
	}
}