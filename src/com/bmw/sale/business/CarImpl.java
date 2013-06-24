package com.bmw.sale.business;

import java.util.List;

import com.bmw.sale.dao.BaseDao;

public class CarImpl <T>{
	private BaseDao dao;
	
	
	public List<T> lisCart(Class<T> clazz) throws Exception{		
		return dao.getAllObjects(clazz);	
	}
	
	public void addCar(T car) throws Exception{
		dao.addObject(car);
	}
	
	public void modifyCar(T car) throws Exception{
		dao.updateObject(car);
	}
	
	public void deleteCar(int id,Class<T> clazz) throws Exception{
		T u = dao.getObject(clazz, id);
		dao.deleteObject(u);
	}
	
	public T getCar(Class<T> clazz, int id) throws Exception{
		return dao.getObject(clazz, id);
	}
		
	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}
}
