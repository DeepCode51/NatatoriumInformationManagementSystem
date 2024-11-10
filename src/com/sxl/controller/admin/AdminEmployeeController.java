
package com.sxl.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sxl.controller.MyController;

/**
*员工
* @author Administratorxxxx
* @date2019-02-20
*/
@Controller("adminEmployeeController")
@RequestMapping(value = "/admin/employee")
public class AdminEmployeeController extends MyController {
	

/**
* 查询frame
*/
	@RequestMapping(value = "/frame")
	public String frame(Model model, HttpServletRequest request,String flag)throws Exception {
		return "/admin/employee/frame";
	}
	
/**
* 查询列表
*/
	@RequestMapping(value = "/list")
	public String list(Model model, HttpServletRequest request,String flag,String username,String employeeName)throws Exception {
		//select date_format(insertDate, '%Y-%m-%d %H:%i:%s')
		//CONVERT(varchar, insertDate, 120 )
		//to_char(insertDate,'yyyy-mm-dd,hh24:mi:ss') 

		String sql="select a.* from t_employee a where 1=1 ";


	if(username!=null&&!"".equals(username)){
			sql+=" and username like '%"+username+"%'";
		}
	if(employeeName!=null&&!"".equals(employeeName)){
			sql+=" and employeeName like '%"+employeeName+"%'";
		}
		sql+=" order by id desc";
		List list = db.queryForList(sql);
		request.setAttribute("list", list);
		return "/admin/employee/list";
	}
	
/**
* 编辑保存（包含修改和添加）
*/
	@RequestMapping(value = "/editSave")
	public ResponseEntity<String> editSave(Model model,HttpServletRequest request,Long id,String flag
		,String username,String password,String employeeName,String phone,String age,String sex) throws Exception{
		int result = 0;
		if(id!=null){
			String sql="update t_employee set username=?,password=?,employeeName=?,phone=?,age=?,sex=? where id=?";
			result = db.update(sql, new Object[]{username,password,employeeName,phone,age,sex,id});
		}else{
			String sql="insert into t_employee(username,password,employeeName,phone,age,sex) values(?,?,?,?,?,?)";
			result = db.update(sql, new Object[]{username,password,employeeName,phone,age,sex});
		}
		if(result==1){
			return renderData(true,"操作成功",null);
		}else{
			return renderData(false,"操作失败",null);
		}
	}
	
/**
* 删除信息
*/
	@RequestMapping(value = "/editDelete")
	public ResponseEntity<String> editDelete(Model model,HttpServletRequest request,Long id,String flag) throws Exception {
		
		String sql="delete from t_employee where id=?";
		int result = db.update(sql, new Object[]{id});
		if(result==1){
			return renderData(true,"操作成功",null);
		}else{
			return renderData(false,"操作失败",null);
		}
		
	}
	
/**
* 跳转到编辑页面
*/
	@RequestMapping(value = "/edit")
	public String edit(Model model, HttpServletRequest request,Long id,String flag)throws Exception {
		if(id!=null){
			//修改
			String sql="select * from t_employee where id=?";
			Map map = db.queryForMap(sql,new Object[]{id});
			model.addAttribute("map", map);
		}String sql="";

		return "/admin/employee/edit";
	}
}
