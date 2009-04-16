package com.influire.dietmonitorclient.vo
{
	[RemoteClass(alias="com.influire.dietmonitor.vo.SummaryVO")]
	public class SummaryVO
	{
		public static const ENERGY_DEFICIT:int = 0;
		public static const ENERGY_EXCESS:int = 1;
		
		public static const WEIGHT_LOSS:int = 0;
		public static const WEIGHT_GAIN:int = 1;
		
		[Bindable]
		public var dailyEnergy:Number;
		[Bindable]
		public var dailyEnergyStatus:int;
		
		[Bindable]
		public var weeklyWeight:Number;
		[Bindable]
		public var weeklyWeightStatus:int;
		
		[Bindable]
		public var lastBMI:Number;
		[Bindable]
		public var bmiStatus:int;
		
		[Bindable]
		public var lastTrendWeight:Number;
	
		[Bindable]
		public var recommendedWeight:Number;

	}
}