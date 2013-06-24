package com.bmw.sale.action;

import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import com.bmw.sale.business.ClientImpl;
import com.bmw.sale.value.Client;
import com.bmw.sale.value.Sell;
import com.opensymphony.xwork2.ActionSupport;

public class ClientAddAction extends ActionSupport{
	
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
	
	public String add() throws Exception{
		clientinfo.setSell(sellinfo);
		clientImpl.addClient(clientinfo);
		return SUCCESS;
	}
	
	public String check() throws Exception{
		String text="true";
		int id=sellinfo.getEngineid();
		
		if(clientImpl.getSell(id).isEmpty()){
			text="false";//如果发动机号在销售记录中不存在，直接返回false
		}else{
			if(clientImpl.getClient(id).isEmpty()){
				text="true";//如果发动机号在客户表中不存在，返回true
			}else{
				text="false";
			}
		}
		
		
		HttpServletResponse response = ServletActionContext.getResponse(); 
	       response.setContentType("text/plain;charset=UTF-8"); 
	       response.getWriter().write(text); 
	       return null; 
	}
	
}
