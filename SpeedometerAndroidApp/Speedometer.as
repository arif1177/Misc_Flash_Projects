///Author: Arif Khan

package
{
	//certificate password <dummy>. Personal note: Actual password is saved elsewhere.
	import flash.desktop.NativeApplication;
	import flash.desktop.SystemIdleMode;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.GeolocationEvent;
	import flash.events.KeyboardEvent;
	import flash.sensors.Geolocation;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	
	public class Speedometer extends Sprite
	{
		public  var speedometer :TextField; 
		private var geolocation     :Geolocation;
		
		public function Speedometer()
		{
			NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
			NativeApplication.nativeApplication.addEventListener( KeyboardEvent.KEY_DOWN, handleKeyDown );
			NativeApplication.nativeApplication.addEventListener( Event.DEACTIVATE, handleDeactivate );
			geolocation = new Geolocation(); 
			geolocation.setRequestedUpdateInterval( 1000 ); 
			geolocation.addEventListener( GeolocationEvent.UPDATE, handleGeolocationUpdate );	
		}
		
		private function handleKeyDown( e :KeyboardEvent ) :void
		{     
			switch( e.keyCode )     
			{         
				case Keyboard.BACK:
					NativeApplication.nativeApplication.exit();              
					break;                   
				case Keyboard.SEARCH:         
				case Keyboard.MENU:             
					e.preventDefault();             
					break;                   
			} 
		}
		private function handleDeactivate( e :Event ) :void
		{
			NativeApplication.nativeApplication.exit(); 
		}
		
		private function handleGeolocationUpdate( e :GeolocationEvent ) :void
		{ 
			speedometer.text = String( Math.round( e.speed ) ); 
		}
	}
}