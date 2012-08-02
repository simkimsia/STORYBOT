package org.storybot
{
	import flash.events.Event;
	
	public class PageButtonImageEvent extends Event
	{
		public static const UP_IMAGE_CHANGED:String = "upImageChanged";
		public static const OVER_IMAGE_CHANGED:String = "overImageChanged";
		public static const DOWN_IMAGE_CHANGED:String = "downImageChanged";
		public static const DISABLED_IMAGE_CHANGED:String = "disabledImageChanged";
		
		public var imageSource:Object;
		
		public function PageButtonImageEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}