package dao;

// Generated 2013-1-18 14:26:33 by Hibernate Tools 3.4.0.CR1
import java.util.ArrayList;
import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import bean.TyphForecast;
import bean.TyphInfo;


/**
 * Home object for domain model class TyphForecast.
 * @see bean.TyphForecast
 * @author Hibernate Tools
 */
public class TyphForecastHome extends HibernateDaoSupport {
	
	//查询台风预报路径 
	@SuppressWarnings("unchecked")
	public List<List> getTyphoonForecast(int typhNum)
	{
		List<List> result = new ArrayList<List>();
		try{
			//在TyphInfo表中查询是否该台风是实时的
			String hql = "from TyphInfo t where t.isongoing = 1 and t.typhNum = " + typhNum;
			List<TyphInfo> typhInfoList =  getHibernateTemplate().find(hql);
			//若是则查询预报路径
			if(typhInfoList.size() > 0)
			{
				//查询有几条预报路径
				hql = "select distinct t.id.tm from TyphForecast t where t.id.typhNum = " + typhNum;					
				List<String> tmList =  getHibernateTemplate().find(hql);
				//查询每条预报路径
				for(String tm : tmList)
				{
					hql = "from TyphForecast t where t.id.typhNum = "
							+ typhNum +
							" and t.id.tm = '"
							+ tm +
							"' order by t.id.ybsj asc";
					List<TyphForecast> typhForecastList =  getHibernateTemplate().find(hql);//,new double[]{Year*100,(Year+1)*100}
					if(typhForecastList.size() > 0)
					{
						result.add(typhForecastList);
					}
				}
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
