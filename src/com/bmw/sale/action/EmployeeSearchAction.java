package com.bmw.sale.action;

import java.util.List;
import org.apache.struts2.ServletActionContext;
import com.bmw.sale.business.EmployeeImpl;
import com.bmw.sale.value.Employee;
import com.opensymphony.xwork2.ActionSupport;

public class EmployeeSearchAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private Employee employeeinfo=new Employee();
	private List<Employee> employee;
	private EmployeeImpl<Employee> employeeImpl;
	private String searchText;
	
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

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

	public List<Employee> getEmployee() {
		return employee;
	}
	protected String getParam(String key){
		return ServletActionContext.getRequest().getParameter(key);
	}
	
	public String search() throws Exception{
		searchText = getParam("queryText");
		employee=employeeImpl.queryEmployee(searchText, Employee.class);
		return SUCCESS;
	}


}
