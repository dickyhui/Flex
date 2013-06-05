package dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;


public class JcfwxxHome extends HibernateDaoSupport {
	@SuppressWarnings("unchecked")
	public String queryJcfwxx()
	{
		StringBuilder resultBuilder = new StringBuilder();
		resultBuilder.append("none");
		resultBuilder.append("?");

		String hql = "select distinct t.id.period from Jcfwxx t order by t.id.period asc";
		List<String> list  = getHibernateTemplate().find(hql);
		for(String str : list)
		{
			resultBuilder.append(str);
			resultBuilder.append(";");
		}
		resultBuilder.replace(resultBuilder.length()-1,resultBuilder.length(),"?");//将最后一个";"替换为"?"

		return resultBuilder.toString();
	}

}

