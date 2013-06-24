package com.bmw.sale.action;

import org.apache.struts2.ServletActionContext;
import com.bmw.sale.business.ServiceImpl;
import com.bmw.sale.value.Client;
import com.bmw.sale.value.Service;
import com.opensymphony.xwork2.ActionSupport;

public class ServiceEditAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private Service serviceinfo=new Service();
	private Client clientinfo=new Client();
	private ServiceImpl<Service> serviceImpl;
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
	public ServiceImpl<Service> getServiceImpl() {
		return serviceImpl;
	}
	public void setServiceImpl(ServiceImpl<Service> serviceImpl) {
		this.serviceImpl = serviceImpl;
	}
	
	protected String getParam(String key){
		return ServletActionContext.getRequest().getParameter(key);
	}
	
	public String edit() throws Exception{
		Integer id = Integer.parseInt(getParam("param"));
		serviceinfo=serviceImpl.getService(Service.class, id);
		clientinfo=serviceinfo.getClient();
		return SUCCESS;
	}
}
