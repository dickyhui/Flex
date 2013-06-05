package widgets.Station
{
	[Bindable]
	[RemoteClass(alias="bean.StationInfo")]
	public class StationInfo
	{
		public var id:StationInfoId;
		public var qw:String;
		public var fx:String;
		public var fs:String;
		public var njd:String;
	}
}