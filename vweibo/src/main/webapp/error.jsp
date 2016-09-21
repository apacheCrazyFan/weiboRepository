<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="/vweibo/">
<title>页面载入错误</title>
<style type="text/css">
	body{
	padding: 0p;
	margin: 0 auto;
	background-color: #FBFBFB;
	}
	#errorconn{
	margin-left: 450px;
	margin-top: 60px;
	}
	#errorfore{
	margin-left: 240px;
	}
	#content{
	float: right;
	padding-top: 40px;
	margin-right: 380px;
	}
	#content ul li{
	line-height: 200%;
	}
	#errorimg{
	float: right;
	margin-right: 450px;
	}
</style>
</head>
<body>
	<div id="errorconn">
		<img  src="front/image/errorconn.jpg">
	</div>
	<div id="errorfore">
		<img src="front/image/errorfore.jpg">
		<div id="content">
			<ul>
				<li>请检查该地址是否输入错误</li>
				<li>如果您无法载入任何页面，请检查您计算机的网络连接</li>
				<li>如果您的计算机或网络受到防火墙或者代理服务器的保护，<br/>请确认已被授权访问网络。</li>
			</ul>
		</div>
		<div id="errorimg">
			<img  src="front/image/errorimg1.jpg" onclick="connfore()">
			<img  src="front/image/errorimg2.jpg" onclick="reload()">
		</div>
	</div>
	<script type="text/javascript">
	 function reload(){
		 var url=window.location.href;
		 window.location.href=url;
	 }
	 function connfore(){
		 window.location.href="http://e.firefoxchina.cn/?from_err_btn";
	 }
	
	</script>
</body>
</html>