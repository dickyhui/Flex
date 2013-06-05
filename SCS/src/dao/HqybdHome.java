package dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class HqybdHome  extends HibernateDaoSupport {
		//查询预报单
		//返回结果:year?2011;2012?1;2;3?1,2
		//返回结果为海区预报单年份，2012年总共有1、2、3月，3号台风有1、2日
		@SuppressWarnings("unchecked")
		public String queryHqybd(String year,String month)
		{
			StringBuilder resultBuilder = new StringBuilder();
			resultBuilder.append(GetParamType(year,month));
			resultBuilder.append("?");

			String lastYear = year;//取从客户端传来的参数或者查询出来的最后一个，以供下个参数的查询用
			String lastMonth = month;//取从客户端传来的参数或者查询出来的最后一个，以供下个参数的查询用
			//判断查询条件
			//如果是所有条件都没有，则从年开始，找出表中的年数，按照升序排列，取出最后一年
			if (lastYear.equals(""))
			{
				String hql = "select distinct t.id.year from Hqybd t order by t.id.year asc";
				List<String> list  = getHibernateTemplate().find(hql);
				for(String str : list)
				{
					resultBuilder.append(str);
					resultBuilder.append(";");
				}
				lastYear = list.get(list.size()-1);
				resultBuilder.replace(resultBuilder.length()-1,resultBuilder.length(),"?");//将最后一个";"替换为"?"
			}
			else
			{
				resultBuilder.append(lastYear);
				resultBuilder.append("?");
			}
			//找出表中的月份，按照升序排列，取出最后一月
			if (lastMonth.equals(""))
			{
				String hql = "select distinct t.id.month from Hqybd t where t.id.year ='" + lastYear 
						+ "'  order by t.id.month asc";
				List<String> list  = getHibernateTemplate().find(hql);
				for(String str : list)
				{
					resultBuilder.append(str);
					resultBuilder.append(";");
				}
				lastMonth = list.get(list.size()-1);
				resultBuilder.replace(resultBuilder.length()-1,resultBuilder.length(),"?");//将最后一个";"替换为"?"
			}
			else
			{
				resultBuilder.append(lastMonth);
				resultBuilder.append("?");
			}
			
			//找出表中的日，按照升序排列，取出最后日
			String hql = "select distinct t.id.day from Hqybd t where t.id.year ='" + lastYear 
					+ "' and t.id.month = '" + lastMonth
					+ "'  order by t.id.day asc";
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
		private String GetParamType(String year, String month)
		{
			if (year.equals(""))
			{
				return "none";
			}
			else if (month.equals(""))
			{
				return "year";
			}
			else
			{
				return "month";
			}
		}
}
