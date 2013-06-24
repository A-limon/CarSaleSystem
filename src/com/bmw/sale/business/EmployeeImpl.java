package com.bmw.sale.business;

import java.util.List;

import com.bmw.sale.dao.BaseDao;

public class EmployeeImpl<T> {
	private BaseDao dao;
	
	public List<T> queryEmployee(String name,Class<T> clazz) throws Exception{
		if(name == null || "".equals(name))
			return dao.getAllObjects(clazz);
		String queryString = "FROM Employee WHERE username ='"+name+"'";
		return dao.getObjects(queryString);
	}
	public List<T> listEmployee(Class<T> clazz) throws Exception{		
		return dao.getAllObjects(clazz);
		
	}
	
	public void addEmployee(T employee) throws Exception{
		dao.addObject(employee);
	}
	
	public void modifyEmployee(T employee) throws Exception{
		dao.updateObject(employee);
	}
	
	public void deleteEmployee(int id,Class<T> clazz) throws Exception{
		T u = dao.getObject(clazz, id);
		dao.deleteObject(u);
	}
	
	public T getEmployee(Class<T> clazz, int id) throws Exception{
		return dao.getObject(clazz, id);
	}
	
	
	public List<T> getEmployee(String string) throws Exception{
		if(string==null||string.equals("")){
			return null;
		}
		String queryString = "select loginname FROM Employee WHERE loginname ='"+string+"'";
		List<T> employee=dao.getObjects(queryString);
		return employee;
	}
	
	public T doLogin(String loginname,String password) throws Exception{
		if(loginname == null || password == null) return null;
		String queryString = "FROM Employee  WHERE loginname = '"+loginname +"' AND password = '"+password+"'";
		List<T> employee = dao.getObjects(queryString);
		if(employee.isEmpty()){
			return null;
		}else{
			return employee.get(0);
		}
		
	}
	
	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}
	
	public void EmployeeHql(){
		String hql = "from Employee"; 
		dao.setHql(hql);
	}
	
	public int getTotalRows() {		
		return this.dao.getTotalRows();
	}
	
	public List<T> listEmployeeByPage(int page, int size) {		
		return this.dao.findByPage(page, size);
	}
	
	public int[] pageNumber(int postAmount,String pageNumberStr,int pageSize){
		int[] paging = new int[2];
		int pageNumber = 1;
		pageNumber = Integer.parseInt(pageNumberStr);
		if(pageNumber <= 0){
			pageNumber = 1;
		}
		int totalPage = 1;
		if(postAmount > 0){
			totalPage = postAmount%pageSize==0?(postAmount/pageSize):(postAmount/pageSize+1);
		}
		if(pageNumber > totalPage){
			pageNumber = totalPage;
		}
		paging[0] = pageNumber;
		paging[1] = totalPage;
		return paging;
	}
	
	

}
