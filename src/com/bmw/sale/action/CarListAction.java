package com.bmw.sale.action;

import java.util.List;

import com.bmw.sale.business.CarImpl;
import com.bmw.sale.value.Car;
import com.opensymphony.xwork2.ActionSupport;

public class CarListAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private Car carinfo=new Car();
	private List<Car> car;
	private CarImpl<Car> carImpl;
	public Car getCarinfo() {
		return carinfo;
	}
	public void setCarinfo(Car carinfo) {
		this.carinfo = carinfo;
	}
	public List<Car> getCar() {
		return car;
	}
	public void setCar(List<Car> car) {
		this.car = car;
	}
	public CarImpl<Car> getCarImpl() {
		return carImpl;
	}
	public void setCarImpl(CarImpl<Car> carImpl) {
		this.carImpl = carImpl;
	}
	
	public String list() throws Exception{
		car=carImpl.lisCart(Car.class);
		return SUCCESS;
	}

}
