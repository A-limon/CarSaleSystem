package com.bmw.sale.business;

import java.util.List;

import com.bmw.sale.dao.BaseDao;

public class SellImpl <T>{
	private BaseDao dao;
	
	public List<T> listSell(Class<T> clazz) throws Exception{		
		return dao.getAllObjects(clazz);	
	}
	
	public void addSell(T sell) throws Exception{
		dao.addObject(sell);
	}
	
	
	public void deleteSell(int id,Class<T> clazz) throws Exception{
		T u = dao.getObject(clazz, id);
		dao.deleteObject(u);
	}
	
	public T getsell(Class<T> clazz, int id) throws Exception{
		return dao.getObject(clazz, id);
	}
	
	public List<T> getEmployee(int id) throws Exception{
		if(id==0){
			return null;
		}
		String queryString = "select userid FROM Employee WHERE userid ='"+id+"'";
		List<T> employee=dao.getObjects(queryString);
		return employee;
	}
	
	public List<T> getCar(int id) throws Exception{
		if(id==0){
			return null;
		}
		String queryString = "select carid FROM Car WHERE carid ='"+id+"'";
		List<T> car=dao.getObjects(queryString);
		return car;
	}
	
	public List<T> getSell(int id) throws Exception{
		if(id==0){
			return null;
		}
		String queryString = "select engineid FROM Sell WHERE engineid ='"+id+"'";
		List<T> sell=dao.getObjects(queryString);
		return sell;
	}
		
	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}
}
