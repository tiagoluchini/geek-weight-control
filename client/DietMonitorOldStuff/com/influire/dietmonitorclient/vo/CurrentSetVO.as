package com.influire.dietmonitorclient.vo
{
	[RemoteClass(alias="com.influire.dietmonitor.vo.CurrentSetVO")]
	public class CurrentSetVO
	{
		[Bindable]
		public var label:String;
		public var filterType:String;
		public var year:int;
		public var aux:int;
	}
}