function showMessage(v1,v2,v3,fn){
	//第一个参数Id 第二个参数是分类 error success 第三个是内容
	$("#"+v1).after("<div style=\"display: none;\" id=\"showMessage\" class=\"general_info_box "+v2+"\"><a class=\"close\" href=\"#\">Close</a><p><b>说明:</b>"+v3+"</p></div>");
	$("#showMessage").slideDown();
	setTimeout(function(){
		$("#showMessage").slideUp(function(){
			isInit=true;
			$(".general_info_box").remove();
			if(fn!=undefined){
				fn();
			}
		});
	}, 1500);
}

function showMessage2(v1,v2,v3,fn){
	//第一个参数Id 第二个参数是分类 error success 第三个是内容
	$("#"+v1).after("<div style=\"display: none;\" id=\"showMessage\" class=\"general_info_box "+v2+"\"><a class=\"close\" href=\"#\">Close</a><p><b>说明:</b>"+v3+"</p></div>");
	$("#showMessage").slideDown();
	setTimeout(function(){
		$("#showMessage").slideUp(function(){
			isInit=true;
			$(".general_info_box").remove();
			if(fn!=undefined){
				fn();
			}
		});
	}, 15500);
}