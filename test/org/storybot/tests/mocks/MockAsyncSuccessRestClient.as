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
	import org.robotlegs.oil.rest.IRestClient;

	public class MockAsyncSuccessRestClient implements IRestClient
	{
		private var _promise:Promise;
		
		public var rootURL:String;
		
		protected var paramTransforms:Array = [];
		
		protected var resultProcessors:Array = [];
		
		public var results:String;
		
		public function MockAsyncSuccessRestClient(results:String = "") 
		{
			this.results = results;
		}

		public function post(url:String, params:Object = null):Promise {
			rootURL = url;

			_promise = new Promise();
			setTimeout(onComplete, 1);
			return _promise;
		}

		private function onComplete():void {
			_promise.handleResult([]);
		}

		public function get(url:String, params:Object = null):Promise
		{
			rootURL = url;
			
			_promise = new Promise();
			setTimeout(onComplete, 1);
			return _promise;
		}
		
		public function put(url:String, params:Object = null):Promise
		{
			rootURL = url;
			
			_promise = new Promise();
			setTimeout(onComplete, 1);
			return _promise;
		}
		
		public function del(url:String, params:Object = null):Promise
		{
			rootURL = url;
			
			_promise = new Promise();
			setTimeout(onComplete, 1);
			return _promise;
		}
		
		public function addParamsTransform(transform:Function):IRestClient
		{
			paramTransforms.push(transform);
			return this;
		}
		
		public function addResultProcessor(processor:Function):IRestClient
		{
			resultProcessors.push(processor);
			return this;
		}

		
	}
}
