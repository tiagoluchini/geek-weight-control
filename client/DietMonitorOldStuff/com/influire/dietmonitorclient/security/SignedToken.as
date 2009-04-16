package com.influire.dietmonitorclient.security
{
	import com.influire.dietmonitorclient.vo.UserInfoVO;
	
	public class SignedToken
	{
		private static var myInstance:SignedToken = null;
		
		private var _userInfo:UserInfoVO;
		
		public static function getInstance():SignedToken {
			if (myInstance == null) {
				myInstance = new SignedToken();
			}
			return myInstance;
		}
		
		public function set userInfo(userInfo:UserInfoVO):void {
			this._userInfo = userInfo;
		}
		
		public function get userInfo():UserInfoVO {
			return this._userInfo;
		}
		
	}
}