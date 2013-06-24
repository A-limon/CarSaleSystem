package com.bmw.sale.action;

import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import com.bmw.sale.business.ServiceImpl;
import com.bmw.sale.value.Client;
import com.bmw.sale.value.Service;
import com.opensymphony.xwork2.ActionSupport;

public class ServiceAddAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private Service serviceinfo=new Service();
	private Client clientinfo=new Client();
	private ServiceImpl<Service> serviceImpl;
	
	public ServiceImpl<Service> getServiceImpl() {
		return serviceImpl;
	}
	public void setServiceImpl(ServiceImpl<Service> serviceImpl) {
		this.serviceImpl = serviceImpl;
	}
	public Service getServiceinfo() {
		return serviceinfo;
	}
	public void setServiceinfo(Service serviceinfo) {
		this.serviceinfo = serviceinfo;
	}
	public Client getClientinfo() {
		return clientinfo;
	}
	public void setClientinfo(Client clientinfo) {
		this.clientinfo = clientinfo;
	}
	protected String getParam(String key){
		return ServletActionContext.getRequest().getParameter(key);
	}
	
	public String add() throws Exception{
		serviceinfo.setClient(clientinfo);
		serviceImpl.addService(serviceinfo);
		return SUCCESS;
	}
	
	public String check() throws Exception{
		String text="true";
		int id=clientinfo.getClientid();
		
		if(serviceImpl.getClient(id).isEmpty()){
			text="false";
		}
		
		HttpServletResponse response = ServletActionContext.getResponse(); 
	       response.setContentType("text/plain;charset=UTF-8"); 
	       response.getWriter().write(text); 
	       return null; 
	}
}
