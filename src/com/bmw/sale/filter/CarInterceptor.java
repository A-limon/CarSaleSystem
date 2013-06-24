package com.bmw.sale.filter;

import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class CarInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 1L;

	public String intercept(ActionInvocation ai) throws Exception {
		Map<String, Object> session=ai.getInvocationContext().getSession();
		String depatment=(String)session.get("depatment");
		if(depatment.equals("经理")||depatment.equals("销售")){
			return ai.invoke();
		}else{
			System.out.println("车型拦截器启动");
			return "noPower";	
		}		
	}

}
