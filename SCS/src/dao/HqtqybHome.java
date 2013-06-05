package dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;


import bean.Hqtqyb;

// Generated 2012-11-25 16:18:32 by Hibernate Tools 3.4.0.CR1


/**
 * Home object for domain model class Hqtqyb.
 * @see bean.Hqtqyb
 * @author Hibernate Tools
 */
public class HqtqybHome extends HibernateDaoSupport {

	@SuppressWarnings("unchecked")
	public List<Hqtqyb> getHqtq(long hqbh)
	{
		//List<Hqtqyb> result = new ArrayList<Hqtqyb>();
		List<Hqtqyb> result;
		try{
			String hql = "from Hqtqyb t where t.id.hqbh = ? order by t.id.ybtc asc";
			List<Hqtqyb> hqqyList =  getHibernateTemplate().find(hql,hqbh);
			if(hqqyList.size() == 3)
			{
				result = hqqyList;
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
