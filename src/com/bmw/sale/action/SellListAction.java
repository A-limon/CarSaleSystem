package com.bmw.sale.action;

import java.util.List;

import com.bmw.sale.business.SellImpl;
import com.bmw.sale.value.Car;
import com.bmw.sale.value.Employee;
import com.bmw.sale.value.Sell;
import com.opensymphony.xwork2.ActionSupport;

public class SellListAction  extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private Sell sellinfo=new Sell();
	private Car carinfo=new Car();
	private Employee employeeinfo=new Employee();
	private List<Sell> sell;
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
	public List<Sell> getSell() {
		return sell;
	}
	public void setSell(List<Sell> sell) {
		this.sell = sell;
	}
	public SellImpl<Sell> getSellImpl() {
		return sellImpl;
	}
	public void setSellImpl(SellImpl<Sell> sellImpl) {
		this.sellImpl = sellImpl;
	}
	
	public String list() throws Exception{
		sell=sellImpl.listSell(Sell.class);
		return SUCCESS;
		
	}

}
