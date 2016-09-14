<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<base href="/vweibo/">
<head>
	<style type="text/css">
		body{
		background-color:#E0EDFA;
		}
		
		#textinput{
		width: 200px;
		}
		#aa{
		float: left;
		margin-left: 280px;
		margin-top: 20px;
		}
		#bb{
		float: left;
		margin-left: 20px;
		margin-top: 20px;
		}
		#QRCodeImagec{
		height: 250px;
		width: 300px;
		clear:both;
		margin-left: 400px;
		padding-top: 60px;
		}
	</style>
<script src="front/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="front/js/jquery.qrcode.min.js"></script>
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>

</head>
<body class="templatemo-bg-gray">
<form action="user/quickLogin" method="post">
	<div id="aa">
		<span style="font-size: 13px;">请输入邮箱或者手机号：</span><input type="text" name="userName" placeholder="请输入邮箱或者手机号" id="textinput" value="1373930633@qq.com">
	</div>
	<div id="bb">
		<input type="button"  id="loadQRCode" onclick="loadQRCodee()" value="生成二维码"/>
	</div>
	<div id="QRCodeImagec">
	
	</div>
	
</form>

	<script type="text/javascript">
	function loadQRCodee(){
		$("#QRCodeImagec").empty();
		var userName=$("#textinput").val();
		//var url=window.location.href+"?userName="+userName;
		$.post("user/getIpAddress",function(data){
			var url="http://"+data.substring(1,data.lastIndexOf('"'))+":8080/vweibo/front/page/MobileQuickLogin.jsp?userName="+userName;
			$("#QRCodeImagec").qrcode({
				render : "canvas",
				width: 300, //宽度
				height:250, //高度
				text: url //任意内容
			});
		});
		
		
		$("#bb").empty();
		$("#bb").append('<input type="submit" value="确认登录" /> <span>${errorMsgg}</span>');
	
		  
	}
	
	</script>
</body>
</html>