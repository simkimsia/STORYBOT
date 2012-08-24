/**
 * Created with IntelliJ IDEA.
 * User: simkimsia
 * Date: 24/8/12
 * Time: 3:43 PM
 * To change this template use File | Settings | File Templates.
 */
package org.storybot.controls.callouts {


import spark.components.Callout;

public class SelfCloseOnMouseUpHelper {
    private var _targetControl:Callout;
    public function SelfCloseOnMouseUpHelper(target:Callout) {
        this._targetControl = target;
    }
}
}
