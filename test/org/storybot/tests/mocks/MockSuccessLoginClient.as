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
	
	public class MockSuccessLoginClient extends BaseMockRestClient 
	{
		override public function post(url:String, params:Object = null):Promise
		{
			rootURL = url;
			
			var promise:Promise = new Promise();
			promise.handleResult([]);//todo: something that you're expecting in the result
			return promise;
		}
		
	}
}
