package org.luchini.weightcontrol.controller.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import org.luchini.weightcontrol.controller.delegates.AccountDelegate;
	import org.luchini.weightcontrol.model.WeightControlModelLocator;

	public class UserLogoutCommand implements ICommand, IResponder
	{
		public function UserLogoutCommand()
		{
		}

		public function execute(event:CairngormEvent):void
		{
			var delegate:AccountDelegate = new AccountDelegate(this);
			delegate.user_logout();
		}
		
		public function result(data:Object):void
		{
			var model:WeightControlModelLocator = WeightControlModelLocator.getInstance();
			model.user = null;
			model.currentState = WeightControlModelLocator.STATE_LOGGED_OUT;
		}
		
		public function fault(info:Object):void
		{
			Alert.show("Server error!", "Error");
		}
		
	}
}