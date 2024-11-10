package com.sxl.interceptor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sxl.util.DBHelper;

/**
 * 拦截器
 * @date2018-9-18
 */
public class ProtalSessionHandlerInterceptor extends HandlerInterceptorAdapter{
	@Autowired
	private MessageSource messageSource;	
	
	@Autowired
	public DBHelper db;
	
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		super.afterCompletion(request, response, handler, ex);
	}

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		request.setAttribute("site_title", messageSource.getMessage("site_title", null, "", null));
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String url =getRequestUrl(request);
		
		return true;
		
	}
	
	/**
	 * like "/action!method.action"
	 */
	public String getRequestUrl(HttpServletRequest request)
	{
		String url =request.getRequestURI();
		String path = request.getContextPath();
		if (StringUtils.isNotEmpty(path))
		{
			return url.substring(path.length());
		}
		return url;
	}
		

}
