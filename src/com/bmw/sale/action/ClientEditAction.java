package com.bmw.sale.action;

import org.apache.struts2.ServletActionContext;
import com.bmw.sale.business.ClientImpl;
import com.bmw.sale.value.Client;
import com.bmw.sale.value.Sell;
import com.opensymphony.xwork2.ActionSupport;

public class ClientEditAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private Client clientinfo=new Client();
	private Sell sellinfo=new Sell();
	private ClientImpl<Client> clientImpl;
	public Client getClientinfo() {
		return clientinfo;
	}
	public void setClientinfo(Client clientinfo) {
		this.clientinfo = clientinfo;
	}
	public Sell getSellinfo() {
		return sellinfo;
	}
	public void setSellinfo(Sell sellinfo) {
		this.sellinfo = sellinfo;
	}
	public ClientImpl<Client> getClientImpl() {
		return clientImpl;
	}
	public void setClientImpl(ClientImpl<Client> clientImpl) {
		this.clientImpl = clientImpl;
	}
	protected String getParam(String key){
		return ServletActionContext.getRequest().getParameter(key);
	}
	
	public String edit() throws Exception{
		Integer id = Integer.parseInt(getParam("param"));
		clientinfo=clientImpl.getClient(Client.class, id);
		sellinfo=clientinfo.getSell();
		return SUCCESS;
	}
}
