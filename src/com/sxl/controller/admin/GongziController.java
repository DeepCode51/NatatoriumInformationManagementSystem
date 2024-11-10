
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
*工资
* @author Administratorxxxx
* @date2019-02-20
*/
@Controller("gongziController")
@RequestMapping(value = "/admin/gongzi")
public class GongziController extends MyController {
	

/**
* 查询frame
*/
	@RequestMapping(value = "/frame")
	public String frame(Model model, HttpServletRequest request,String flag)throws Exception {
		return "/admin/gongzi/frame";
	}
	
/**
* 查询列表
*/
	@RequestMapping(value = "/list")
	public String list(Model model, HttpServletRequest request,String flag)throws Exception {
		//select date_format(insertDate, '%Y-%m-%d %H:%i:%s')
		//CONVERT(varchar, insertDate, 120 )
		//to_char(insertDate,'yyyy-mm-dd,hh24:mi:ss') 

		String sql="select a.*,(select employeeName from t_employee b where a.employeeId=b.id) employeeName  from t_gongzi a where 1=1 ";


		sql+=" order by id desc";
		List list = db.queryForList(sql);
		request.setAttribute("list", list);
		return "/admin/gongzi/list";
	}
	
/**
* 编辑保存（包含修改和添加）
*/
	@RequestMapping(value = "/editSave")
	public ResponseEntity<String> editSave(Model model,HttpServletRequest request,Long id,String flag
		,Integer employeeId,String yf,Integer fee1,Integer fee2,Integer fee3,String remark) throws Exception{
		int result = 0;
		if(id!=null){
			String sql="update t_gongzi set employeeId=?,yf=?,fee1=?,fee2=?,fee3=?,remark=? where id=?";
			result = db.update(sql, new Object[]{employeeId,yf,fee1,fee2,fee3,remark,id});
		}else{
			String sql="insert into t_gongzi(employeeId,yf,fee1,fee2,fee3,remark) values(?,?,?,?,?,?)";
			result = db.update(sql, new Object[]{employeeId,yf,fee1,fee2,fee3,remark});
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
		
		String sql="delete from t_gongzi where id=?";
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
			String sql="select * from t_gongzi where id=?";
			Map map = db.queryForMap(sql,new Object[]{id});
			model.addAttribute("map", map);
		}String sql="";

 sql="select * from t_employee";
model.addAttribute("employeeList", db.queryForList(sql));

		return "/admin/gongzi/edit";
	}
}
