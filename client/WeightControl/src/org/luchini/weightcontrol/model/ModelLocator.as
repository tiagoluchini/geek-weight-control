package org.luchini.weightcontrol.model
{
	import org.luchini.weightcontrol.model.vo.Log;
	import org.luchini.weightcontrol.model.vo.Target;
	import org.luchini.weightcontrol.model.vo.User;
	
	[Bindable]
	public class ModelLocator implements com.adobe.cairngorm.model.ModelLocator
	{
		private static var myInstance:ModelLocator;	
		
		public var user:User;
		public var log:Log;
		public var target:Target;
		
		public static function getInstance():ModelLocator {
			if (myInstance == null) {
				myInstance = new ModelLocator();
			}
			return myInstance;
		}
		
		private function ModelLocator()
		{
			// Singleton
		}

	}
}