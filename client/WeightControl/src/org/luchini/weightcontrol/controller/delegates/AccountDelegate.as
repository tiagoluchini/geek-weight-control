package org.luchini.weightcontrol.controller.delegates
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;
	
	public class AccountDelegate
	{
		private var responder:IResponder;
		private var service:RemoteObject;
		
		public function AccountDelegate(responder:IResponder)
		{
			this.service = ServiceLocator.getInstance().getRemoteObject("accountService");
			this.responder = responder;
		}
		
		public function login(login:String, password:String):void {
			var call:AsyncToken = this.service.login({login: login, password: password});
			call.addResponder(this.responder);
		}
		
		public function user():void {
			var call:AsyncToken = this.service.user();
			call.addResponder(this.responder);
		}

	}
}