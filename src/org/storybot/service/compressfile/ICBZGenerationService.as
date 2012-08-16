package org.storybot.service.compressfile
{
	import org.storybot.collections.FileCollection;
	import flash.utils.ByteArray;

	public interface ICBZGenerationService
	{
		function generate(files:FileCollection, filename:String=null):void;
		
	}
}