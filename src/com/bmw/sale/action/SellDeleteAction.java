package com.bmw.sale.action;

import org.apache.struts2.ServletActionContext;

import com.bmw.sale.business.SellImpl;
import com.bmw.sale.value.Sell;
import com.opensymphony.xwork2.ActionSupport;

public class SellDeleteAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private Sell sellinfo=new Sell();
	private SellImpl<Sell> sellImpl;
	public Sell getSellinfo() {
		return sellinfo;
	}
	public void setSellinfo(Sell sellinfo) {
		this.sellinfo = sellinfo;
	}
	public SellImpl<Sell> getSellImpl() {
		return sellImpl;
	}
	public void setSellImpl(SellImpl<Sell> sellImpl) {
		this.sellImpl = sellImpl;
	}
	
	protected String getParam(String key){
		return ServletActionContext.getRequest().getParameter(key);
	}
	
	
	public String delete()throws Exception{
		Integer id = Integer.parseInt(getParam("param"));
		sellImpl.deleteSell(id, Sell.class);
		return SUCCESS;
	}

}
