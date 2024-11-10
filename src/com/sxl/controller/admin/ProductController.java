
package com.sxl.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sxl.controller.MyController;

@Controller("productController")
@RequestMapping(value = "/admin/product")
public class ProductController extends MyController {
	

	@RequestMapping(value = "/frame")
	public String frame(Model model, HttpServletRequest request,String flag)throws Exception {
		return "/admin/product/frame";
	}
	
	@RequestMapping(value = "/list")
	public String list(Model model, HttpServletRequest request,String flag,String productName)throws Exception {
		String sql="select a.*  from t_product a where 1=1";

	if(productName!=null&&!"".equals(productName)){
			sql+=" and productName like '%"+productName+"%'";
		}
		sql+=" order by id desc";
		List list = db.queryForList(sql);
		request.setAttribute("list", list);
		return "/admin/product/list";
	}
	
	@RequestMapping(value = "/editSave")
	public ResponseEntity<String> editSave(Model model,HttpServletRequest request,Long id,String flag
		,String productName,String productPic1,String productPic2,String productPic3,String productPic4,
		Integer price,Integer oldPrice,String content,Integer nums,String tjxj,String status,Integer typesId,Integer jf) throws Exception{
		int result = 0;
		if(id!=null){
			String sql="update t_product set productName=?,productPic1=?,productPic2=?,productPic3=?,productPic4=?,price=?," +
					"oldPrice=?,content=?,nums=?,tjxj=?,status=?,typesId=?,jf=? where id=?";
			result = db.update(sql, new Object[]{productName,productPic1,productPic2,productPic3,productPic4,price,oldPrice,content,nums,tjxj,status,typesId,jf,id});
		}else{
			String sql="insert into t_product(productName,productPic1,productPic2,productPic3,productPic4,price," +
					"oldPrice,content,nums,tjxj,status,typesId,jf,userId,djl) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,0)";
			result = db.update(sql, new Object[]{productName,productPic1,productPic2,productPic3,productPic4,price,
					oldPrice,content,nums,tjxj,status,typesId,jf,null});
		}
		if(result==1){
			return renderData(true,"操作成功",null);
		}else{
			return renderData(false,"操作失败",null);
		}
	}
	
	@RequestMapping(value = "/editDelete")
	public ResponseEntity<String> editDelete(Model model,HttpServletRequest request,Long id,String flag) throws Exception {
		
		String sql="delete from t_product where id=?";
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
			String sql="select * from t_product where id=?";
			Map map = db.queryForMap(sql,new Object[]{id});
			model.addAttribute("map", map);
		}String sql="";

 sql="select * from t_types";
model.addAttribute("typesList", db.queryForList(sql));

		return "/admin/product/edit";
	}
}
