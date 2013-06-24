package com.bmw.sale.action;

import com.bmw.sale.business.EmployeeImpl;
import com.bmw.sale.value.Employee;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction  extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private Employee employeeinfo=new Employee();
	private EmployeeImpl<Employee> employeeImpl;
	public Employee getEmployeeinfo() {
		return employeeinfo;
	}
	public void setEmployeeinfo(Employee employeeinfo) {
		this.employeeinfo = employeeinfo;
	}
	public EmployeeImpl<Employee> getEmployeeImpl() {
		return employeeImpl;
	}
	public void setEmployeeImpl(EmployeeImpl<Employee> employeeImpl) {
		this.employeeImpl = employeeImpl;
	}
	
	public String login() throws Exception {
		
		if(this.employeeinfo.getLoginname() == null || this.employeeinfo.getPassword() == null){
			ActionContext.getContext().getActionInvocation().getInvocationContext().put("notlogin", "账户密码不能为空！");
			return INPUT;
		}
		
		employeeinfo=employeeImpl.doLogin(this.employeeinfo.getLoginname(), this.employeeinfo.getPassword());
		
		if(employeeinfo!=null){
			ActionContext.getContext().getSession().put("user", employeeinfo.getUsername());
			ActionContext.getContext().getSession().put("loginname", employeeinfo.getLoginname());
			ActionContext.getContext().getSession().put("depatment", employeeinfo.getDepartment());
			return SUCCESS;
		}else{
			ActionContext.getContext().getActionInvocation().getInvocationContext().put("notlogin", "账户密码错误！");
			return INPUT;
		}
		
	}
}
