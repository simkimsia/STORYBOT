package org.storybot.controls.buttons
{
	import flash.events.Event;
	
	import org.storybot.PageButtonImageEvent;
	import org.storybot.skins.button.PageButtonSkin;
	
	import spark.components.Button;
	
	public class PageButton extends Button
	{
		private var _imageUp:Object;
		private var _imageOver:Object;
		private var _imageDown:Object;
		private var _imageDisabled:Object;
		
		public function PageButton()
		{
			super();
			useHandCursor = true;
			buttonMode = true;
			
			setStyle("skinClass", PageButtonSkin);
		}
		
		public function set imageUp(value:Object):void{
			_imageUp = value;
			
			var pbicEvent:PageButtonImageEvent = new PageButtonImageEvent(PageButtonImageEvent.UP_IMAGE_CHANGED);
			pbicEvent.imageSource = value;
			dispatchEvent(pbicEvent);
		}
		
		public function get imageUp():Object{
			return _imageUp;
		}
		
		public function set imageOver(value:Object):void{
			_imageOver = value;
			var pbicEvent:PageButtonImageEvent = new PageButtonImageEvent(PageButtonImageEvent.OVER_IMAGE_CHANGED);
			pbicEvent.imageSource = value;
			dispatchEvent(pbicEvent);
		}
		
		public function get imageOver():Object{
			return _imageOver;
		}
		
		public function set imageDown(value:Object):void{
			_imageDown = value;
			var pbicEvent:PageButtonImageEvent = new PageButtonImageEvent(PageButtonImageEvent.DOWN_IMAGE_CHANGED);
			pbicEvent.imageSource = value;
			dispatchEvent(pbicEvent);
		}
		
		public function get imageDown():Object{
			return _imageDown;
		}
		
		public function set imageDisabled(value:Object):void{
			_imageDisabled = value;
			var pbicEvent:PageButtonImageEvent = new PageButtonImageEvent(PageButtonImageEvent.DISABLED_IMAGE_CHANGED);
			pbicEvent.imageSource = value;
			dispatchEvent(pbicEvent);
		}
		
		public function get imageDisabled():Object{
			return _imageDisabled;
		}
	}
}