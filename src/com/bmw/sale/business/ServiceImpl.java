package com.bmw.sale.business;

import java.util.List;

import com.bmw.sale.dao.BaseDao;

public class ServiceImpl<T> {
private BaseDao dao;
	
	public List<T> listService(Class<T> clazz) throws Exception{		
		return dao.getAllObjects(clazz);	
	}
	
	public void addService(T service) throws Exception{
		dao.addObject(service);
	}
	
	public void modifyClient(T service) throws Exception{
		dao.updateObject(service);
	}
	
	public T getService(Class<T> clazz, int id) throws Exception{
		return dao.getObject(clazz, id);
	}
	
	public List<T> getClient(int id) throws Exception{
		if(id==0){
			return null;
		}
		String queryString = "select clientid FROM Client WHERE clientid ='"+id+"'";
		List<T> client=dao.getObjects(queryString);
		return client;
	}
		
	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}
}
