
package com.sxl.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sxl.controller.MyController;

@Controller("adminController")
@RequestMapping(value = "/admin")
public class AdminController extends MyController {
	

	@RequestMapping(value = "/index")
	public String frame(Model model, HttpServletRequest request)throws Exception {
		return "/admin/index";
	}
	
	@RequestMapping(value = "/main")
	public String main(Model model, HttpServletRequest request)throws Exception {
		return "/admin/main";
	}
	
	
	@RequestMapping(value = "/password")
	public String password(Model model, HttpServletRequest request)throws Exception {
		return "/admin/password";
	}
	
	
	@RequestMapping(value = "/changePassword")
	public ResponseEntity<String> loginSave(Model model,HttpServletRequest request,String oldPassword,String newPassword) throws Exception {
		Map admin = getAdmin(request);
		if(oldPassword.equals(admin.get("password").toString())){
			String sql="update t_admin set password=? where id=?";
			db.update(sql, new Object[]{newPassword,admin.get("id")});
			return renderData(true,"1",null);
		}else{
			return renderData(false,"1",null);
		}
	}
}
