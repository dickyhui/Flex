package dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import bean.BuoyLast2;

// Generated 2013-1-31 22:24:10 by Hibernate Tools 3.4.0.CR1

/**
 * Home object for domain model class BuoyLast2.
 * @see bean.BuoyLast2
 * @author Hibernate Tools
 */
public class BuoyLast2Home extends HibernateDaoSupport {
	@SuppressWarnings("unchecked")
	public List<BuoyLast2> getLatest(String hymc)
	{
		List<BuoyLast2> result;
		try{
			String hql = "from BuoyLast2 t where t.id.name = ? and t.id.dateTime = " +
					"(select max(t.id.dateTime) from BuoyLast2 t where t.id.name = ?)";
			List<BuoyLast2> buoyList =  getHibernateTemplate().find(hql,new String[]{hymc,hymc});
			if(buoyList.size() == 1)
			{
				result = buoyList;
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
