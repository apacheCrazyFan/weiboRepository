//验证用户名和密码是否为空
function checkUsername(){
	var errorMsg="";
	var username = $(".UphoneOrUemail").val();
	var userpwd = $(".Upassword").val();
	if(username==null || username==""){
		errorMsg+="用户名不能为空";
	}
	
	if(userpwd==null || userpwd==""){
		errorMsg+="且密码不能为空";
	}
	$("#errorMsg").append(errorMsg);
}
//验证码校验
var flag=false;
function InputYZcode(){
	var yzm=$("#YZcodeInput").val();
	if(yzm.length==4){
		$.post("front/page/CheckYZcode.jsp",{"yzm":yzm},function(data){
			alert(data.length);
		if(data==0){
			flag=true;
		}else{
			flag=false;
			$("#errorMsg").append("验证码错误");
		}
	});
	}else{
		flag=false;
	}
}
function checkYZcode(){
	return flag;
}




//加载验证码
function loadimage() {
	document.getElementById("randImage").src = "front/page/image.jsp?" + Math.random();
}


