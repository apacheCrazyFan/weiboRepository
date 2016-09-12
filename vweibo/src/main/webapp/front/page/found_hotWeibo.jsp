<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>发现-热门微博</title>
<link rel="shortcut icon" href="../image/title_logo.png">
<link rel="stylesheet" href="../css/found_hotWeibo.css">
<script src="../js/jquery-1.11.1.min.js"></script>
<script src="../js/found_hotWeibo.js"></script>
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
            <a href="http://localhost:8080/vweibo/front/page/helpArea.jsp" class="help_pic"></a>
        </div>
    </div>
    <div id="logoArea">
    	<img class="logo1" src="../image/found_image/logoArea_logo.png">
        <img class="logo2" src="../image/found_image/logoArea_word.png">
    </div>
    <div id="wrap">
    	<div id="left">
        	<ul>
            	<li><a href="javascript:openAndClose('.found_hot','#hot_right');" class="found_hot" style="background:#A7B9D3">热门微博</a></li>
                <li><a href="javascript:openAndClose('.found_topic','#topic_right');" class="found_topic">微话题</a></li>
                <li><a href="javascript:openAndClose('.found_find','#find_right');" class="found_find">找人</a></li>
                <li><a href="javascript:openAndClose('.found_music','#music_right');" class="found_music">听歌</a></li>
                <li><a href="javascript:openAndClose('.found_video','#video_right');" class="found_video">视频</a></li>               
                <li><a href="javascript:openAndClose('.found_news','#news_right');" class="found_news">新闻</a></li>
            </ul>
        </div>
       	<div id="hot_right">
        	<div class="hot_one">
            	<div class="hot_menu">
                	<a href="javascript:hotMenuChange(0)" class="hot_menu_0">推荐</a>
                    <a href="javascript:hotMenuChange(1)" class="hot_menu_1">热门微博榜</a>
                    <a href="javascript:hotMenuChange(2)" class="hot_menu_2">分类</a>
                </div>
                <div class="hot_content">
                	<div class="hot_content_list"></div>
                    <div class="hot_content_detail">c</div>
                    <div class="hot_content_detail">c</div>
                    <div class="hot_content_detail">c</div>
                    <div class="hot_content_detail">c</div>
                    <div class="hot_content_detail">c</div>
                </div>
            </div>
            <div class="hot_two">
            	<div class="hot_two_head">热门微博分类</div>
                <div class="hot_two_content"></div>
            </div>
        </div>
        <div id="topic_right">
        	<div class="topic_one">
            	<div class="topic_time">
                	<a href="javascript:topicMenuChange(1)" class="topic_time_1">1小时</a><!--98+2*30+2-->
                    <a href="javascript:topicMenuChange(2)" class="topic_time_2">24小时</a>
                </div>
            	<div class="topic_content">
                	<div class="topic_content_detail">a</div><!--124-->
                    <div class="topic_content_detail">a</div>
                    <div class="topic_content_detail">a</div>
                    <div class="topic_content_detail">a</div>
                </div>
                <div class="topic_page">分页</div>
            </div>
        </div>
        <div id="find_right">
        	<div class="find_one">
            	<div class="find_menu">
                	<a href="javascript:findMenuChange(0)" class="find_menu_0">首页</a>
                    <a href="javascript:findMenuChange(1)" class="find_menu_1">24H热门</a>
                    <a href="javascript:findMenuChange(2)" class="find_menu_2">推荐关注</a>
                    <a href="javascript:findMenuChange(3)" class="find_menu_3">更多</a>
                    
                </div>
                <div class="find_content">
               		<div class="find_menu_list"></div>
                    <div class="find_content_detail">c</div>
                    <div class="find_content_detail">c</div>
                    <div class="find_content_detail">c</div>
                </div>
            </div>
        </div>
        <div id="music_right"><!--▶＞＜-->
        	<div class="music_one">
            	<div class="music_menu"><!--图片滚动 660*185-->
                	
                </div>
                <div class="music_content">
                	<div class="music_content_detail">a</div>
                    <div class="music_content_detail">a</div>
                    <div class="music_content_detail">a</div>
                </div>
            </div>
        </div>
        <div id="video_right">
        	<div class="video_one">
            	<div class="video_menu">
                	<a href="javascript:videoMenuChange(0)" class="video_menu_0">首页</a>
                    <a href="javascript:videoMenuChange(1)" class="video_menu_1">明星制造</a>
                    <a href="javascript:videoMenuChange(2)" class="video_menu_2">女神秀</a>
                    <a href="javascript:videoMenuChange(3)" class="video_menu_3">搞笑创意</a>
                    <a href="javascript:videoMenuChange(4)" class="video_menu_4">电视剧</a>
                    <a href="javascript:videoMenuChange(5)" class="video_menu_5">综艺</a>
                    <a href="javascript:videoMenuChange(6)" class="video_menu_6">动漫</a>
                </div>
                <div class="video_content">
                	<div class="video_content_detail">a</div>
                    <div class="video_content_detail">a</div>
                    <div class="video_content_detail">a</div>
                    <div class="video_content_detail">a</div>
                </div>
            </div>
        </div>
        <div id="news_right">
        	<div class="news_one">
            	<div class="news_content">
                	<div class="news_content_detail">b</div>
                    <div class="news_content_detail">b</div>
                    <div class="news_content_detail">b</div>
                    <div class="news_content_detail">b</div>
                    <div class="news_content_detail">b</div>
                    <div class="news_content_detail">b</div>
                </div>
                <div class="news_page">
                </div>
            </div>
        </div>
    </div>
    <div id="footer"></div>
</body>
</html>
