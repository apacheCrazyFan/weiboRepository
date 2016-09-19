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
			<input type="text" name="UphoneOrUemail" class="UphoneOrUemail" placeholder="请输入手机号/邮箱号" value="1373930633@qq.com">
			<input type="password" name="Upassword" class="Upassword" onBlur="checkUsername()"   placeholder="请输入您的用户密码！" value="sa">
			<input  class="Captcha" name="YZcodeInput" placeholder="请输入验证码！" onkeyup="InputYZcode()" id="YZcodeInput" />
			<img alt="加载失败" name="randImage" id="randImage" src="front/page/image.jsp" style="margin-left:20px; width:80px; height:40px; margin-top:28px;" border="1">
			<a href="javascript:loadimage();">点击刷新</a>
			<button type="submit" class="submit_button">登录</button>
			<div class="connect">
                <p id="errorMsg">${errorMsg }</p>
              </div>
		</form>
		<a class="register" href="front/page/register.jsp">马上注册</a>
		<a  class="register" id="quickLogin" href="front/page/quickLogin.jsp">快捷登录</a>
		
		
		   <!--<div class="connect">
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
	<script type="text/javascript" src="front/js/artDialog.min.js"></script>
</body>

<script type="text/javascript">
/* $("#quickLogin").bind('click',function(){
	   art.dialog({
	   lock: true,                      // (弹出框时
面的主页面是否“锁”起来（即蒙上了一个阴影层 true：代表锁起来 false：反之)
	   title: '快捷登录',
	  // (弹出框的标题)
	  content:'<'+'iframe id="newFream" frameborder="0" src="front/page/quickLogin.jsp" height="400" width="600"></'+'iframe>', // (frameborder="0" : 无框 src：里写需要展示的内容链接，可以是个页面)
	  id: 'EF893L',
	  height:400, //弹出框的高度
	  width:600,//弹出框的宽度
	  opacity: .10 //阴影层颜色的深浅
	})

}); */
	
	
</script>
</html>

