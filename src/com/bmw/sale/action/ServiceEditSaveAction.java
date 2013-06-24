package com.bmw.sale.action;

import com.bmw.sale.business.ServiceImpl;
import com.bmw.sale.value.Client;
import com.bmw.sale.value.Service;
import com.opensymphony.xwork2.ActionSupport;

public class ServiceEditSaveAction extends ActionSupport {
	
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
	
	public String editsave() throws Exception{
		serviceinfo.setClient(clientinfo);
		serviceImpl.modifyClient(serviceinfo);
		return SUCCESS;
	}

}
