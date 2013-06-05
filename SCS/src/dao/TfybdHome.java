package dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

// Generated 2013-3-8 16:06:27 by Hibernate Tools 3.4.0.CR1

/**
 * Home object for domain model class Tfybd.
 * @see bean.Tfybd
 * @author Hibernate Tools
 */
public class TfybdHome extends HibernateDaoSupport {
	@SuppressWarnings("unchecked")
	public String queryTfybd(String tfbh,String ci)
	{
		StringBuilder resultBuilder = new StringBuilder();
		resultBuilder.append(GetParamType(tfbh,ci));
		resultBuilder.append("?");

		String lastTfbh = tfbh;
		String lastCi = ci;
		if (lastTfbh.equals(""))
		{
			String hql = "select distinct t.id.typhNum from Tfybd t order by t.id.typhNum asc";
			List<Long> list  = getHibernateTemplate().find(hql);
			for(Long str : list)
			{
				resultBuilder.append(str);
				resultBuilder.append(";");
			}
			lastTfbh = list.get(list.size()-1).toString();
			resultBuilder.replace(resultBuilder.length()-1,resultBuilder.length(),"?");//将最后一个";"替换为"?"
		}
		else
		{
			resultBuilder.append(lastTfbh);
			resultBuilder.append("?");
		}
		
		if (lastCi.equals(""))
		{
			String hql = "select distinct t.id.releaseNum from Tfybd t where t.id.typhNum ='" + lastTfbh 
					+ "'  order by t.id.releaseNum asc";
			List<Short> list  = getHibernateTemplate().find(hql);
			for(Short str : list)
			{
				resultBuilder.append(str);
				resultBuilder.append(";");
			}
			lastCi = list.get(list.size()-1).toString();
			resultBuilder.replace(resultBuilder.length()-1,resultBuilder.length(),"?");//将最后一个";"替换为"?"
		}
		else
		{
			resultBuilder.append(lastCi);
			resultBuilder.append("?");
		}

		String hql = "select distinct t.id.dateTime from Tfybd t where t.id.typhNum ='" + lastTfbh
				+ "' and t.id.releaseNum = '" + lastCi
				+ "'  order by t.id.dateTime asc";
		List<String> list  = getHibernateTemplate().find(hql);
		for(String str : list)
		{
			resultBuilder.append(str);
			resultBuilder.append(";");
		}
		resultBuilder.replace(resultBuilder.length()-1,resultBuilder.length(),"?");//将最后一个";"替换为"?"

		return resultBuilder.toString();
	}

	//获取查询条件参数，none，year，month
	private String GetParamType(String tfbh, String ci)
	{
		if (tfbh.equals(""))
		{
			return "none";
		}
		else if (ci.equals(""))
		{
			return "tfbh";
		}
		else
		{
			return "ci";
		}
	}

}


