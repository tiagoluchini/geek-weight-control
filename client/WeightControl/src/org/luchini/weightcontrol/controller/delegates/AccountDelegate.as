package org.luchini.weightcontrol.controller.delegates
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class AccountDelegate
	{
		private var responder:IResponder;
		private var service:Object;
		
		public function AccountDelegate(responder:IResponder)
		{
			this.service = ServiceLocator.getInstance().getRemoteObject("accountService");
			this.responder = responder;
		}
		
		public function login(login:String, password:String):void {
			var call:AsyncToken = this.service.login(login, password);
			call.addResponder(this.responder);
		}

	}
}