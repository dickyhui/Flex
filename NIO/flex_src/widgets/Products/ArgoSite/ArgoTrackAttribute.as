/**
 * argo浮标运动轨迹的数据类
 */
package widgets.Products.ArgoSite
{
	[Bindable]
	[RemoteClass(alias="module.ArgoTrackAttribute")]
	public class ArgoTrackAttribute
	{
		//当前位置纬度
		public var LATITUDE:Number = 0;
		//当前位置经度
		public var LONGITUDE:Number = 0;
		//当前位置观测日期
		public var DATE:String = "";
	}
}