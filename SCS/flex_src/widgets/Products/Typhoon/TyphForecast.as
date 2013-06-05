package widgets.Products.Typhoon
{
	[Bindable]
	[RemoteClass(alias="bean.TyphForecast")]
	public class TyphForecast
	{
		public var id:TyphForecastId;
		public var lon:Number;
		public var lat:Number;
		public var zxfs:int;
		public var radius7:Number;
		public var radius10:Number;
		public var strength:String;
	}
}