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
		width: 200px;}
		#QRCodeImagec{
		height: 250px;
		width: 300px;
		float: left;
		margin-left: 30px;
		margin-top:40px;
		}
	</style>
<script src="front/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="front/js/jquery.qrcode.min.js"></script>
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>

</head>
<body class="templatemo-bg-gray">
	<span style="font-size: 13px;">请输入邮箱或者手机号：</span><input type="text" placeholder="请输入邮箱或者手机号" id="textinput" value="1373930633@qq.com">
	<input type="submit" value="确定" style="height: 26px;width: 50px" id="loadQRCode" onclick="loadQRCode()">
	<div id="QRCodeImagec">
	</div>
 	<script>
 		
	</script>
	<script type="text/javascript">
	function loadQRCode(){
		$("#QRCodeImagec").empty();
		var userName=$("#textinput").val();
		//var url=window.location.href+"?userName="+userName;
		var url="http://192.168.191.3:8080/vweibo/front/page/MobileQuickLogin.jsp?userName="+userName;
		$("#QRCodeImagec").qrcode({
			render : "canvas",
			width: 300, //宽度
			height:250, //高度
			text: url //任意内容
		});
		/* $.post("user/quickLogin",{"userName":userName},function(data){
			alert(data);
		}) */
		/* alert(window.location.host+window.location.pathname);
		var url=window.location.host+window.location.pathname;
		var sendurl=url.substring(0,url.lastIndexOf("/"));
		alert(sendurl); */
		/* alert(returnCitySN["cip"]+','+returnCitySN["cname"]); */
	
		  
	}
	
	
	</script>
	
	
</body>
</html>