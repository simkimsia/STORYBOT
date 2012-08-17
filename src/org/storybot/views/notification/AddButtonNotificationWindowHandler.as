/**
 * Created with IntelliJ IDEA.
 * User: wrobel221
 * Date: 17.08.12
 * Time: 09:49
 * To change this template use File | Settings | File Templates.
 */
package org.storybot.views.notification
{
import flash.display.NativeWindow;
import flash.events.MouseEvent;
import flash.geom.Point;

import spark.components.Button;
import spark.components.Window;

public class AddButtonNotificationWindowHandler extends BaseNotificationWindowHandler
{
	override protected function getWindowInstance() : Window {
		var windowNotification : SampleWindowNotification = new SampleWindowNotification();
		windowNotification.handler = this;
		return windowNotification;
	}

	public function AddButtonNotificationWindowHandler( nativeWindow : NativeWindow, initBtn : Button, relativePos : Point, align : String ) {
		super( nativeWindow, initBtn, relativePos, align );
	}

	public function passParams( text : String ) : void {
		trace( 'notification resulted: ' + text );
		//todo: dispatch result
	}
}
}
