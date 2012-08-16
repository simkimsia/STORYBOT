package org.storybot.service.publish.events
{
	import flash.events.Event;
	
	public class PublishResultEvent extends Event
	{
		public static const RECEIVED:String = "publishResultsReceived";
	
		private var _results:Array;
		public function get results():Array {
			return _results;
		}
	
		public function PublishResultEvent(type:String, results:Array = null) {
			super(type, bubbles, cancelable);
			_results = results;
		}
	
		override public function clone():Event {
			return new PublishResultEvent(type, results)
		}
	}
}