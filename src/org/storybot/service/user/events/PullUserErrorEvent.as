package org.storybot.service.user.events
{
	import flash.events.Event;
	
	public class PullUserErrorEvent extends Event
	{
		public static const FAILED:String = "pullUserFailed";
		
		private var _message:String;
		
		public function get message():String {
			return _message;
		}
		
		public function PullUserErrorEvent(type:String, message:String) {
			super(type);
			_message = message;
		}
		
		override public function clone():Event {
			return new PullUserErrorEvent(type, message);
		}

	}
}