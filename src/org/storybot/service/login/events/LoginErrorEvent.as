package org.storybot.service.login.events
{
	import flash.events.Event;
	
	public class LoginErrorEvent extends Event
	{
		public static const FAILED:String = "loginFailed";
		
		private var _message:String;
		
		public function get message():String {
			return _message;
		}
		
		public function LoginErrorEvent(type:String, message:String) {
			super(type);
			_message = message;
		}
		
		override public function clone():Event {
			return new LoginErrorEvent(type, message);
		}
	}
}