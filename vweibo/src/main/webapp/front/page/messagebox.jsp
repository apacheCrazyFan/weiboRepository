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
        	<a href="#" class="message_pic"></a>
            <a href="#" class="setting_pic"></a>
            <a href="#" class="sendMess_pic"></a>
        </div>
    </div>
    
    <div id="wrap">
        <div id="left">
        	<span class="list_head">我的消息箱</span>
            <a href="javascript:messListClick(1)" class="mess_list1" style="background:url(../image/messagebox_image/icon_choose.png) no-repeat center left">@我的</a>
            <a href="javascript:messListClick(2)" class="mess_list2">评论</a>
            <a href="javascript:messListClick(3)" class="mess_list3">赞</a>
            <a href="javascript:messListClick(4)" class="mess_list4">私信</a>
        </div>
       
       	<div id="right1">
            <div class="center1">
                <div class="center_head1">
                    <a href="" class="aiteWeib">@我的微博</a>
                    <a href="" class="aiteComm">@我的评论</a>
                </div>
                <div class="center_content1">
                    <img src="../image/messagebox_image/icon_atten.jpg"/><br/>
                    <span>还没有人@到你，要加油哦！</span>
                </div>
            </div>
            <div class="tips">
            	<span class="tips_head">@使用小帮助</span>
                <span class="tips_ques">：什么是@提醒？</span>
                <p class="tips_answ">A:在享悦中@他人的昵称，如“@享悦小秘书”，他就会收到你@他的提醒。</p>
                <span class="tips_ques">：@太多怎样防骚扰？</span>
                <p class="tips_answ">A:你可以设置为仅接受关注的人发出的@信息。</p>
            </div>
		</div>
        
        <div id="right2" style="display:none">
            <div class="center1">
                <div class="center_head1">
                    <a href="" class="receiveComm">收到的评论</a>
                    <a href="" class="issueComm">发出的评论</a>
                </div>
                <div class="center_content2">
                    <img src="../image/messagebox_image/icon_atten.jpg"/><br/>
                    <span>还没有评论！</span>
                </div>
            </div>
            <div class="tips">
            	<span class="tips_head">评论使用小帮助</span>
                <span class="tips_ques">：评论太多，想分类看？</span>
                <p class="tips_answ">A：你可以通过分类筛选，只查看自己关注的人。</p>
                <span class="tips_ques">:不希望某些人评论自己？</span>
                <p class="tips_answ">A：可以设置仅关注的人才能给自己发评论。</p>
                 <span class="tips_ques">：不希望收到某些人的评论？</span>
                <p class="tips_answ">A：你可以设置评论的提醒范围。</p>
            </div>
		</div>
        
        <div id="right3" style="display:none">
            <div class="center1">
                <div class="center_head1">
                    <a class="receivePraise">收到的赞</a>
                </div>
                <div class="center_content3">
                    <img src="../image/messagebox_image/icon_atten.jpg"/><br/>
                    <span>还没有赞！</span>
                </div>
            </div>
            <div class="tips">
            	<span class="tips_head">赞使用小帮助</span>
                <span class="tips_ques">：什么是赞？</span>
                <p class="tips_answ">A：通过点亮图标的方式，来表达对一条微博信息的喜爱情感。</p>
                <span class="tips_ques">:怎样赞一条微博？</span>
                <p class="tips_answ">A：点击微博中与转发收藏评论平行的赞的图标，则完成对此条微博的赞。</p>
            </div>
		</div>
        
        <div id="right4" style="display:none">
            <div class="center1">
                <div class="center_head1">
                    <a class="priLetter">私信</a>
                </div>
                <div class="center_content4">
                    <img src="../image/messagebox_image/icon_atten.jpg"/><br/>
                    <span>还没有私信！</span>
                </div>
            </div>
            <div class="linkman">
            	<span class="linkmanW">▷联系人◁</span>
                <ul class="linkmanList">
                	<li class="linkList1"><a href="javascript:linkListClick(1)">特别关心（0）</a></li>
                    <div class="linkMan1">
                    	<span>偶的说的话</span>
                    </div>
                    <li class="linkList2"><a href="javascript:linkListClick(2)">同事（0）</a></li>
                     <div class="linkMan2">
                    	<span>偶的说的话</span>
                    </div>
                    <li class="linkList3"><a href="javascript:linkListClick(3)">同学（0）</a></li>
                     <div class="linkMan3">
                    	<span>偶的说的话</span>
                    </div>                    
                    <li class="linkList4"><a href="javascript:linkListClick(4)">明星（0）</a></li>
                    <div class="linkMan4">
                    	<span>偶的说的话</span>
                    </div>
                </ul>
            </div>
		</div>
        
    </div>
</body>
</html>
