package dao;

// Generated 2013-5-5 13:44:40 by Hibernate Tools 3.4.0.CR1

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import module.ArgoTrackAttribute;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import bean.ArgoMetaInfo;
import bean.ArgoProfile;
import bean.ArgoProfileId;

/**
 * Home object for domain model class ArgoProfile.
 * @see bean.ArgoProfile
 * @author Hibernate Tools
 */
public class ArgoProfileHome extends HibernateDaoSupport 
{
	@SuppressWarnings("unchecked")
	public List<Object> getArgoTrack(String platformNumber)
	{
		List<Object> results =  new ArrayList<Object>();
		try{
			//查询ArgoProfile表
			String hql = "from ArgoProfile t where t.id.platformNumber = ? " +
					"order by t.id.platformNumber asc";
			List<ArgoProfile> list  = getHibernateTemplate().find(hql,platformNumber);
			if(list.size()>0)
			{
				for(int i=0;i<list.size();i++) 
				{
					ArgoTrackAttribute argoTrackAttribute = new ArgoTrackAttribute();
					ArgoProfile argoProfile = list.get(i);
					argoTrackAttribute.LONGITUDE = Double.parseDouble(argoProfile.getLongitude().toString());
					argoTrackAttribute.LATITUDE = Double.parseDouble(argoProfile.getLatitude().toString());
					argoTrackAttribute.DATE = new SimpleDateFormat("yyyy-MM-dd hh:mm").format(argoProfile.getDateUpdate());
					results.add(argoTrackAttribute);
				}
			}
		}
		catch(Error e){
			System.out.println(e.getMessage());
		}
		return results;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Object> getArgoCycleNum(String platformNumber)
	{
		List<Object> results =  new ArrayList<Object>();
		try{
			//查询ArgoProfile表
			String hql = "select t.id.cycleNumber from ArgoProfile t where t.id.platformNumber = ? " +
					"order by t.id.cycleNumber desc";
			List<String> list  = getHibernateTemplate().find(hql,platformNumber);
			if(list.size()>0)
			{
				for(int i=0;i<list.size();i++) 
				{
					String cycleNum =  list.get(i);
					results.add(cycleNum);
				}
			}
		}
		catch(Error e){
			System.out.println(e.getMessage());
		}
		return results;
	}


}
