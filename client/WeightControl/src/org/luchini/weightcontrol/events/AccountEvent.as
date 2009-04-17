package org.luchini.weightcontrol.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	public class AccountEvent extends CairngormEvent
	{
		public static var USER_LOGIN:String = "USER_LOGIN";
		public static var USER_LOGOUT:String = "USER_LOGOUT";
		public static var USER_SIGNUP:String = "USER_SIGNUP";
		
		public var login:String;
		public var password:String;
		
		public function AccountEvent(type:String)
		{
			super(type);
		}

	}
}