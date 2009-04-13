package org.luchini.weightcontrol.model.vo
{
	import com.adobe.cairngorm.vo.IValueObject;
	
	[Bindable]
	[RemoteClass(Alias="Target")]
	public class Target implements IValueObject
	{
		public var id:int;
		public var startingDate:Date;
		public var startingWeight:Number;
		public var targetDate:Date;
		public var targetWeight:Number;
		public var createdAt:Date;
		public var updatedAt:Date;
		
		public function Target()
		{
		}

	}
}