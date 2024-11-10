package com.sxl.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import com.sxl.util.JacksonJsonUtil;
import com.sxl.util.DBHelper;
import com.sxl.util.PageTool;

public class MyController   {
	@Autowired
	public DBHelper db;
	
	public Map getAdmin(HttpServletRequest request){
		Map customerBean = (Map)request.getSession().getAttribute("adminBean");
		return customerBean;
	}
	public Map getCustomer(HttpServletRequest request){
		Map bean = (Map)request.getSession().getAttribute("customerBean");
		return bean;
	}
	
	public Map getEmployee(HttpServletRequest request){
		Map bean = (Map)request.getSession().getAttribute("employeeBean");
		return bean;
	}
	
	/**
	 * 初始化HTTP头.
	 * 
	 * @return HttpHeaders
	 */
	public HttpHeaders initHttpHeaders() {
		HttpHeaders headers = new HttpHeaders();
		MediaType mediaType = new MediaType("text", "html",
				Charset.forName("utf-8"));
		headers.setContentType(mediaType);
		return headers;
	}
	
	public ResponseEntity<String> renderMsg(Boolean status, String msg) {
		if (StringUtils.isEmpty(msg)) {
			msg = "";
		}
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"status\":\"" + status + "\",\"msg\":\"" + msg + "\"");
		sb.append("}");
		ResponseEntity<String> responseEntity = new ResponseEntity<String>(
				sb.toString(), initHttpHeaders(), HttpStatus.OK);
		return responseEntity;
	}
	
	
	public ResponseEntity<String> renderData(Boolean status, String msg,
			Object obj) {
		if (StringUtils.isEmpty(msg)) {
			msg = "";
		}
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"status\":\"" + status + "\",\"msg\":\"" + msg + "\",");
		sb.append("\"data\":" + JacksonJsonUtil.toJson(obj) + "");
		sb.append("}");
		ResponseEntity<String> responseEntity = new ResponseEntity<String>(
				sb.toString(), initHttpHeaders(), HttpStatus.OK);
		return responseEntity;
	}
	
	public ResponseEntity<String> renderDataEasyUi(HttpServletRequest request,Object obj) {
		StringBuffer sb = new StringBuffer();
		PageTool page = (PageTool)request.getAttribute("page");
		sb.append("{");
		sb.append("\"total\":\"" + page.getSize() + "\",");
		sb.append("\"rows\":" + JacksonJsonUtil.toJson(obj) + "");
		sb.append("}");
		ResponseEntity<String> responseEntity = new ResponseEntity<String>(
				sb.toString(), initHttpHeaders(), HttpStatus.OK);
		return responseEntity;
	}
	public ResponseEntity<String> renderComboBoxAjax(Object obj) {
		ResponseEntity<String> responseEntity = new ResponseEntity<String>(
				JacksonJsonUtil.toJson(obj), initHttpHeaders(), HttpStatus.OK);
		return responseEntity;
	}
}
