package org.storybot.skins.callout
{
	import spark.skins.mobile.CalloutSkin;
	
	public class GenreCalloutSkin extends CalloutSkin
	{
		public function GenreCalloutSkin()
		{
			super();
			
			contentBackgroundInsetClass = null;
			dropShadowVisible = false;
			useBackgroundGradient = false;
			contentCornerRadius = 3;         
			backgroundCornerRadius = 3;
			
			frameThickness = 0;
			borderThickness = 1;         
			borderColor = 0xDCDDDE; 
			
			arrowWidth = 8;
			arrowHeight = 9;
		}
		
		override protected function createChildren():void{
			arrow = new GenreCalloutArrow();
			arrow.id = "arrow";
			arrow.styleName = this;
			
			super.createChildren();
			
			addChild(arrow);
		}
	}
}