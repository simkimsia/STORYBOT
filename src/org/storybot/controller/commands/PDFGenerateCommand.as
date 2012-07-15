package org.storybot.controller.commands
{
	import org.storybot.events.FileDropEvent;
	import org.storybot.service.compressfile.PDFGenerationService;
	
	import org.robotlegs.mvcs.Command;
	
	public class PDFGenerateCommand extends Command
	{
		[Inject]		
		public var event:FileDropEvent;
		
		[Inject]
		public var service:PDFGenerationService;
		
		override public function execute():void {
			service.generate(event.files);
		}
	}
}