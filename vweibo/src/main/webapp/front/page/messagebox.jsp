<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>享悦-我的消息箱</title>
<link rel="shortcut icon" href="../image/title_logo.png">
<link rel="stylesheet" href="../css/messagebox.css">
<script src="../js/jquery-1.11.1.min.js"></script>
<script src="../js/messagebox.js"></script>
</head>

<body>

	<div id="header">
    	<img class="head_logo" src="../image/found_image/head_logo_sh_mini.png"/>
        <div class="searchTextBorder">
        	<input type="text" class="searchText" placeholder="微微一笑很倾城" onClick="searchClick()" onBlur="searchBlur()"/>
            <a href="#" class="search_pic"></a>
        </div>
        <ul>
        	<li><a href="#" class="homePage">首页</a></li>
            <li><a href="#" class="videoPage">视频</a></li>
            <li><a href="#" class="foundPage">发现</a></li>
            <li><a href="#" class="gamePage">游戏</a></li>
            <li><a href="#" class="personPage">爱敲代码的妖未初</a></li>
        </ul>
        <div class="settingArea">
        	<a href="http://localhost:8080/vweibo/front/page/messagebox.jsp" class="message_pic"></a>
            <a href="http://localhost:8080/vweibo/front/page/UserSet.jsp" class="setting_pic"></a>
            <a href="#" class="sendMess_pic"></a>
            <a href="http://localhost:8080/vweibo/front/page/helpArea.jsp" class="help_pic"></a>
        </div>
    </div>
    
    <div id="wrap">
        
        <div id="right4">
            <div class="center0"  >
                <div class="center_head1">
                    <a class="priLetter">私信</a>
                </div>
                <div class="center_content4">
                    <img src="../image/messagebox_image/talkBg.jpg"/><br/>
                </div>
            </div>
            <div class="center2" style="display:none">
            	<div class="center_head2">
                	<a href="javascript:returnChatList()"></a>
                    <span>与<b class="talkToWho">某某</b>对话中</span>
                </div>
                <div class="chatContent" style="overflow:scroll;overflow-x:hidden">
                	
                </div>
                <div class="chatConfirm">
                	<textarea class="chatText"></textarea>
                	<!-- <a href="javascript:showLittleWin('#ifDelete')" class="cleanAll">清空所有私信</a> -->
                    <input type="image" onClick="sendMessage()" class="sendChatBtn" src="../image/messagebox_image/sendChatBtn1.jpg"/>
                </div>
            </div>
            <div class="linkman">
            	<span class="linkmanW">▷联系人◁</span>
                <ul class="linkmanList">
                	
                </ul>
            </div>
		</div>
        
         <div id="ifDelete" style="display:none">
        	<b>提示<a class="closeBtn" href="javascript:closeWindow('#ifDelete')"></a></b>
            <img src="../image/messagebox_image/icon_if.jpg"/>
            <span>是否确认删除与该联系人的消息记录？</span>
            <p>
            	<a href="javascript:deleteMessage(myid,hisid)" style="background:#F60;color:#fff">确定</a>
                <a href="javascript:closeWindow('#ifDelete')">取消</a>
            </p>
        </div>
    </div>
</body>
</html>
    