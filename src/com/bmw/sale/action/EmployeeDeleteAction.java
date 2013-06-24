package com.bmw.sale.action;

import org.apache.struts2.ServletActionContext;

import com.bmw.sale.business.EmployeeImpl;
import com.bmw.sale.value.Employee;
import com.opensymphony.xwork2.ActionSupport;

public class EmployeeDeleteAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private Employee employeeinfo=new Employee();
	private EmployeeImpl<Employee> employeeImpl;
	
	public EmployeeImpl<Employee> getEmployeeImpl() {
		return employeeImpl;
	}
	public void setEmployeeImpl(EmployeeImpl<Employee> employeeImpl) {
		this.employeeImpl = employeeImpl;
	}
	public Employee getEmployeeinfo() {
		return employeeinfo;
	}
	public void setEmployeeinfo(Employee employeeinfo) {
		this.employeeinfo = employeeinfo;
	}
	protected String getParam(String key){
		return ServletActionContext.getRequest().getParameter(key);
	}
	
	public String delete() throws Exception{
		Integer id = Integer.parseInt(getParam("param"));
		employeeImpl.deleteEmployee(id, Employee.class);
		return SUCCESS;
	}

}
