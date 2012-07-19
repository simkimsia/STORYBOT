/**
 * Created with IntelliJ IDEA.
 * User: wrobel221
 * Date: 09.07.12
 * Time: 11:35
 * To change this template use File | Settings | File Templates.
 */
package org.storybot.tests.mocks
{
	import org.storybot.service.helpers.IFileUploadClient;
	
	import flash.net.FileReference;
	import flash.net.URLRequest;
	
	import org.robotlegs.oil.async.Promise;
	
	public class MockSuccessFileUploadClient extends BaseMockFileUploadClient implements IFileUploadClient
	{
		public function upload(file:FileReference, request:URLRequest, uploadDataFieldName:String = "Filedata", testUpload:Boolean = false):Promise {
	
			filesUploaded.push(file);
			lastFileUploaded = file;
			lastUploadRequest = request;
	
			var promise:Promise = new Promise();
			promise.handleResult([]);//todo: something that you're expecting in the result
			return promise;
		}
	}
}
