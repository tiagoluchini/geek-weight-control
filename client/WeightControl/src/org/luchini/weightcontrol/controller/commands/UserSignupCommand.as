package org.luchini.weightcontrol.controller.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	import org.luchini.weightcontrol.controller.delegates.AccountDelegate;
	import org.luchini.weightcontrol.events.AccountEvent;

	public class UserSignupCommand implements ICommand, IResponder
	{
		public function UserSignupCommand()
		{
		}

		public function execute(event:CairngormEvent):void
		{
			var accountEvent:AccountEvent = event as AccountEvent;
			var delegate:AccountDelegate = new AccountDelegate(this);
			delegate.user_signup(accountEvent.signUpUser);
		}
		
		public function result(data:Object):void
		{
		}
		
		public function fault(info:Object):void
		{
		}
		
	}
}