package dao;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ApplicationObjectSupport;
/**
 * 获取spring信息的工具类
 * @author Administrator
 *ApplicationObjectSupport提供getApplicationContext()方法，可以方便的获取到ApplicationContext。
 *Spring初始化时，会通过该抽象类的setApplicationContext(ApplicationContext context)方法将ApplicationContext 对象注入。
 *
 *当启动web服务容器的时候，就将ApplicationContext注入到一个spring工具类的一个静态属性中，
 *这样在普通类就可以通过这个工具类获取ApplicationContext，从而通过getBean( )获取bean对象
 */
public final class ToolSpring extends ApplicationObjectSupport {
	private static ApplicationContext applicationContext = null;
	@Override
	protected void initApplicationContext(ApplicationContext context)
			throws BeansException {
		// TODO Auto-generated method stub
		super.initApplicationContext(context);
		if(ToolSpring.applicationContext == null){
			ToolSpring.applicationContext = context;
			System.out.println();
			System.out.println();
			System.out.println("---------------------------------------------------------------------");
			System.out.println("========ApplicationContext配置成功,在普通类可以通过调用ToolSpring.getAppContext()获取applicationContext对象,applicationContext="+applicationContext+"========");
			System.out.println("---------------------------------------------------------------------");
			System.out.println();
			System.out.println();
		}
	}
	public static ApplicationContext getAppContext() {
		return applicationContext;
	}
	public static Object getBean(String name){
		return getAppContext().getBean(name);
	}
}