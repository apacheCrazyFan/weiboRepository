<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<base href="/vweibo/front/">
<head>
	<title>注册</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
	<link href="css/templatemo_style.css" rel="stylesheet" type="text/css">	
</head>
<body class="templatemo-bg-gray">
	<h1 class="margin-bottom-15">创建帐户</h1>
	<div class="container">
		<div class="col-md-12">			
			<form class="form-horizontal templatemo-create-account templatemo-container" role="form" action="#" method="post">
				
			        <div class="form-group">
			          <div class="col-md-6">		          	
			            <label for="username" class="control-label">用户名</label>
			            <input type="text" class="form-control" id="username" placeholder="" onBlur="checkUserName()">		 <br>           		            		  
                          <span id="userName_warn"></span>     
			          </div>
			          <div class="col-md-6 templatemo-radio-group">
			          	<label class="radio-inline">
		          			<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1">帅哥
		          		</label>
		          		<label class="radio-inline">
		          			<input type="radio" name="optionsRadios" id="optionsRadios2" value="option2"> 美眉
		          		</label>
						<label class="radio-inline">
		          			<input type="radio" name="optionsRadios" id="optionsRadios2" value="option2"> 不公开
		          		</label>
			          </div>             
			        </div>
                    <div class="form-inner">
					<div class="form-group">
			          <div class="col-md-6">		          	
			            <label for="first_name" class="control-label">邮箱</label>
			            <input type="text" class="form-control" id="first_name" placeholder="请输入您的邮箱" onBlur="checkEmail()"/> <br/>
                         <span id="first_name_warn"></span>  <br/>
                         <input type="button" style="border:ridge 2px #CCCCCC" onClick="YZcodee()" id="YZcode" value="点击发送验证码"/>   
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" placeholder="请输入验证码"/>  		
			          </div> 	        
			        </div>
                    
			        <div class="form-group">	
                    	<div class="col-md-6">	          	
			            	<label for="last_name" class="control-label">手机</label>
			            	<input style="width:300px" type="text" class="form-control" id="last_name" placeholder="请输入您的手机" onBlur="checkPhone()">	<br/>
                             <span id="phone_warn"></span>  
                        </div>            		            		            
			          </div>  	
			        
					<div class="form-group">
			          <div class="col-md-6">
			            <label for="password" class="control-label">密码</label>
			            <input type="password" class="form-control" id="password" placeholder="" onBlur="checkPassword()" required="required"> <br/>
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
			            <label><input type="checkbox">同意以下协议 <a href="javascript:;" data-toggle="modal" data-target="#templatemo_modal">Terms of Service</a></label>
			          </div>
			        </div>
			        <div class="form-group">
			          <div class="col-md-12">
			            <input type="submit" value="创建帐户" class="btn btn-info">
			            <a href="page/login.jsp" class="pull-right">登录</a>
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
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/register.js"></script>
</body>
</html>