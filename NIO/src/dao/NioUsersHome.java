package dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import bean.NioUsers;


public class NioUsersHome  extends HibernateDaoSupport
{
	@SuppressWarnings("unchecked")
	public boolean checkLogin(String userName,String password)
	{
		String hql = "from NioUsers t where t.username = ?";
		List<NioUsers> list  = getHibernateTemplate().find(hql,userName);
		if(list.size() > 0)
		{
			NioUsers nioUser = list.get(0);
			if(nioUser.getPassword().equals(password))
			{
				return true;
			}
		}
		return false;
	}
}