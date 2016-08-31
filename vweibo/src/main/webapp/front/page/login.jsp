<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/vweibo/front/">
<title>登录(Login)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS -->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/supersized.css"><!-- 这个css里会有个图片路径找不到 progress.gif -->
<link rel="stylesheet" href="css/style.css">

</head>

<body>

	<div class="page-container">
		<h1>登录(Login)</h1>
		<form action="" method="post">
			<input type="text" name="username" class="username" onBlur="checkUsername()" placeholder="请输入您的用户名！"> 
			<input type="password" name="password" class="password" onBlur="checkPassword()" placeholder="请输入您的用户密码！">
			<input  class="Captcha" name="Captcha" placeholder="请输入验证码！" />
			<img alt="加载失败" name="randImage" id="randImage" src="page/image.jsp" style="margin-left:20px; width:80px; height:40px; margin-top:28px;" border="1">
			<a href="javascript:loadimage();">点击刷新</a>
			<button type="submit" class="submit_button">登录</button>
			<a class="register" href="page/register.jsp">马上注册</a>
			<div class="error"> <span>+</span>
			</div>
		</form>
		<!--<div class="connect">
                <p>快捷</p>
                <p>
                    <a class="facebook" href=""><img src="image/facebook.png"/></a>
                    <a class="twitter" href=""><img src="image/twitter.png"/></a>
                </p>
            </div>-->
	</div>

	<!-- Javascript -->
	<script src="js/jquery-1.8.2.min.js" type="text/javascript"></script>
	<script src="js/supersized.3.2.7.min.js" type="text/javascript"></script>
	<script src="js/supersized-init.js" type="text/javascript"></script>
	<script src="js/scripts.js" type="text/javascript"></script>
	<script src="js/login.js" type="text/javascript"></script>

</body>

</html>

