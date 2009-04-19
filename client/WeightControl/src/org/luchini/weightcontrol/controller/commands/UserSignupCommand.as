package org.luchini.weightcontrol.controller.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	
	import org.luchini.weightcontrol.controller.delegates.AccountDelegate;
	import org.luchini.weightcontrol.events.AccountEvent;
	import org.luchini.weightcontrol.model.WeightControlModelLocator;
	import org.luchini.weightcontrol.model.vo.User;
	import org.luchini.weightcontrol.view.FaultHandler;

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
		
		public function result(event:Object):void
		{
			var model:WeightControlModelLocator = WeightControlModelLocator.getInstance();
        	model.user = event.result as User;
        	model.currentState = WeightControlModelLocator.STATE_LOGGED_IN;
		}
		
		public function fault(event:Object):void
		{
			FaultHandler.getInstance().handle(event as FaultEvent);
		}
		
	}
}