package org.luchini.weightcontrol.view
{
	import mx.controls.Alert;
	import mx.rpc.Fault;
	import mx.rpc.events.FaultEvent;
	
	public class FaultHandler
	{
		private static var myInstance:FaultHandler;

		public static var UNSPECIFIED:int       = 101;
		public static var INVALID_LOGIN:int     = 102;
  		public static var INCOMPLETE_DATA:int   = 103;
		
		public function FaultHandler()
		{
			// Singleton
			if (myInstance != null) {
				throw new Error("Singleton class. Please use getInstance().");
			}
		}

		public static function getInstance():FaultHandler {
			if (myInstance == null) {
				myInstance = new FaultHandler();
			}
			return myInstance;
		}

		public function handle(event:FaultEvent):void {
			var fault:Fault = event.fault;
			Alert.show(fault.faultString, "Fault!");
		}

	}
}