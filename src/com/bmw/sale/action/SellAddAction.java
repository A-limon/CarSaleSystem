package com.bmw.sale.action;

import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import com.bmw.sale.business.SellImpl;
import com.bmw.sale.value.Car;
import com.bmw.sale.value.Employee;
import com.bmw.sale.value.Sell;
import com.opensymphony.xwork2.ActionSupport;

public class SellAddAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private Sell sellinfo=new Sell();
	private Car carinfo=new Car();
	private Employee employeeinfo=new Employee();
	private SellImpl<Sell> sellImpl;
	
	public Car getCarinfo() {
		return carinfo;
	}
	public void setCarinfo(Car carinfo) {
		this.carinfo = carinfo;
	}
	public Employee getEmployeeinfo() {
		return employeeinfo;
	}
	public void setEmployeeinfo(Employee employeeinfo) {
		this.employeeinfo = employeeinfo;
	}
	public Sell getSellinfo() {
		return sellinfo;
	}
	public void setSellinfo(Sell sellinfo) {
		this.sellinfo = sellinfo;
	}
	public SellImpl<Sell> getSellImpl() {
		return sellImpl;
	}
	public void setSellImpl(SellImpl<Sell> sellImpl) {
		this.sellImpl = sellImpl;
	}
	protected String getParam(String key){
		return ServletActionContext.getRequest().getParameter(key);
	}
	
	public String add() throws Exception{
		sellinfo.setEmployee(employeeinfo);
		sellinfo.setCar(carinfo);
		sellImpl.addSell(sellinfo);
		return SUCCESS;
	}
	
	public String checkcarid() throws Exception{
		String text="true";
		int id=carinfo.getCarid();
	
		if(sellImpl.getCar(id).isEmpty()){
			text="false";
		}
		
		HttpServletResponse response = ServletActionContext.getResponse(); 
	       response.setContentType("text/plain;charset=UTF-8"); 
	       response.getWriter().write(text); 
	       return null; 
	}
	
	public String checkuserid() throws Exception{
		String text="true";
		int id=employeeinfo.getUserid();
		
		if(sellImpl.getEmployee(id).isEmpty()){
			text="false";
		}
		
		HttpServletResponse response = ServletActionContext.getResponse(); 
	       response.setContentType("text/plain;charset=UTF-8"); 
	       response.getWriter().write(text); 
	       return null; 
	}
	
	public String checkengineid() throws Exception{
		String text="false";
		int id=sellinfo.getEngineid();
		
		if(sellImpl.getSell(id).isEmpty()){
			text="true";
		}
		
		HttpServletResponse response = ServletActionContext.getResponse(); 
	       response.setContentType("text/plain;charset=UTF-8"); 
	       response.getWriter().write(text); 
	       return null; 
	}

}
