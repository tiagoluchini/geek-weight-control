package org.luchini.weightcontrol.controller
{
	import com.adobe.cairngorm.control.FrontController;
	
	import org.luchini.weightcontrol.controller.commands.LoginCommand;
	import org.luchini.weightcontrol.events.AccountEvent;
	
	public class Controller extends FrontController
	{
		public function Controller()
		{
			initialiseCommands();
		}
		
		private function initialiseCommands():void {
			addCommand(AccountEvent.LOGIN, LoginCommand);
		}

	}
}