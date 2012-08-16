/**
 * Created with IntelliJ IDEA.
 * User: wrobel221
 * Date: 09.07.12
 * Time: 11:45
 * To change this template use File | Settings | File Templates.
 */
package org.storybot.tests.mocks.fileupload
{
import flash.net.FileReference;
import flash.net.URLRequest;

	public class BaseMockFileUploadClient
	{
		public var lastFileUploaded:FileReference;
		public var lastUploadRequest:URLRequest;
		public var filesUploaded:Array = [];
	}
}
