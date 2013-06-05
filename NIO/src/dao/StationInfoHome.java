package dao;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import bean.StationInfo;

import java.util.ArrayList;
import java.util.List;
// Generated 2013-4-1 20:56:46 by Hibernate Tools 3.4.0.CR1

/**
 * Home object for domain model class StationInfo.
 * @see bean.StationInfo
 * @author Hibernate Tools
 */
public class StationInfoHome  extends HibernateDaoSupport
{
	@SuppressWarnings("unchecked")
	public List<StationInfo> getStationData(String station,String fromDate)
	{
		List<StationInfo> stationInfoList = new ArrayList<StationInfo>();
		try{
			if(fromDate == "")//最新的预报
			{
				String hql = "from bean.StationInfo t where t.id.station = ? and t.id.fromdate = " +
						"(select max(t2.id.fromdate) from bean.StationInfo t2 where t2.id.station = ?) " +
						"order by t.id.currentdate asc";
				stationInfoList = getHibernateTemplate().find(hql,new String[]{station,station});
			}
			else//指定时间
			{
				String hql = "from bean.StationInfo t where t.id.station = ? and t.id.fromdate = ? order by t.id.currentdate asc";
				stationInfoList = getHibernateTemplate().find(hql,new String[]{station,fromDate});
			}
		}
		catch(Error e)
		{
			return null;
		}
		return stationInfoList;
	}
}
