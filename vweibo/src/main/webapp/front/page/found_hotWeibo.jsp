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
        </div>
    </div>
    <div id="logoArea">
    	<img class="logo1" src="../image/found_image/logoArea_logo.png">
        <img class="logo2" src="../image/found_image/logoArea_word.png">
    </div>
    <div id="wrap">
    	<div id="left">
        	<ul>
            	<li><a href="#" style="background:#A7B9D3">热门微博</a></li>
                <li><a href="#">微话题</a></li>
                <li><a href="#">找人</a></li>
                <li><a href="#">听歌</a></li>
                <li><a href="#">视频</a></li>               
                <li><a href="#">新闻</a></li>
            </ul>
        </div>
       	<div id="hot_right"  style="display:none">
        	<div class="hot_one">
            	<div class="hot_menu">
                	<a href="#" class="hot_menu_reco">推荐</a>
                    <a href="#" class="hot_menu_hot">热门微博榜</a>
                    <a href="#" class="hot_menu_list">分类</a>
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
        <div id="topic_right" style="display:none">
        	<div class="topic_one">
            	<div class="topic_time">
                	<a href="#" class="topic_time_1hour">1小时</a><!--98+2*30+2-->
                    <a href="#" class="topic_time_24hour">24小时</a>
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
                	<a href="#" class="find_menu_home">首页</a>
                    <a href="#" class="find_menu_24hot">24H热门</a>
                    <a href="#" class="find_menu_reco">推荐关注</a>
                    <a href="#" class="find_menu_more">更多</a>
                    
                </div>
                <div class="find_content">
               		<div class="find_menu_list"></div>
                    <div class="find_content_detail">c</div>
                    <div class="find_content_detail">c</div>
                    <div class="find_content_detail">c</div>
                </div>
            </div>
        </div>
    </div>
    <div id="footer"></div>
</body>
</html>
