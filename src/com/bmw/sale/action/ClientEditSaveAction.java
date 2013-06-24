package com.bmw.sale.action;

import com.bmw.sale.business.ClientImpl;
import com.bmw.sale.value.Client;
import com.bmw.sale.value.Sell;
import com.opensymphony.xwork2.ActionSupport;

public class ClientEditSaveAction extends ActionSupport{
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
	
	public String editsave() throws Exception{
		clientinfo.setSell(sellinfo);
		clientImpl.modifyClient(clientinfo);
		return SUCCESS;
	}
}
