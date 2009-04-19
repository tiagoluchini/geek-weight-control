package org.luchini.weightcontrol.controller.delegates
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;
	
	import org.luchini.weightcontrol.model.vo.User;
	
	public class AccountDelegate
	{
		private var responder:IResponder;
		private var service:RemoteObject;
		
		public function AccountDelegate(responder:IResponder)
		{
			this.service = ServiceLocator.getInstance().getRemoteObject("accountService");
			this.responder = responder;
		}
		
		public function user_login(login:String, password:String):void {
			ServiceLocator.getInstance().setRemoteCredentials(login, password);
			var call:AsyncToken = this.service.user_login();
			call.addResponder(this.responder);
		}
		
		public function user_logout():void {
			var call:AsyncToken = this.service.user_logout();
			call.addResponder(this.responder);
		}

		public function user_signup(signUpUser:Object):void {
			var call:AsyncToken = this.service.user_signup({user: signUpUser});
			call.addResponder(this.responder);
		}

	}
}