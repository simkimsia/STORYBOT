package org.storybot.service.publish.events
{
import flash.events.Event;

public class PublishErrorEvent extends Event
{
	public static const FAILED:String = "publishFailed";

	private var _message:String;

	public function get message():String {
		return _message;
	}

	public function PublishErrorEvent(type:String, message:String) {
		super(type);
		_message = message;
	}

	override public function clone():Event {
		return new PublishErrorEvent(type, message);
	}
}
}