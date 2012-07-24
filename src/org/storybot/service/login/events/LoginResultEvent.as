package org.storybot.service.login.events
{
	import flash.events.Event;
	
	public class LoginResultEvent extends Event
	{
		public static const RECEIVED:String = "loginResultsReceived";
		
		
		private var _results:Object;
		public function get results():Object {
			return _results;
		}
		
		public function LoginResultEvent(type:String, results:Object = null) {
			super(type, bubbles, cancelable);
			_results = results;
		}
		
		override public function clone():Event {
			return new LoginResultEvent(type, results)
		}
	}
}