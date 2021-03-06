<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<base href="/vweibo/">
<head>
	<title>注册</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link href="front/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="front/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
	<link href="front/css/templatemo_style.css" rel="stylesheet" type="text/css">	
</head>
<body class="templatemo-bg-gray">
	<h1 class="margin-bottom-15">创建帐户</h1>
	<div class="container">
		<div class="col-md-12">			
			<form class="form-horizontal templatemo-create-account templatemo-container"  action="user/register" method="post">
			        <div class="form-group">
			          <div class="col-md-6">	       	
			            <label for="username" class="control-label">用户名</label>
			            <input type="text" class="form-control" name="Uname" id="username" placeholder="" onBlur="checkUserName()">		 <br>           		            		  
                          <span id="userName_warn"></span>     
			          </div>
			          <div class="col-md-6 templatemo-radio-group">
			          	<label class="radio-inline">
		          			<input type="radio"  name="Usex" id="optionsRadios1" value="male">帅哥
		          		</label>
		          		<label class="radio-inline">
		          			<input type="radio"  name="Usex" id="optionsRadios2" value="female"> 美眉
		          		</label>
						<label class="radio-inline">
		          			<input type="radio" name="Usex" id="optionsRadios2" value="secret"> 不公开
		          		</label>
			          </div>             
			        </div>
                    <div class="form-inner">
					<div class="form-group">
			          <div class="col-md-6">		          	
			            <label for="first_name" class="control-label">邮箱</label>
			            <input type="text" class="form-control" name="Uemail" id="first_name" placeholder="请输入您的邮箱" onBlur="checkEmail()"/> <br/>
                         <span id="first_name_warn"></span>  <br/>
                         <input type="button" style="border:ridge 2px #CCCCCC" onClick="YZcodee()" id="YZcode" value="点击发送验证码"/>   
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  placeholder="请输入验证码" name="YZcodeInput" id="YZcodeInput"/>
                       <span style="color: red;margin-left: 150px">${YZcodeErr }</span>
			          </div> 	        
			        </div>
                    
			        <div class="form-group">	
                    	<div class="col-md-6">	          	
			            	<label for="last_name" class="control-label">手机</label>
			            	<input style="width:300px" type="text" name="Uphone" class="form-control" id="last_name" placeholder="请输入您的手机" onBlur="checkPhone()">	<br/>
                             <span id="phone_warn"></span>  
                        </div>            		            		            
			          </div>  	
			        
					<div class="form-group">
			          <div class="col-md-6">
			            <label for="password" class="control-label">密码</label>
			            <input type="password" class="form-control" name="Upassword" id="password" placeholder="" onBlur="checkPassword()" required="required"> <br/>
                         <span id="password_warn"></span>  
			          </div>
			        </div>
                    
                    <div class="form-group">
			          <div class="col-md-6">
			            <label for="password" class="control-label">确认密码</label>
			            <input type="password" class="form-control" id="password_confirm" placeholder="" onBlur="checkPasswordagain()"><br/>
                         <span id="password_confirm_warn"></span>
			          </div>
			        </div>
                    
			        <div class="form-group">
			          <div class="col-md-12">
			            <label><input type="checkbox" id="btnbtn-info" onchange="checkPro()" >同意以下协议 <a href="javascript:;" data-toggle="modal" data-target="#templatemo_modal">Terms of Service</a></label>
			          </div>
			        </div>
			        <div class="form-group">
			          <div class="col-md-12">
			            <input type="submit" value="创建帐户" class="btn btn-info" id="registerUser" >
			            <a href="front/page/login.jsp" class="pull-right">直接登录</a>
			          </div>
			        </div>	
				</div>				    	
		      </form>		      
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="templatemo_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	        <h4 class="modal-title" id="myModalLabel">Terms of Service</h4>
	      </div>
	      <div class="modal-body">
	      	<p>This form is provided by <a rel="nofollow" href="http://www.cssmoban.com/page/1">Free HTML5 Templates</a> that can be used for your websites. Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>
	        <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla. Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
	        <p>Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	<script type="text/javascript" src="front/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="front/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="front/js/register.js"></script>
    <script type="text/javascript">
  //发送验证码
    var time=120;
    function f1(){
    	$("#YZcode").val(time+" s后重发");
    	time--;
    	if(time<=0){
    		window.clearInterval();
    		$("#YZcode").val("验证超时");
    		
    	}
    }
    function YZcodee(){
    	$.post("user/sendEMail",{"email":$("#first_name").val()},function(data){
    		alert(data);
    	})
    	window.setInterval("f1()", 1000);
    	if(time<=0){
    		window.clearInterval();
    		$("#YZcode").val("重新获取验证码");
    		time=120;
    	}
    	
    }
    
    </script>
</body>
</html>