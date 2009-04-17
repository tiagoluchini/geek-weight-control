package org.luchini.weightcontrol.controller
{
	import com.adobe.cairngorm.control.FrontController;
	
	import org.luchini.weightcontrol.controller.commands.UserLoginCommand;
	import org.luchini.weightcontrol.controller.commands.UserLogoutCommand;
	import org.luchini.weightcontrol.events.AccountEvent;
	
	public class Controller extends FrontController
	{
		public function Controller()
		{
			initialiseCommands();
		}
		
		private function initialiseCommands():void {
			addCommand(AccountEvent.USER_LOGIN, UserLoginCommand);
			addCommand(AccountEvent.USER_LOGOUT, UserLogoutCommand);
		}

	}
}