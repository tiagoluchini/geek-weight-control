package org.luchini.weightcontrol.controller.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	import org.luchini.weightcontrol.controller.delegates.AccountDelegate;
	import org.luchini.weightcontrol.model.WeightControlModelLocator;
	import org.luchini.weightcontrol.model.vo.User;
	
	public class UserCommand implements IResponder, ICommand
	{
		public function UserCommand()
		{
		}

		public function execute(event:CairngormEvent):void {
            var delegate:AccountDelegate = new AccountDelegate(this);
            delegate.user();
        }
        
        public function result(event:Object):void {
        	var model:WeightControlModelLocator = WeightControlModelLocator.getInstance();
        	model.user = event.result as User;
        } 
        
        public function fault(event:Object):void {
        	Alert.show("Server error!", "Error");
        }

	}
}