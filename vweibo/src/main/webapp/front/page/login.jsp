<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html >
<html >
<head>
<base href="/vweibo/">
<title>登录(Login)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS -->

<link rel="stylesheet" href="front/css/reset.css">
<link rel="stylesheet" href="front/css/supersized.css">
<link rel="stylesheet" href="front/css/style.css">


</head>
<body>
	<div class="page-container">
		<h1>登录(Login)</h1>
		<form action="user/login" method="post" onsubmit="return checkYZcode()">
			<input type="text" name="Uname" class="Uname" placeholder="请输入您的用户名！"> 
			<input type="password" name="Upassword" class="Upassword" onBlur="checkUsername()"   placeholder="请输入您的用户密码！">
			<input  class="Captcha" name="YZcodeInput" placeholder="请输入验证码！" onkeyup="InputYZcode()" id="YZcodeInput" />
			<img alt="加载失败" name="randImage" id="randImage" src="front/page/image.jsp" style="margin-left:20px; width:80px; height:40px; margin-top:28px;" border="1">
			<a href="javascript:loadimage();">点击刷新</a>
			<button type="submit" class="submit_button">登录</button>
			<div class="connect">
                <p id="errorMsg">${errorMsg }</p>
              </div>
			<a class="register" href="front/page/register.jsp">马上注册</a>
		</form>
		
		 <!-- <div class="connect">
                <p>快捷</p>
                <p>
                    <a class="facebook" href=""><img src="front/image/facebook.png"/></a>
                    <a class="twitter" href=""><img src="front/image/twitter.png"/></a>
                </p>
            </div>  -->
	</div>


	<!-- Javascript -->
	<script src="front/js/jquery-1.8.2.min.js" type="text/javascript"></script>
	<script src="front/js/supersized.3.2.7.min.js" type="text/javascript"></script>
	<script src="front/js/supersized-init.js" type="text/javascript"></script>
	<script src="front/js/scripts.js" type="text/javascript"></script>
	<script src="front/js/login.js" type="text/javascript"></script>
</body>

</html>

