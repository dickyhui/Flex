package widgets.Products.Typhoon
{
	[Bindable]
	[RemoteClass(alias="bean.TyphMonitor")]
	public class TyphMonitor
	{
		public var id:TyphMonitorId;
		public var lat:Number;
		public var lon:Number;
		public var windSpeed:Number;
		public var strength:String;
		public var radius7:Number;
		public var radius10:Number;
	}
}