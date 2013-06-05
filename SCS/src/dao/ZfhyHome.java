package dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import bean.Zfhy;

// Generated 2012-11-25 21:12:47 by Hibernate Tools 3.4.0.CR1
/**
 * Home object for domain model class Zfhy.
 * @see bean.Zfhy
 * @author Hibernate Tools
 */
public class ZfhyHome extends HibernateDaoSupport {
	
	@SuppressWarnings("unchecked")
	public List<Zfhy> getlawEnforce(String hymc)
	{
		//List<Zfhy> result = new ArrayList<Zfhy>();
		List<Zfhy> result;
		try{
			String hql = "from Zfhy t where t.id.hymc = ? order by t.id.ybtc asc";
			List<Zfhy> zfhyList =  getHibernateTemplate().find(hql,hymc);
			if(zfhyList.size() == 3)
			{
				result = zfhyList;
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
