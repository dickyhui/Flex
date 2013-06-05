package dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import bean.TyphInfo;

// Generated 2012-12-25 21:13:37 by Hibernate Tools 3.4.0.CR1

/**
 * Home object for domain model class TyphInfo.
 * @see bean.TyphInfo
 * @author Hibernate Tools
 */
public class TyphInfoHome extends HibernateDaoSupport {
	//获取特点年份的所有台风
	@SuppressWarnings("unchecked")
	public List<TyphInfo> getTyphoonList(int Year)
	{
		List<TyphInfo> result;
		try{
			String hql = "from TyphInfo t where t.typhNum > "
					+ Year*100 
					+ " and t.typhNum < "
					+ (Year+1)*100 +
					" order by t.typhNum desc";
			List<TyphInfo> typhInfoList =  getHibernateTemplate().find(hql);//,new double[]{Year*100,(Year+1)*100}
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
	
	//获取正在进行的台风
	@SuppressWarnings("unchecked")
	public TyphInfo getTyphoonOnGoing()
	{
		TyphInfo result;
		try{
			String hql = "from TyphInfo t where t.isongoing = 1";
			List<TyphInfo> typhInfoList =  getHibernateTemplate().find(hql);//,new double[]{Year*100,(Year+1)*100}
			if(typhInfoList.size() > 0)
			{
				result = typhInfoList.get(0);
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
