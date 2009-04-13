package org.luchini.weightcontrol.model
{
	import com.adobe.cairngorm.model.ModelLocator;
	
	import org.luchini.weightcontrol.model.vo.Log;
	import org.luchini.weightcontrol.model.vo.Target;
	import org.luchini.weightcontrol.model.vo.User;
	
	[Bindable]
	public class WeightControlModelLocator implements ModelLocator
	{
		private static var myInstance:WeightControlModelLocator;	
		
		public var user:User;
		public var log:Log;
		public var target:Target;
		
		public static function getInstance():WeightControlModelLocator {
			if (myInstance == null) {
				myInstance = new WeightControlModelLocator();
			}
			return myInstance;
		}
		
		public function WeightControlModelLocator()
		{
			// Singleton
			if (myInstance != null) {
				throw new Error("Singleton class. Please use getInstance().");
			}
		}

	}
}