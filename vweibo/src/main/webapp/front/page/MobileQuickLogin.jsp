<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html ">
<html>
<head>
<base href="/vweibo/">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />  
<title>Insert title here</title>
<style type="text/css">
	body {
	margin:0 auto;
	width:auto;
	height:auto;
	font: normal 100% Helvetica, Arial, sans-serif;
	background: url("front/image/quickLoginBG.jpg")} 
	#header{
	height:25%;
	width: 100%;
	margin-left: 32%;
	margin-top: 5%;
	}
	#userPhoto{
	width:150px;
	height:150px;
	border-radius:150px;
	}
	#operation{
	width: 100%;
	height: 40%;
	margin-top: 15%;
	}
	#quickLoginYes{
	float: left;
	margin-left: 32%;
	}
	#quickLoginNo{
	float: left;
	margin-left: 32%;
	padding-top: 8%;
	}
</style>
<script src="front/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<%
	String userName=request.getParameter("userName");
%>
</head>
<body>
	<input type="hidden" value="<%=userName%>" id="userName"/>
	<div id="header" >
		<img src="front/image/UserSet_image/test_pic.jpg" id="userPhoto">
	</div>
	
	<div id="operation">
		<img src="front/image/quickLoginYes.jpg" id="quickLoginYes" onclick="quickLoginYesy()">
		<img src="front/image/quickLoginNo.jpg" id="quickLoginNo" onclick="quickLoginNon()">
	</div>
	<script type="text/javascript">
		function quickLoginYesy(){
		  var browser = { 
		        versions : function() { 
		            var u = navigator.userAgent, app = navigator.appVersion; 
		            return {//移动终端浏览器版本信息                                  
		            trident : u.indexOf('Trident') > -1, //IE内核                                  
		            presto : u.indexOf('Presto') > -1, //opera内核                                  
		            webKit : u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核                                  
		            gecko : u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核                                 
		            mobile : !!u.match(/AppleWebKit.*Mobile.*/) 
		                    || !!u.match(/AppleWebKit/), //是否为移动终端                                  
		            ios : !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端                  
		            android : u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器                                  
		            iPhone : u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者QQHD浏览器                     
		            iPad: u.indexOf('iPad') > -1, //是否iPad        
		            webApp : u.indexOf('Safari') == -1,//是否web应该程序，没有头部与底部 
		            google:u.indexOf('Chrome')>-1 
		        }; 
		    }(), 
		    language : (navigator.browserLanguage || navigator.language).toLowerCase() 
		    } 
		 if(browser.versions.mobile){
			 var userName=$("#userName").val();
			 $.post("user/quickLoginYes",{"userName":userName},function(data){
				alert(data);
			}) 
			
		 }
		  
	};
	
	
		function quickLoginNon(){
			alert("取消登录");
		}
	</script>
</body>
</html>