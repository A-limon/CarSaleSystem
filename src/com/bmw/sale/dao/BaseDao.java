package com.bmw.sale.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class BaseDao extends HibernateDaoSupport{
	@SuppressWarnings("unchecked")
	public <T> List<T> getObjects(String queryString){
		
		return (List<T>)this.getHibernateTemplate().find(queryString);
	}
	
	public <T> List<T> getAllObjects(Class<T> clazz){
		return this.getHibernateTemplate().loadAll(clazz);
	}
	
	public <T> void addObject(T clazz){
		this.getHibernateTemplate().save(clazz);
	}
	
	public <T> void updateObject(T clazz){
		this.getHibernateTemplate().update(clazz);
	}
	
	public <T> void deleteObject(T clazz){
		this.getHibernateTemplate().delete(clazz);
	}
	
	public <T> T getObject(Class<T> clazz,Serializable id){
		return this.getHibernateTemplate().get(clazz, id);
	}
	
	private String hql;
	
	public void setHql(String hql) {
		this.hql = hql;
	}
	public String getHql() {
		return hql;
	}
	public int getTotalRows() {
		String actualHql = "select count(*) "
				+ hql.substring(hql.indexOf("from"));
		return ((Long) this.getHibernateTemplate().find(actualHql).get(0))
				.intValue();
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public<T> List<T> findByPage(final int page, final int size) {
		final int pageSize = size;
		final int totalRows = this.getTotalRows();
		return this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public List<T> doInHibernate(Session session)
					throws HibernateException, SQLException {
				// 实际页码
				int actualPage = (page > pageSize) ? pageSize : page;
				// 计算实际每页的条数,如果请求的每页数据条数大于总条数, 则等于总条数
				int actualSize = (size > totalRows) ? totalRows : size;
				// 计算请求页码的第一条记录的索引值,如果
				int startRow = (actualPage > 0) ? (actualPage - 1) * actualSize
						: 0;
				Query query = session.createQuery(hql);
				// 设置第一条记录
				query.setFirstResult(startRow);
				query.setMaxResults(actualSize);
				return (List<T>) query.list();
			}
		});
	}
	
}
