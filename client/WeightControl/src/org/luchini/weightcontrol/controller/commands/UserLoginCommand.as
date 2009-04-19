package org.luchini.weightcontrol.controller.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	
	import org.luchini.weightcontrol.controller.delegates.AccountDelegate;
	import org.luchini.weightcontrol.events.AccountEvent;
	import org.luchini.weightcontrol.model.WeightControlModelLocator;
	import org.luchini.weightcontrol.model.vo.User;
	
	public class UserLoginCommand implements IResponder, ICommand
	{
		public function UserLoginCommand()
		{
		}

		public function execute(event:CairngormEvent):void {
            var delegate:AccountDelegate = new AccountDelegate(this);
            var accountEvent:AccountEvent = event as AccountEvent;
            delegate.user_login(accountEvent.login, accountEvent.password);
        }
        
        public function result(event:Object):void {
        	var model:WeightControlModelLocator = WeightControlModelLocator.getInstance();
        	model.user = event.result as User;
        	model.currentState = WeightControlModelLocator.STATE_LOGGED_IN;
        } 
        
        public function fault(event:Object):void {
        	Alert.show((event as FaultEvent).fault.faultString, "Server Error!");
        }

	}
}