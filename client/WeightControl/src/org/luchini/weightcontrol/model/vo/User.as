package org.luchini.weightcontrol.model.vo
{
	import com.adobe.cairngorm.vo.IValueObject;
	
	[Bindable]
	[RemoteClass(alias="User")]
	public class User implements IValueObject
	{
		public var id:int;
		public var login:String;
		public var email:String;
		public var createdAt:Date;
		public var updatedAt:Date;
		
		public function User()
		{
		}
	}
}