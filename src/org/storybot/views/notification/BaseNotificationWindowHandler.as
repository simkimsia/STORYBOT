/**
 * Created with IntelliJ IDEA.
 * User: wrobel221
 * Date: 17.08.12
 * Time: 10:16
 * To change this template use File | Settings | File Templates.
 */
package org.storybot.views.notification
{
import flash.display.NativeWindow;
import flash.events.Event;
import flash.events.FocusEvent;
import flash.events.MouseEvent;
import flash.events.NativeWindowBoundsEvent;
import flash.geom.Point;

import mx.events.AIREvent;

import spark.components.Button;
import spark.components.Window;

public class BaseNotificationWindowHandler
{
	protected var nativeWindow : NativeWindow;

	protected var initBtn : Button;

	protected var relativePos : Point;

	protected var align : String;

	private var notificationWindow : Window;

	public function BaseNotificationWindowHandler( nativeWindow : NativeWindow, initBtn : Button, relativePos : Point, align : String ) {
		this.nativeWindow = nativeWindow;
		this.initBtn = initBtn;
		this.relativePos = relativePos;
		this.align = align;
		initBtn.addEventListener( MouseEvent.CLICK, onInitBtnClick );
	}

	protected function onInitBtnClick( event : MouseEvent ) : void {
		openNotification();
	}

	private function openNotification() : void {
		if ( notificationWindow ) return;

		notificationWindow = getWindowInstance();
		notificationWindow.open();

		notificationWindow.addEventListener( Event.CLOSE, onWindowClose, false, 0, true );
		notificationWindow.addEventListener( AIREvent.WINDOW_DEACTIVATE, onWindowDeactivate, false, 0, true );

		nativeWindow.addEventListener( NativeWindowBoundsEvent.MOVE, onWindowMove, false, 0, true );
		updateNotificationPosition();
	}

	private function onWindowDeactivate( e : AIREvent ) : void {
		closeWindow();
	}

	private function onFocusOut( event : FocusEvent ) : void {
		closeWindow();
	}

	protected function getWindowInstance() : Window {
		throw new Error( 'You must extend BaseNotificationWindowHandler, implement this method, create a window instance' );
	}

	private function onWindowClose( e : Event ) : void {
		closeWindow();
	}

	private function closeWindow() : void {
		if ( !notificationWindow ) return;
		if ( !notificationWindow.closed )
			notificationWindow.close();
		notificationWindow.removeEventListener( Event.CLOSE, onWindowClose );
		notificationWindow.removeEventListener( AIREvent.WINDOW_DEACTIVATE, onWindowDeactivate);
		nativeWindow.removeEventListener( NativeWindowBoundsEvent.MOVE, onWindowMove );
		notificationWindow = null;
	}

	private function onWindowMove( e : NativeWindowBoundsEvent ) : void {
		updateNotificationPosition();
	}

	private function updateNotificationPosition() : void {
		var relativePos2 : Point = getAlignRelativePos( notificationWindow );
		var targetPosition : Point = new Point( nativeWindow.x + relativePos.x + relativePos2.x, nativeWindow.y + relativePos.y + relativePos2.y );
		notificationWindow.move( targetPosition.x, targetPosition.y );
	}

	private function getAlignRelativePos( notificationWindow : Window ) : Point {
		var p : Point = new Point();
		var split : Array = align.split( '' );
		for ( var i : int = 0; i < split.length; i++ ) {
			var s : String = split[i];
			switch ( s ) {
				case 'l':
					p.x = -notificationWindow.width;
					break;
				case 'r':
					p.x = 0;
					break;
				case 't':

					p.y = -notificationWindow.height;
					break;
				case 'b':
					p.y = 0;
					break;
			}
		}
		return p;
	}

	public function destroy() : void {

	}
}
}
