package com.bmw.sale.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class SellFilter
 */
@WebFilter(urlPatterns = {"/employee/*"})
public class EmployeeFilter implements Filter {

	private String webroot = null;
	public void init(FilterConfig fConfig) throws ServletException {

		ServletContext ctx = fConfig.getServletContext();
		webroot = ctx.getContextPath();
	}

	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		HttpSession session = req.getSession(false);
		
		String uri = req.getRequestURI();
		req.setCharacterEncoding("utf-8");
		if(uri!=null&&(uri.equals(webroot+"/index/error.jsp")))
		{
			chain.doFilter(req, res);
		}
		else{
			if(session.getAttribute("depatment")==null||session.getAttribute("depatment").equals("经理"))
			{
				chain.doFilter(req, res);				
			}
			else
			{
				res.sendRedirect(webroot+"/index/info.jsp");	
				
			}
		}
	}



}
