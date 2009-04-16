package com.influire.dietmonitorclient.vo
{
	[RemoteClass(alias="com.influire.dietmonitor.vo.ChartDataVO")]
	public class ChartDataVO
	{
		public var id:int;
		public var date:Date;
		public var observed:Number;
		public var trend:Number;
		public var target:Number;
	}
}