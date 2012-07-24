/**
 * Created with IntelliJ IDEA.
 * User: simkimsia
 * Date: 09.07.12
 * Time: 11:45
 * To change this template use File | Settings | File Templates.
 */
package org.storybot.tests.mocks.rest
{
	import org.robotlegs.oil.async.Promise;
	import org.robotlegs.oil.rest.IRestClient;
	
	
	
	public class MockFailureRestClient implements IRestClient
	{
		public var rootURL:String;
		
		protected var paramTransforms:Array = [];
		
		protected var resultProcessors:Array = [];

		public var results:String; // this is because we expect all service calls to return JSON strings
		
		public function MockFailureRestClient(results:String = ""):void 
		{
			this.results = results;
			
		}
		
		public function post(url:String, params:Object = null):Promise
		{
			rootURL = url;
			
			var promise:Promise = new Promise();
			promise.handleError('Error');
			return promise;
		}
		
		public function get(url:String, params:Object = null):Promise
		{
			rootURL = url;
			
			var promise:Promise = new Promise();
			promise.handleError('Error');
			return promise;
		}
		
		public function put(url:String, params:Object = null):Promise
		{
			rootURL = url;
			
			var promise:Promise = new Promise();
			promise.handleError('Error');
			return promise;
		}
		
		public function del(url:String, params:Object = null):Promise
		{
			rootURL = url;
			
			var promise:Promise = new Promise();
			promise.handleError('Error');
			return promise;
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
