package dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import bean.TyphInfo;
import bean.TyphMonitor;

// Generated 2012-12-25 21:13:37 by Hibernate Tools 3.4.0.CR1


/**
 * Home object for domain model class TyphMonitor.
 * @see bean.TyphMonitor
 * @author Hibernate Tools
 */
public class TyphMonitorHome  extends HibernateDaoSupport {
	@SuppressWarnings("unchecked")
	public List<TyphMonitor> getTyphoonRoute(int typhNum)
	{
		List<TyphMonitor> result;
		try{
			String hql = "from TyphMonitor t where t.id.typhNum = "
					+ typhNum
					+ " order by t.id.routeTime asc";
			List<TyphMonitor> typhInfoList =  getHibernateTemplate().find(hql);
			if(typhInfoList.size() > 0)
			{
				result = typhInfoList;
			}
			else
			{
				return null;
			}
		}
		catch(Error e){
			return null;
		}
		return result;
	}
}
