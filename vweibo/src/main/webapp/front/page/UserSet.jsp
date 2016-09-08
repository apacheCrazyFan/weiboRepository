<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<base href="/vweibo/">
<meta charset="utf-8">
<title>无标题文档</title>
<link rel="stylesheet" href="front/css/UserSet.css">
<script src="front/js/jquery-1.11.1.min.js"></script>
<script src="front/js/UserSet.js"></script>
</head>
<body>
	<input type="hidden" value="${sessionScope.user.WBUid}" id="hiddenid">
	<input type="hidden" value="${sessionScope.user.uphone}" id="hiddenphone">
	<div id="wrap">
    	<div id="left">
        	<span class="idSet">账号设置</span>
            <ul>
            	<li class="line1"></li>
                <li class="myInfo"><img src="front/image/UserSet_image/icon1_2.png"><a href="front/page/UserSet.jsp">我的信息</a></li>
                <li class="photo"><img src="front/image/UserSet_image/icon2_1.png"><a href="front/page/UserSet_photo.jsp?WBUid=${sessionScope.user.WBUid}">头像</a></li>
                <li class="line2"></li>
                <li class="privacy"><img src="front/image/UserSet_image/icon3_1.png"><a href="front/page/UserSet_privacy.jsp">隐私设置</a></li>
                <li class="message"><img src="front/image/UserSet_image/icon4_1.png"><a href="front/page/UserSet_message.jsp">消息设置</a></li>
                <li class="prefer"><img src="front/image/UserSet_image/icon5_1.png"><a href="front/page/UserSet_prefer.jsp">偏好设置</a></li>
                <li class="line3"></li>
            </ul>
        </div>
        <div id="right">
        	<ul>
            	<span class="head_label">我的信息<a href="front/page/Personal.jsp">预览我的主页</a></span>
                <li id="perInfo1">登录名&nbsp;&nbsp;<span class="span1">****</span><a href="javascript: panelOpen(1);">修改密码</a></li>
                <li style="display:none;background:#fff;height:160px" id="perInfo_panel1">登录名<a href="javascript: panelClose(1);">收起</a><br/>
                    <div>
                        <span class="oldPwdW">旧密码</span>
                        <input type="password" class="oldPwd"/><br/>
                        <span class="newPwdW">新密码</span>
                        <input type="password" class="newPwd"/><br/>
                        <input class="saveChangePwd" type="image" src="front/image/UserSet_image/savePhoto1.png"/>
                        <input onClick="panelClose(1);" class="closeComplie" type="image" src="front/image/UserSet_image/closebtn1.png" />
                    </div>
                </li>
                <li>手机号&nbsp;&nbsp;<span class="span1">****</span></li>
                
                <li id="perInfo3">昵称&nbsp;&nbsp;&nbsp;&nbsp;<span class="span1">****</span><a href="javascript: panelOpen(3);">编辑</a></li>
                <li style="display:none;background:#fff;height:160px" id="perInfo_panel3">昵称<a href="javascript: panelClose(3);">收起</a><br/>
                    <div>
                        <span class="oldName">现昵称</span>
                        <span class="oldUserName">${user.uname }</span><br/><br/>
                        <span class="newName">新昵称</span>
                       <input type="text" style="height:25px" class="newUserName" name="newUserName" id="newName"/><div class="changeNameWarn"></div>
                        <input class="saveChangeUserName" type="image" src="front/image/UserSet_image/savePhoto1.png" onclick="saveChangeUserName()"/>
                        <input class="closeComplie1" type="image" src="front/image/UserSet_image/closebtn1.png" />
                    </div>
                </li>
                
                <li id="perInfo4">个人资料<span class="span1">****</span><a href="javascript: panelOpen(4);">编辑</a></li>
                <li style="display:none;background:#fff;height:400px" id="perInfo_panel4">个人资料<a href="javascript: panelClose(4);">收起</a>
                	<div>
                    	<ul>
                        	<li class="li_mes1">以下信息将显示在个人资料页，方便大家了解你。</li>
                            <li class="li_mes2">基本信息</li>
                            <li>性别<input type="radio" name="sex" value="man" class="radio_man"/>男 <input type="radio" name="sex" value="woman" class="radio_woman"/>女</li>
                            <li>生日<select class="year"></select>年<select class="month"></select>月<select class="date"></select>日</li>
                            <li><div>个人简介</div><textarea type="text" class="userIntroduce" placeholder="请输入个人简介"></textarea></li>
                            <li>注册邮箱<input type="text" class="userEmail" name="userEmail"/></li>
                        </ul>
                         <input class="saveChangeUserImf" type="image" src="front/image/UserSet_image/savePhoto1.png"/>
                        <input onClick="panelClose(4);" class="closeComplie2" type="image" src="front/image/UserSet_image/closebtn1.png" />
                    </div>
                </li>
                
                <li id="perInfo5">个人标签<span class="span1">****</span><a href="javascript: panelOpen(5);">编辑</a></li>
                <li style="display:none;background:#fff;height:290px" id="perInfo_panel5">个人标签<a href="javascript: panelClose(5);">收起</a>
                	<div>
                    	<span class="addLabelSpan">添加描述职业，兴趣爱好等方面的词语，让更多人找到你，让你找到更多同类</span><br/>
                        <span class="labelName">标签</span><div class="userLabelList"><div class="userLabel">搞笑幽默</div><div class="userLabel">90后</div></div><br/>
                        <span class="addLabelName">你可能感兴趣的标签:</span><div class="addUserLabelList"><div class="addUserLabel">搞笑幽默</div><div class="addUserLabel">90后</div></div>
                        <a class="changeAddLabel">换一换</a>
                        <input class="saveAddUserLabel" type="image" src="front/image/UserSet_image/savePhoto1.png"/>
                        <input onClick="panelClose(5);" class="closeComplie3" type="image" src="front/image/UserSet_image/closebtn1.png" />
                    </div>
                </li>
                
                
            </ul>
        </div>
    </div>
    
</body>
<script type="text/javascript">
    $(function(){
    	$.post("user/userset?WBUid="+$("#hiddenid").val());
    });
    
    function saveChangeUserName(){
    	$.post("user/saveChangeUserName",{"newName":$("#newName").val(),"WBUid":$("#hiddenid").val()},function(data){
    		alert(data);
    	})
    }
    
    function checkTelPhone(){
    	var telphone=$("#hiddenphone").val();
    	$("#telphone").html(telphone.substring(0,3)+"****"+telphone.substring(7,11));
    }
    </script>
 
</html>