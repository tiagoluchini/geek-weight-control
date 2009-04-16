package com.influire.dietmonitorclient.logchart
{
	import flash.events.Event;
	import com.influire.dietmonitorclient.vo.FilterVO;

	public class FilterEvent extends Event
	{
		private var _filterVO:FilterVO;
		
		public function FilterEvent(type:String, filterVO:FilterVO) {
			super(type);
			_filterVO = filterVO;
		}
		
		public function get filterVO():FilterVO {
			return _filterVO;
		}
	}
}