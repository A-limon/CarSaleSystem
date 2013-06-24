package com.bmw.sale.action;

import org.apache.struts2.ServletActionContext;
import com.bmw.sale.business.CarImpl;
import com.bmw.sale.value.Car;
import com.opensymphony.xwork2.ActionSupport;

public class CarEditAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private Car carinfo=new Car();
	private CarImpl<Car> carImpl;
	public Car getCarinfo() {
		return carinfo;
	}
	public void setCarinfo(Car carinfo) {
		this.carinfo = carinfo;
	}
	public CarImpl<Car> getCarImpl() {
		return carImpl;
	}
	public void setCarImpl(CarImpl<Car> carImpl) {
		this.carImpl = carImpl;
	}
	
	protected String getParam(String key){
		return ServletActionContext.getRequest().getParameter(key);
	}
	
	public String edit() throws Exception{
		Integer id = Integer.parseInt(getParam("param"));
		carinfo=carImpl.getCar(Car.class, id);
		return SUCCESS;
	}

}
