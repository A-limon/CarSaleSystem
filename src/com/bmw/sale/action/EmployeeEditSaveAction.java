package com.bmw.sale.action;

import com.bmw.sale.business.EmployeeImpl;
import com.bmw.sale.value.Employee;
import com.opensymphony.xwork2.ActionSupport;

public class EmployeeEditSaveAction extends ActionSupport{
	
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
	
	public String editsave() throws Exception{
		employeeImpl.modifyEmployee(employeeinfo);
		return SUCCESS;
	}

}
