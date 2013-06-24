package com.bmw.sale.action;

import java.util.List;
import com.bmw.sale.business.ClientImpl;
import com.bmw.sale.value.Client;
import com.bmw.sale.value.Sell;
import com.opensymphony.xwork2.ActionSupport;

public class ClientListAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private Client clientinfo=new Client();
	private Sell sellinfo=new Sell();
	private List<Client> client;
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
	public List<Client> getClient() {
		return client;
	}
	public void setClient(List<Client> client) {
		this.client = client;
	}
	public ClientImpl<Client> getClientImpl() {
		return clientImpl;
	}
	public void setClientImpl(ClientImpl<Client> clientImpl) {
		this.clientImpl = clientImpl;
	}
	
	public String list() throws Exception{
		client=clientImpl.listClient(Client.class);
		return SUCCESS;
	}

}
