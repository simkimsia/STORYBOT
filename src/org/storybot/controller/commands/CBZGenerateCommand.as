package org.storybot.controller.commands
{
	import org.storybot.events.FileDropEvent;
	import org.storybot.service.CBZGenerationService;
	
	import org.robotlegs.mvcs.Command;
	
	public class CBZGenerateCommand extends Command
	{
		[Inject]		
		public var event:FileDropEvent;
		
		[Inject]
		public var service:CBZGenerationService;
		
		override public function execute():void {
			service.generate(event.files);
		}
	}
}