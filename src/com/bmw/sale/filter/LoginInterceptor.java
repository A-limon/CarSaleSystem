package com.bmw.sale.filter;

import java.util.Map;
import com.bmw.sale.action.LoginAction;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor{

	private static final long serialVersionUID = 1L;
	public String intercept(ActionInvocation ai) throws Exception {
		Map<String, Object> session=ai.getInvocationContext().getSession();
		String loginname=(String)session.get("loginname");
		if(ai.getAction().getClass()==LoginAction.class ){
			return ai.invoke();
		}else if(loginname!=null&&loginname.length()>0){
			return ai.invoke();
		}else{
			System.out.println("登录拦截器启动");
			ActionContext ac=ai.getInvocationContext();
			ac.put("notlogin", "您还没有登录！");
			return Action.LOGIN;	
		}		
	}
}
