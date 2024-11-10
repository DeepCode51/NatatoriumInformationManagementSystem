
package com.sxl.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sxl.controller.MyController;

@Controller("employeeController")
@RequestMapping(value = "/employee")
public class EmployeeController extends MyController {
	

	@RequestMapping(value = "/index")
	public String frame(Model model, HttpServletRequest request)throws Exception {
		return "/employee/index";
	}
	
	@RequestMapping(value = "/main")
	public String main(Model model, HttpServletRequest request)throws Exception {
		return "/employee/main";
	}
	
	
	@RequestMapping(value = "/password")
	public String password(Model model, HttpServletRequest request)throws Exception {
		return "/employee/password";
	}
	
	
	@RequestMapping(value = "/changePassword")
	public ResponseEntity<String> loginSave(Model model,HttpServletRequest request,String oldPassword,String newPassword) throws Exception {
		Map employee = getEmployee(request);
		if(oldPassword.equals(employee.get("password").toString())){
			String sql="update t_employee set password=? where id=?";
			db.update(sql, new Object[]{newPassword,employee.get("id")});
			return renderData(true,"1",null);
		}else{
			return renderData(false,"1",null);
		}
	}
	@RequestMapping(value = "/mine")
	public String mine(Model model, HttpServletRequest request)throws Exception {
Map employee =getEmployee(request);Map map = db.queryForMap("select * from t_employee where id=?",new Object[]{employee.get("id")});model.addAttribute("map", map);		return "/employee/mine";
	}
	
	

	@RequestMapping(value = "/mineSave")
	public ResponseEntity<String> mineSave(Model model,HttpServletRequest request,Long id
		,String username,String password,String employeeName,String phone,String age,String sex) throws Exception{
		int result = 0;
			String sql="update t_employee set employeeName=?,phone=?,age=?,sex=? where id=?";
			result = db.update(sql, new Object[]{employeeName,phone,age,sex,id});
		if(result==1){
			return renderData(true,"操作成功",null);
		}else{
			return renderData(false,"操作失败",null);
		}
	}
	}
