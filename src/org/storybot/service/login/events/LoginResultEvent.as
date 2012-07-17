package org.storybot.service.login.events
{
	import flash.events.Event;
	
	public class LoginResultEvent extends Event
	{
		public static const RECEIVED:String = "loginResultsReceived";
		
		
		private var _results:Array;
		public function get results():Array {
			return _results;
		}
		
		public function LoginResultEvent(type:String, results:Array = null) {
			super(type, bubbles, cancelable);
			_results = results;
		}
		
		override public function clone():Event {
			return new LoginResultEvent(type, results)
		}
	}
}