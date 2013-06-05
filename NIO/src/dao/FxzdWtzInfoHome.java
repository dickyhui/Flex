package dao;

// Generated 2013-5-18 11:01:54 by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;

import org.apache.bcel.generic.NEW;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import bean.FxzdWtzInfo;
import static org.hibernate.criterion.Example.create;

/**
 * Home object for domain model class FxzdWtzInfo.
 * @see bean.FxzdWtzInfo
 * @author Hibernate Tools
 */
public class FxzdWtzInfoHome extends HibernateDaoSupport {
	
	@SuppressWarnings("unchecked")
	public List<FxzdWtzInfo> GetWtzInfoMonthly(short year,Byte month)
	{
		List<FxzdWtzInfo> result;
		try{
			String hql;
			if(year == 0){
				hql = "from FxzdWtzInfo t where t.month = ?";
				result = getHibernateTemplate().find(hql,month);
			}
			else {
				hql = "from FxzdWtzInfo t where t.year = ? and t.month = ?";
				result = getHibernateTemplate().find(hql,new Object[]{year,month});
			}
		}
		catch (Exception e) {
			return null;
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<String> GetWtzAllYears(){
		List<String> result;
		try {
			String hql = "select distinct t.year from FxzdWtzInfo t order by t.year desc";
			result = getHibernateTemplate().find(hql);
			if(result.size()<=0)
			{
				return null;
			}
		} catch (Exception e) {
			return null;
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<String> GetWtzMonthbyYear(Short year){
		List<String> result;
		try {
			String hql;
			if(year != 0){
				hql = "select distinct t.month from FxzdWtzInfo t where t.year= ? order by t.month desc";
				result = getHibernateTemplate().find(hql,year);
			}
			else {//获取全部月份
				hql = "select distinct t.month from FxzdWtzInfo t order by t.month desc";
				result = getHibernateTemplate().find(hql);
			}
			
			if(result.size()<=0)
			{
				return null;
			}
		} catch (Exception e) {
			return null;
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<FxzdWtzInfo> GetWtzInfoById(Integer WNumber){
		List<FxzdWtzInfo> result;
		try {
			String hql;
			hql = "from FxzdWtzInfo t where t.id.WNumber = ? order by t.id.occurDate asc";
			result = getHibernateTemplate().find(hql,WNumber);
			
			if(result.size()<=0)
			{
				return null;
			}
		} catch (Exception e) {
			return null;
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<Integer> GetWtzAllIds(){
		List<Integer> result;
		try {
			String hql = "select distinct t.id.WNumber from FxzdWtzInfo t order by t.id.WNumber asc";
			result = getHibernateTemplate().find(hql);
			if(result.size()<=0)
			{
				return null;
			}
		} catch (Exception e) {
			return null;
		}
		return result;
	}
}
