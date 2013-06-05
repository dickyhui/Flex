package dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import module.ArgoSiteAttribute;
import module.ArgoUpdateAttribute;

import org.springframework.flex.messaging.MessageTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import bean.ArgoMetaInfo;
import bean.ArgoProfile;


public class ArgoMetaInfoHome  extends HibernateDaoSupport
{
	private final MessageTemplate template;

	public ArgoMetaInfoHome(MessageTemplate template) {
		this.template = template;
	}

	//返回所有argo浮标的基本信息
	@SuppressWarnings("unchecked")
	public List<ArgoSiteAttribute> getArgoBasicInfo()
	{
		List<ArgoSiteAttribute> results =  new ArrayList<ArgoSiteAttribute>();
		try{
			//查询ArgoMetaInfo表
			String hql = "from ArgoMetaInfo t";
			List<ArgoMetaInfo> list  = getHibernateTemplate().find(hql);
			for(ArgoMetaInfo argoMetaInfo : list) {
				//查询ArgoProfile表
				hql = "from ArgoProfile t where t.id.platformNumber = ? and t.id.cycleNumber = " +
						"(select max(t.id.cycleNumber) from t where t.id.platformNumber = ?)" ;
				List<ArgoProfile> list2  = getHibernateTemplate().find(hql,new String[]{argoMetaInfo.getPlatformNumber(),argoMetaInfo.getPlatformNumber()});

				if(list2.size()>0)
				{
					ArgoProfile argoProfile = (ArgoProfile)list2.get(0);
					//给实例化ArgoProfile
					ArgoSiteAttribute argoSiteAttribute = new ArgoSiteAttribute();
					argoSiteAttribute.ARGOS_PTT = argoMetaInfo.getPtt();
					argoSiteAttribute.CYCLE_NUMBER = argoProfile.getId().getCycleNumber();
					argoSiteAttribute.DATE = new SimpleDateFormat("yyyy-MM-dd").format(argoProfile.getDateCreation());
					argoSiteAttribute.LATITUDE = argoProfile.getLatitude().toString();
					argoSiteAttribute.LONGITUDE = argoProfile.getLongitude().toString();
					argoSiteAttribute.PLATFORM_MODEL = argoMetaInfo.getPlatformModel();
					argoSiteAttribute.PLATFORM_NUMBER = argoMetaInfo.getPlatformNumber();
					argoSiteAttribute.PROJECT_NAME = "China";
					argoSiteAttribute.STATE = "Active";
					results.add(argoSiteAttribute);
				}
			}
		}
		catch(Error e)
		{
			System.out.println(e);
		}
		return results;
	}
	//返回所有argo浮标的更新信息
	@SuppressWarnings("unchecked")
	public void getArgoUpdateInfo()
	{
		List<ArgoUpdateAttribute> results =  new ArrayList<ArgoUpdateAttribute>();
		try{
			//查询ArgoMetaInfo表
			String hql = "from ArgoMetaInfo t";
			List<ArgoMetaInfo> list  = getHibernateTemplate().find(hql);
			for(ArgoMetaInfo argoMetaInfo : list) {
				//查询ArgoProfile表
				hql = "from ArgoProfile t where t.id.platformNumber = ? and t.id.cycleNumber = " +
						"(select max(t.id.cycleNumber) from t where t.id.platformNumber = ?)" ;
				List<ArgoProfile> list2  = getHibernateTemplate().find(hql,new String[]{argoMetaInfo.getPlatformNumber(),argoMetaInfo.getPlatformNumber()});

				if(list2.size()>0)
				{
					ArgoProfile argoProfile = (ArgoProfile)list2.get(0);
					//给实例化ArgoProfile
					ArgoUpdateAttribute argoUpdateAttribute = new ArgoUpdateAttribute();
					argoUpdateAttribute.CYCLE_NUMBER = argoProfile.getId().getCycleNumber();
					argoUpdateAttribute.DATE = new SimpleDateFormat("yyyy-MM-dd").format(argoProfile.getDateUpdate());
					argoUpdateAttribute.LATITUDE = argoProfile.getLatitude().toString();
					argoUpdateAttribute.LONGITUDE = argoProfile.getLongitude().toString();
					argoUpdateAttribute.PLATFORM_NUMBER = argoMetaInfo.getPlatformNumber();
					results.add(argoUpdateAttribute);
				}
			}
		}
		catch(Error e)
		{
			System.out.println(e);
		}
		this.template.send("argoInfoUpdate",results);
	}
}
