/**
 * Created with IntelliJ IDEA.
 * User: simkimsia
 * Date: 24/8/12
 * Time: 3:43 PM
 * To change this template use File | Settings | File Templates.
 */
package org.storybot.controls.callouts {


import spark.components.Callout;
import flash.events.MouseEvent;

public class SelfCloseOnMouseUpHelper {
    private var _targetControl:Callout;
    public function SelfCloseOnMouseUpHelper(target:Callout) {
        this._targetControl = target;

        //listen for MouseUp events on the popup, and the stage
        _targetControl.addEventListener(MouseEvent.MOUSE_UP, handleMouseUp);
        _targetControl.stage.addEventListener(MouseEvent.MOUSE_UP, handleStageMouseUp);
    }

    private function handleMouseUp(e:MouseEvent):void {
        //catch any MouseUp events on the popup,
        //and prevent them from getting to the stage
        e.stopPropagation(); //don't let this event get to the stage
    }

    private function handleStageMouseUp(e:MouseEvent):void {
        //if the stage fires a MouseUp event, the mouse event
        //came from outside of the popup, so we can close it
        closePopup();
    }

    private function validate():Boolean {
        //add your validate code here
        return true;
    }

    private function closePopup():void {
        if ( validate() ) {
            //clean up event listeners, and close popup
            _targetControl.stage.removeEventListener(MouseEvent.MOUSE_UP, handleStageMouseUp);
            //PopUpManager.removePopUp(this);
            _targetControl.close();
        }
    }
}
}
