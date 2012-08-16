/**
 * Created with IntelliJ IDEA.
 * User: wrobel221
 * Date: 09.07.12
 * Time: 11:27
 * To change this template use File | Settings | File Templates.
 */
package org.storybot.service.helpers
{
import flash.net.FileReference;
import flash.net.URLRequest;

import org.robotlegs.oil.async.Promise;

public interface IFileUploadClient
{
	function upload(file:FileReference, request:URLRequest, uploadDataFieldName:String = "Filedata", testUpload:Boolean = false):Promise
}
}
