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
		
		public static var STATE_LOGGED_IN:String = "STATE_LOGGED_IN";
		public static var STATE_LOGGED_OUT:String = "STATE_LOGGED_OUT";
		
		public var currentState:String;
		
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
			this.currentState = WeightControlModelLocator.STATE_LOGGED_OUT; 
			// Singleton
			if (myInstance != null) {
				throw new Error("Singleton class. Please use getInstance().");
			}
		}

	}
}