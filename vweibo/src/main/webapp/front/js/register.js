//验证用户名
function checkUserName() {
	var username = $("#username").val();;
	var zz = /^[A-Za-z0-9]{3,10}$/;
	if (!zz.test(username)) {
		$("#userName_warn").html(" × 用户名不符合规范").css("color", "#F00");
	} else {
		$("#userName_warn").html("√用户名可用").css("color", "#0F0");
	}
}

//验证邮箱
function checkEmail(){
	var pwd = $("#first_name").val();
	var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
	if (pwd.match(reg)) {
		$("#first_name_warn").html("√ 邮箱格式正确").css("color", "#0F0");
	}else{
		$("#first_name_warn").html("× 邮箱格式不正确").css("color", "#F00");	
	}
}


//验证手机
function checkPhone(){
	var pwd = $("#last_name").val();
	var reg = /^[0-9]{11}/;
	if (pwd.match(reg)) {
		$("#phone_warn").html("√手机格式正确").css("color", "#0F0");
	}else{
		$("#phone_warn").html("×手机格式不正确").css("color", "#F00");	
	}
}



//验证密码
function checkPassword(){
	var pwd = $("#password").val();
	if ("" == pwd || pwd == null) {
		$("#password_warn").html("× 您的密码不能为空...").css("color", "#F00");
	} else {
		$("#password_warn").html("√密码格式正确...").css("color", "#0F0");
	}
}

//验证重复密码
function checkPasswordagain() {
	var pwdagain = $("#password_confirm").val();
	var pwd = $("#password").val();
	if (pwdagain == pwd && pwd != "" && pwd != null) {
		$("#password_confirm_warn").html("√密码重复确认正确...").css("color", "#0F0");
	} else {
		$("#password_confirm_warn").html("× 密码不一致请重新输入...").css("color", "#F00");
		$("#password_confirm_warn").val("");
	}
}


function checkPro(){
	alert($("#YZcodeInput").val());
	if($("#YZcodeInput").val()==""){
		alert("请输入验证码");
	}
	if($("#btnbtn-info").prop('checked')){
		
	}else{
		alert("请填写完整信息");
	}
}



