/**
 * Created with IntelliJ IDEA.
 * User: simkimsia
 * Date: 09.07.12
 * Time: 11:35
 * To change this template use File | Settings | File Templates.
 */
package org.storybot.tests.mocks
{
	import flash.utils.setTimeout;

	import org.robotlegs.oil.async.Promise;

	public class MockAsyncSuccessLoginClient extends BaseMockRestClient
	{
		private var _promise:Promise;

		override public function post(url:String, params:Object = null):Promise {
			rootURL = url;

			_promise = new Promise();
			setTimeout(onComplete, 1);
			return _promise;
		}

		private function onComplete():void {
			_promise.handleResult([]);
		}

	}
}
