/**
 * Created with IntelliJ IDEA.
 * User: simkimsia
 * Date: 09.07.12
 * Time: 11:35
 * To change this template use File | Settings | File Templates.
 */
package org.storybot.tests.mocks
{
	import flash.net.URLRequest;
	
	import org.robotlegs.oil.async.Promise;
	
	public class MockFailureLoginClient extends BaseMockRestClient
	{
		override public function post(url:String, params:Object = null):Promise 
		{	
			var promise:Promise = new Promise();
			promise.handleError('Error');
			return promise;
		}
	}
}
