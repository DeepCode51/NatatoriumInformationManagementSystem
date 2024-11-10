
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
*会员卡业务
* @author Administratorxxxx
* @date2019-02-20
*/
@Controller("huiyuanywController")
@RequestMapping(value = "/admin/huiyuanyw")
public class HuiyuanywController extends MyController {
	

/**
* 查询frame
*/
	@RequestMapping(value = "/frame")
	public String frame(Model model, HttpServletRequest request,String flag)throws Exception {
		return "/admin/huiyuanyw/frame";
	}
	
/**
* 查询列表
*/
	@RequestMapping(value = "/list")
	public String list(Model model, HttpServletRequest request,String flag,String num)throws Exception {
		//select date_format(insertDate, '%Y-%m-%d %H:%i:%s')
		//CONVERT(varchar, insertDate, 120 )
		//to_char(insertDate,'yyyy-mm-dd,hh24:mi:ss') 

		String sql="select a.*,(select customerName from t_customer b where a.customerId=b.id) customerName  from t_huiyuanyw a where 1=1 ";
		if(!"1".equals(flag)){sql+=" and customerId="+getCustomer(request).get("id") +" ";}

	if(num!=null&&!"".equals(num)){
			sql+=" and num like '%"+num+"%'";
		}
		sql+=" order by id desc";
		List list = db.queryForList(sql);
		request.setAttribute("list", list);
		return "/admin/huiyuanyw/list";
	}
	
/**
* 编辑保存（包含修改和添加）
*/
	@RequestMapping(value = "/editSave")
	public ResponseEntity<String> editSave(Model model,HttpServletRequest request,Long id,String flag
		,Integer customerId,String num,Integer fee,String types) throws Exception{
		int result = 0;
		Map map = db.queryForMap("select * from t_huiyuan where num='"+num+"' limit 1");
		if(map==null||map.get("id")==null){
			return renderData(false,"操作失败",null);
			
		}
		String sql="insert into t_huiyuanyw(customerId,num,fee,types) values(?,?,?,?)";
		result = db.update(sql, new Object[]{map.get("customerId"),num,fee,types});
		return renderData(true,"操作成功",null);
	}
	
/**
* 删除信息
*/
	@RequestMapping(value = "/editDelete")
	public ResponseEntity<String> editDelete(Model model,HttpServletRequest request,Long id,String flag) throws Exception {
		
		String sql="delete from t_huiyuanyw where id=?";
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
			String sql="select * from t_huiyuanyw where id=?";
			Map map = db.queryForMap(sql,new Object[]{id});
			model.addAttribute("map", map);
		}String sql="";

 sql="select * from t_customer";
model.addAttribute("customerList", db.queryForList(sql));

		return "/admin/huiyuanyw/edit";
	}
}
