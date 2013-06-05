package dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import bean.ScsUsers;


public class ScsUsersHome  extends HibernateDaoSupport
{
	@SuppressWarnings("unchecked")
	public boolean checkLogin(String userName,String password)
	{
		String hql = "from ScsUsers t where t.username = ?";
		List<ScsUsers> list  = getHibernateTemplate().find(hql,userName);
		if(list.size() > 0)
		{
			ScsUsers nioUser = list.get(0);
			if(nioUser.getPassword().equals(password))
			{
				return true;
			}
		}
		return false;
	}
}