//验证用户名
function checkUsername(){
	var username = $("#username").val();;
    
}

function checkPassword(){
	var username = $("#password").val();;
  
}

//加载验证码
function loadimage() {
	document.getElementById("randImage").src = "page/image.jsp?" + Math.random();
}