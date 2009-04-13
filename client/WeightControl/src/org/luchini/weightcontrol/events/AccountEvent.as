package org.luchini.weightcontrol.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	public class AccountEvent extends CairngormEvent
	{
		public static var LOGIN:String = "LOGIN";
		
		public var login:String;
		public var password:String;
		
		public function AccountEvent(type:String)
		{
			super(type);
		}

	}
}