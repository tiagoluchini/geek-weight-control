package com.influire.dietmonitorclient.vo
{
	[Bindable]
	[RemoteClass(alias="com.influire.dietmonitor.vo.LogVO")]
	public class LogVO
	{
		public var id:int;
		public var date:Date;
		public var weight:Number;
		public var comments:String;
		public var trend:Number;
		public var variation:Number;
	}
}