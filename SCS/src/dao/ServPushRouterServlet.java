package dao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServPushRouterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException 
			{
				//接收前台参数
				String cmd = request.getParameter("cmd");
				String bean = request.getParameter("bean");
				String method = request.getParameter("method");
				if (cmd.equals("start")) {	
					if(bean.equals("ArgoMetaInfoHome"))
					{
						if(method.equals("getArgoUpdateInfo"))
						{
//							System.out.println("start!!");
//							ArgoMetaInfoHome argoMetaInfoHome=(ArgoMetaInfoHome)ToolSpring.getBean("argoMetaInfoHome");
//							argoMetaInfoHome.getArgoUpdateInfo();
						}
					}
				}
			}
}