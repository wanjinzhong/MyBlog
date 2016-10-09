package com.blog.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class BackFilter
 */
public class BackFilter implements Filter {
	private String[] excepts;

	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		String path = request.getServletPath();
		if (excepts != null){
			for (String exc : excepts)
				if(exc.equals(path)){
					chain.doFilter(request, response); 
					return;
				}
		}
		if (request.getSession().getAttribute("bloggerId_back") == null){
			response.sendRedirect("login.shtml");
		}
		chain.doFilter(arg0, arg1);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		String 	except = fConfig.getInitParameter("except");  
		if(except != null)
			excepts = except.split(",");

	}

	public void destroy() {

	}

}