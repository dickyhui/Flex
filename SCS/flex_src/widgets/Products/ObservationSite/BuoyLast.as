package widgets.Products.ObservationSite
{
	[Bindable]
	[RemoteClass(alias="bean.BuoyLast")]
	public class BuoyLast
	{
		public var id:BuoyLastId;
		public var tideHeig:Number;
		public var waveHeig:Number;
		public var waveDir:String;
		public var waveCycle:Number;
		public var windPower:Number;
		public var windDir:String;
		public var gust:Number;
		public var seaTemp:Number;
		public var atTemp:Number;
		public var atPress:Number;
	}
}