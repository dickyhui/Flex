/**
 *浮标信息更新的信息表 
 */
package widgets.Products.ArgoSite
{
	[Bindable]
	[RemoteClass(alias="module.ArgoUpdateAttribute")]
	public class ArgoUpdateAttribute
	{
		//WMO编号
		public var PLATFORM_NUMBER:String = "";
		//当前位置纬度
		public var LATITUDE:String = "";
		//当前位置经度
		public var LONGITUDE:String = "";
		//当前位置观测日期
		public var DATE:String = "";
		//周期号(用来判断浮标的剖面是否更新)
		public var CYCLE_NUMBER:String = "";
	}
}