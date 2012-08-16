package org.storybot.service.user.events
{
	import flash.events.Event;
	
	public class PushUserErrorEvent extends Event
	{
		public static const FAILED:String = "pushUserFailed";
		
		private var _message:String;
		
		public function get message():String {
			return _message;
		}
		
		public function PushUserErrorEvent(type:String, message:String) {
			super(type);
			_message = message;
		}
		
		override public function clone():Event {
			return new PushUserErrorEvent(type, message);
		}

	}
}