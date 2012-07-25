package org.storybot.service.user.events
{
	import flash.events.Event;
	
	public class PullUserResultEvent extends Event
	{
		public static const RECEIVED:String = "pullUserResultsReceived";
		
		private var _results:Array;
		public function get results():Array {
			return _results;
		}
		
		public function PullUserResultEvent(type:String, results:Array = null) {
			super(type, bubbles, cancelable);
			_results = results;
		}
		
		override public function clone():Event {
			return new PullUserResultEvent(type, results)
		}
	}
}