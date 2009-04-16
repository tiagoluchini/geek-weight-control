package com.influire.dietmonitorclient.vo
{
	import mx.collections.ArrayCollection;
	
	[RemoteClass(alias="com.influire.dietmonitor.vo.LogChartDataVO")]
	public class LogChartDataVO
	{
		[Bindable]
		public var currentSetVO:CurrentSetVO;
		[Bindable]
		public var chartDataVOs:ArrayCollection;
		[Bindable]
		public var logVOs:ArrayCollection;
		[Bindable]
		public var summaryVO:SummaryVO;
	}
}