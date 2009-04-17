package org.luchini.weightcontrol.controller.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import org.luchini.weightcontrol.controller.delegates.AccountDelegate;

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
		}
		
		public function fault(info:Object):void
		{
			Alert.show("Server error!", "Error");
		}
		
	}
}