package com.bmw.sale.business;

import java.util.List;
import com.bmw.sale.dao.BaseDao;

public class ClientImpl <T>{
	
private BaseDao dao;
	
	public List<T> listClient(Class<T> clazz) throws Exception{		
		return dao.getAllObjects(clazz);	
	}
	
	public void addClient(T client) throws Exception{
		dao.addObject(client);
	}
	
	
	public void deleteClient(int id,Class<T> clazz) throws Exception{
		T u = dao.getObject(clazz, id);
		dao.deleteObject(u);
	}
	
	public void modifyClient(T client) throws Exception{
		dao.updateObject(client);
	}
	
	public T getClient(Class<T> clazz, int id) throws Exception{
		return dao.getObject(clazz, id);
	}
	
	public List<T> getSell(int id) throws Exception{
		if(id==0){
			return null;
		}
		String queryString = "select engineid FROM Sell WHERE engineid ='"+id+"'";
		List<T> sell=dao.getObjects(queryString);
		return sell;
	}
	
	public List<T> getClient(int id) throws Exception{
		if(id==0){
			return null;
		}
		String queryString = "FROM Client as c WHERE c.sell.engineid ='"+id+"'";
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
