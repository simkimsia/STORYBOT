/**
 * Created with IntelliJ IDEA.
 * User: wrobel221
 * Date: 09.07.12
 * Time: 11:35
 * To change this template use File | Settings | File Templates.
 */
package org.storybot.tests.mocks.fileupload
{
import flash.net.FileReference;
import flash.net.URLRequest;

	import org.robotlegs.oil.async.Promise;
	
	import org.storybot.service.helpers.IFileUploadClient;
	
	public class MockFailureFileUploadClient extends BaseMockFileUploadClient implements IFileUploadClient
	{
		public function upload(file:FileReference, request:URLRequest, uploadDataFieldName:String = "Filedata", testUpload:Boolean = false):Promise {
	
			var promise:Promise = new Promise();
			promise.handleError('Error');
			return promise;
		}
	}
}
