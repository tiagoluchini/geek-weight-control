package org.luchini.weightcontrol.model.vo
{
	import com.adobe.cairngorm.vo.IValueObject;
	
	[Bindable]
	[RemoteClass(Alias="Log")]
	public class Log implements IValueObject
	{
		public var id:int;
		public var date:Date;
		public var weight:Number;
		public var trend:Number;
		public var createdAt:Date;
		public var updatedAt:Date;
		public var obs:String;
		
		public function Log()
		{
		}

	}
}