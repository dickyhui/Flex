package dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import bean.BuoyLast;

// Generated 2012-12-17 16:07:53 by Hibernate Tools 3.4.0.CR1



/**
 * Home object for domain model class BuoyLast.
 * @see bean.BuoyLast
 * @author Hibernate Tools
 */
public class BuoyLastHome extends HibernateDaoSupport {
	@SuppressWarnings("unchecked")
	public List<BuoyLast> getLatest(String hymc)
	{
		//List<Zfhy> result = new ArrayList<Zfhy>();
		List<BuoyLast> result;
		try{
			String hql = "from BuoyLast t where t.id.name = ? and t.id.dateTime = " +
					"(select max(t.id.dateTime) from BuoyLast t where t.id.name = ?)";
			List<BuoyLast> buoyList =  getHibernateTemplate().find(hql,new String[]{hymc,hymc});
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
