//验证用户名和密码是否为空
function checkUsername(){
	var errorMsg="";
	var username = $(".Uname").val();
	var userpwd = $(".Upassword").val();
	if(username==null || username==""){
		errorMsg+="用户名不能为空";
	}
	
	if(userpwd==null || userpwd==""){
		errorMsg+="且密码不能为空";
	}
	$("#errorMsg").append(errorMsg);
}



//加载验证码
function loadimage() {
	document.getElementById("randImage").src = "front/page/image.jsp?" + Math.random();
}

//验证码校验
var flag=false;
function InputYZcode(){
	var yzm=$("#YZcodeInput").val();
	if(yzm.length==4){$.post("front/page/CheckYZcode.jsp",{"yzm":yzm},function(data){
		if(data){
			flag=true;
		}else{
			flag=false;
		}
	});
	}
	flag=false;
}
function checkYZcode(){
	return flag;
}


