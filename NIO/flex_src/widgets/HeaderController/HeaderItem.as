package widgets.HeaderController
{
	import flash.events.EventDispatcher;

	[Bindable]
	[RemoteClass(alias="widgets.HeaderController.HeaderItem")]
	
	public class HeaderItem extends EventDispatcher
	{
		public var id:Number; // id of the associated widget
		public var isGroup:Boolean;
		public var icon:Object;
		public var url:String; // url
		public var label:String;
		public var open:Boolean; // indicates whether the associated widget is open or closed
		public var headers:Array;
	}
}