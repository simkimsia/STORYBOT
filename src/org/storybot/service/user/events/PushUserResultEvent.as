package org.storybot.service.user.events
{
	import flash.events.Event;
	
	public class PushUserResultEvent extends Event
	{
		public static const RECEIVED:String = "pushUserResultsReceived";
		
		private var _results:Array;
		public function get results():Array {
			return _results;
		}
		
		public function PushUserResultEvent(type:String, results:Array = null) {
			super(type, bubbles, cancelable);
			_results = results;
		}
		
		override public function clone():Event {
			return new PushUserResultEvent(type, results)
		}
	}
}