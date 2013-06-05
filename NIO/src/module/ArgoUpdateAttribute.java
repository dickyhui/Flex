/**
 *浮标信息更新的信息表 
 */
package module;
public class ArgoUpdateAttribute
{
	//WMO编号
	public String PLATFORM_NUMBER = "";
	//当前位置纬度
	public String LATITUDE = "";
	//当前位置经度
	public String LONGITUDE = "";
	//当前位置观测日期
	public String DATE = "";
	//周期号(用来判断浮标的剖面是否更新)
	public String CYCLE_NUMBER = "";
}
