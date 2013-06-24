package com.bmw.sale.action;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bmw.sale.business.EmployeeImpl;
import com.bmw.sale.value.Employee;
import com.opensymphony.xwork2.ActionSupport;

public class EmployeeAddAction extends ActionSupport {

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
	
	public String add() throws Exception{
		employeeImpl.addEmployee(employeeinfo);
		return SUCCESS;
	}
	
	public String CheckUserName() throws Exception{   
		
		String text="false";
		String loginname=employeeinfo.getLoginname();
		
        if(employeeImpl.getEmployee(loginname).isEmpty()){ 
             text="true";
        }
        
       
       HttpServletResponse response = ServletActionContext.getResponse(); 
       response.setContentType("text/plain;charset=UTF-8"); 
       response.getWriter().write(text); 
       return null; 
	}
	
	

}
