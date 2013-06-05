/**
 *argo浮标基本信息类 
 */
package widgets.Products.ArgoSite
{
	[Bindable]
	[RemoteClass(alias="module.ArgoSiteAttribute")]
	public class ArgoSiteAttribute
	{
		//浮标编号
		public var ARGOS_PTT:String = "";
		//WMO编号
		public var PLATFORM_NUMBER:String = "";
		//投放国家
		public var PROJECT_NAME:String = "";
		//浮标类型
		public var PLATFORM_MODEL:String = "";
		//当前位置纬度
		public var LATITUDE:String = "";
		//当前位置经度
		public var LONGITUDE:String = "";
		//当前位置观测日期
		public var DATE:String = "";
		//浮标状态(Active or Inactive)
		public var STATE:String = "";
		//周期号(用来判断浮标的剖面是否更新)
		public var CYCLE_NUMBER:String = "";
	}
}