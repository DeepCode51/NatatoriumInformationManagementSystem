
package com.sxl.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sxl.controller.MyController;

@Controller("wdxxController")
@RequestMapping(value = "/admin/wdxx")
public class WdxxController extends MyController {
	

	@RequestMapping(value = "/frame")
	public String frame(Model model, HttpServletRequest request,String flag)throws Exception {
		return "/admin/wdxx/frame";
	}
	
	@RequestMapping(value = "/list")
	public String list(Model model, HttpServletRequest request,String flag,String title)throws Exception {
		String sql="select a.*,(select max(customerName) from t_customer b where a.customerId=b.id) customerName  from t_wdxx a where 1=1";

if(1==2){sql+="and customerId="+getCustomer(request).get("id") +" ";}
	if(title!=null&&!"".equals(title)){
			sql+=" and title like '%"+title+"%'";
		}
		sql+=" order by id desc";
		List list = db.queryForList(sql);
		request.setAttribute("list", list);
		return "/admin/wdxx/list";
	}
	
	@RequestMapping(value = "/editSave")
	public ResponseEntity<String> editSave(Model model,HttpServletRequest request,Long id,String flag
		,Integer customerId,String title,String pic,String content,Integer zan,String insertDate) throws Exception{
		int result = 0;
		if(id!=null){
			String sql="update t_wdxx set title=?,pic=?,content=?,zan=? where id=?";
			result = db.update(sql, new Object[]{title,pic,content,zan,id});
		}else{
			String sql="insert into t_wdxx(customerId,title,pic,content,zan,insertDate) values(?,?,?,?,?,now())";
			result = db.update(sql, new Object[]{getCustomer(request).get("id"),title,pic,content,zan});
		}
		if(result==1){
			return renderData(true,"操作成功",null);
		}else{
			return renderData(false,"操作失败",null);
		}
	}
	
	@RequestMapping(value = "/editDelete")
	public ResponseEntity<String> editDelete(Model model,HttpServletRequest request,Long id,String flag) throws Exception {
		
		String sql="delete from t_wdxx where id=?";
		int result = db.update(sql, new Object[]{id});
		if(result==1){
			return renderData(true,"操作成功",null);
		}else{
			return renderData(false,"操作失败",null);
		}
		
	}
	
	@RequestMapping(value = "/edit")
	public String edit(Model model, HttpServletRequest request,Long id,String flag)throws Exception {
		if(id!=null){
			//修改
			String sql="select * from t_wdxx where id=?";
			Map map = db.queryForMap(sql,new Object[]{id});
			model.addAttribute("map", map);
		}String sql="";

		return "/admin/wdxx/edit";
	}
}
