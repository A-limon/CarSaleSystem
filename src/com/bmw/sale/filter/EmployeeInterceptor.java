package com.bmw.sale.filter;

import java.util.Map;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class EmployeeInterceptor extends AbstractInterceptor{
	private static final long serialVersionUID = 1L;

	public String intercept(ActionInvocation ai) throws Exception {
		Map<String, Object> session=ai.getInvocationContext().getSession();
		String depatment=(String)session.get("depatment");
		if(depatment.equals("经理")){
			return ai.invoke();
		}else{
			System.out.println("员工信息拦截器启动");
			return "noPower";	
		}		
	}
}
