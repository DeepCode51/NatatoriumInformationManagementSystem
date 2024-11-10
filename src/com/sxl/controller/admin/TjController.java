
package com.sxl.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sxl.controller.MyController;

@Controller("TjController")
@RequestMapping(value = "/admin/tj")
public class TjController extends MyController {
	

	@RequestMapping(value = "/tj1")
	public String frame(Model model, HttpServletRequest request,String flag)throws Exception {
		List list = db.queryForList("select sum(fee) fees,num,(select max(customerName) from t_customer b where b.id=a.customerId) customerName from t_huiyuanxf a group by num,customerId");
		model.addAttribute("list", list);
		System.out.println(list);
		return "/admin/tj/tj1";
	}
	
	@RequestMapping(value = "/tj2")
	public String tj2(Model model, HttpServletRequest request,String flag)throws Exception {
		
		int a = db.queryForInt("select sum(fee) fess from t_feiyong where types='支出'");
		int b = db.queryForInt("select sum(fee) fess from t_feiyong where types='收入'");
		model.addAttribute("a", a);
		model.addAttribute("b", b);
		
		return "/admin/tj/tj2";
	}
	
	
	@RequestMapping(value = "/tj11")
	public String frame11(Model model, HttpServletRequest request,String flag)throws Exception {
		
		String sql="select date_format(insertDate,'%y-%m-%d') days,sum(fee) price from t_wash group by date_format(insertDate,'%y-%m-%d')";
		List<Map> list = db.queryForList(sql);
		String aa="";
		String bb="";
		if(list!=null&&list.size()>0){
			for (int i = 0; i < list.size(); i++) {
				if(i==0){
					aa="'"+list.get(i).get("days")+"'";
					bb = list.get(i).get("price")+"";
				}else{
					aa+=",'"+list.get(i).get("days")+"'";
					bb +=","+ list.get(i).get("price")+"";
				}
			}
			
		}
		model.addAttribute("aa", aa);
		model.addAttribute("bb", bb);
		return "/admin/tj/tj1";
	}
	
}
