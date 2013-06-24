package com.bmw.sale.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.bmw.sale.business.EmployeeImpl;
import com.bmw.sale.value.Employee;
import com.opensymphony.xwork2.ActionSupport;

public class EmployeeListAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private Employee employeeinfo=new Employee();
	private List<Employee> employee;
	private EmployeeImpl<Employee> employeeImpl;
	private int totalPage;
	private int pageNumber;
	private int pageSize;

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
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

	public String list() throws Exception{
		HttpServletRequest request=ServletActionContext.getRequest();
		String pageNumberStr=request.getParameter("pageNumber");
		if(pageNumberStr==null||"".equals(pageNumberStr.trim())){
			pageNumberStr="1";
		}
		pageSize=5;
		employeeImpl.EmployeeHql();
		int rows=employeeImpl.getTotalRows();
		int[] paging=new int[2];
		paging=employeeImpl.pageNumber(rows, pageNumberStr, pageSize);
		pageNumber=paging[0];
		totalPage=paging[1];
		employee=employeeImpl.listEmployeeByPage(pageNumber, pageSize);
		return SUCCESS;
		
	}	
	
}
