package com.bmw.sale.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LogoutAction extends ActionSupport{

	private static final long serialVersionUID = 1L;

	public String logout() throws Exception{
		ActionContext ac = ActionContext.getContext();
		ac.getSession().remove("loginname");
		ac.getSession().remove("user");
		ac.getSession().remove("depatment");
		return SUCCESS;
	}

}
