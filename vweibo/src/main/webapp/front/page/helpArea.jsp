<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>发现-热门微博</title>
<link rel="shortcut icon" href="../image/title_logo.png">
<link rel="stylesheet" href="../css/helpArea.css">
<script src="../js/jquery-1.11.1.min.js"></script>
<script src="../js/helpArea.js"></script>
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
    <div id="logoArea">
    	<img class="logo1" src="../image/helpArea_image/logoArea_logo.png">
        <img class="logo2" src="../image/helpArea_image/logoArea_logo1.png">
    </div>
    <div id="wrap">
    	<div id="wrap1">
        	<div id="left">
            	<div class="left_head">
                	<span class="left_headW">问题分类</span>
                </div>
                <ul>
                	<li class="question_list1" onMouseOver="listOver(1)" onMouseOut="listOut(1)">@享悦使用<span> > </span></li>
                    <li class="question_list2" onMouseOver="listOver(2)" onMouseOut="listOut(2)">@账号异常<span> > </span></li>
                    <li class="question_list3" onMouseOver="listOver(3)" onMouseOut="listOut(3)">@享悦会员<span> > </span></li>
                    <li class="question_list4" onMouseOver="listOver(4)" onMouseOut="listOut(4)">@推荐发现<span> > </span></li>
                </ul>
            </div>
            <div id="right">
            	<div class="list_detail">
                	<div class="list_detail1">
                    	<a href="">注册微博</a>
                        <a href="">访问</a>
                        <a href="">微博收藏</a>
                    </div>
                    <div class="list_detail2">
                    	<a href="">关于密码</a>
                    </div>
                    <div class="list_detail3">
                    	<a href="">开通会员</a>
                    </div>
                    <div class="list_detail4">
                    	<a href="">微话题</a>
                        <a href="">热门微博</a>
                    </div>
                </div>
                <div id="content">
                
                </div>
            </div>
        </div>
    </div>
    <div id="footer"></div>
</body>
</html>
