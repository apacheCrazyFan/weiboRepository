<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<base href="/vweibo/">
<title>我的赞</title>
<link type="text/css" rel="stylesheet" href="front/css/praise.css"/>
<script src="front/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="front/js/praise.js"></script>
</head>

<body>
	<div id="header">
    	<img class="head_logo" src="front/image/head_logo_sh_mini.png"/>
        <div class="searchTextBorder">
        	<input type="text" class="searchText" placeholder="定个小目标，先赚个一亿" onClick="searchClick()" onBlur="searchBlur()"/>
            <a href="javascript:void(0)" class="search_pic"></a>
        </div>
        <ul>
        	<li><a href="javascript:void(0)" class="homePage">首页</a></li>
            <li><a href="javascript:void(0)" class="videoPage">视频</a></li>
            <li><a href="javascript:void(0)" class="foundPage">发现</a></li>
            <li><a href="javascript:void(0)" class="gamePage">游戏</a></li>
            <li><a href="javascript:void(0)" class="personPage">巴拉拉</a></li>
        </ul>
        <div class="settingArea">
        	<a href="javascript:void(0)" class="message_pic"></a>
            <a href="javascript:void(0)" class="setting_pic"></a>
            <a href="javascript:void(0)" class="sendMess_pic"></a>
        </div>
    </div>
	
<div id="frame">
	<div id="left-part">
    	
        <ul id="left-part-content">
            <li style="height:25px;"><a href="javascript:void(0)" id="one">首页</a></li>
            <li style="height:25px;"><a href="javascript:void(0)" id="two">我的收藏</a></li>
            <li style="height:25px;"><a href="javascript:void(0)" id="two">我的赞</a></li>
            <li style="height:25px;"><img src="front/image/afterlogin_logo1.jpg" class="img"/><a href="javascript:void(0)" id="two">热门微博</a></li>
            <li style="height:25px;"><img src="front/image/afterlogin_logo2.jpg" class="img1"/><a href="javascript:void(0)" id="two">好友圈</a></li>
            <li style="height:25px;"><img src="front/image/afterlogin_logo3.jpg" class="img1"/><a href="javascript:void(0)" id="two">群微博</a></li>
            <li style="height:25px;"><img src="front/image/afterlogin_logo4.jpg" class="img"/><a href="javascript:void(0)" id="two">特别关注</a></li>
            <li style="height:25px;"><img src="front/image/afterlogin_logo5.jpg" class="img2"/><a href="javascript:void(0)" id="two">大学</a></li>
            <li style="height:25px;"><img src="front/image/afterlogin_logo5.jpg" class="img2"/><a href="javascript:void(0)" id="two">搞笑</a></li>
            <li style="height:25px;"><img src="front/image/afterlogin_logo5.jpg" class="img2"/><a href="javascript:void(0)" id="two">时尚</a></li>
        </ul>
        
    </div>
    
    <div id="center-part">
    	<div id="center-part-content">
        	<a href="javascript:void(0)" id="na1" class="na1">赞过的微博</a>
        </div>
   	
       
        <div id="center-part-content_01" style="margin-top:20px;">
            	<a href="javascript:void(0)" id="center-part_img"><img title="啦啦啦" src="front/image/defaultPhoto2.png"/></a>
                <a href="javascript:void(0)" class="center-part_way" id="center-part_way" onClick='showcenterhidediv("center-partchoose")' onMouseOver="changecentercolor('center-part_way')" onMouseOut="changecentercolors('center-part_way')"><img src="front/image/conter-part_wayimg01.png"/></a>
                    <div style="display:none;" class="center-partchoose"  id="center-partchoose" onMouseUp="hidecenterdiv('center-partchoose')">
                        <ul>
                            <li class="center-partc1" id="center-partchoose1" style="height:20px;width:90px;margin-top:0px;"><a href="javascript:void(0)" id="center-parta1">帮上头条</a></li><br>
                           <li class="center-partc1" id="center-partchoose4" style="height:20px;width:90px;margin-top:30px;"><a href="javascript:void(0)" id="center-parta2">举报</a></li>
                        </ul>
                	</div>
   
                <ul id="center-part_ul" style="width:180px;position:relative;left:-140px;">
                	<li id="center-part_li" style="height:15px;width:50px;">APP菌</li>
                    <li style="height:15px;width:150px;"><a href="javascript:void(0)">8</a>分钟前 来自 weibo.com</li>
                </ul>
                <p id="center-part_p" style="width:500px;position:relative;left:29px;">【The Clocks】跟Fliqlo类似，都是拍照时候的背景神器[doge]！而且相比<br>之下TheClocks有数字和指针两种形式，还可以设定闹铃中区也有，而且free<br>帮APP菌卖安利#</p>
               <div id="content_img01"><img src="front/image/content_img01.jpg" style="width:150px;height:160px;position:relative;left:80px;"/></div>
               
               <div id="center_footnum">
                   <a href="javascript:void(0)" id="center_footnum1"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>已收藏</a>
                   <a href="javascript:void(0)" id="center_footnum2"><img src="front/image/center-part_foot02.png" id="foot01_img"/>204</a>
                   <a href="javascript:void(0)" id="center_footnum3"><img src="front/image/center-part_foot03.png" id="foot01_img"/>45</a>
                   <a href="javascript:void(0)" id="center_footnum4"><img src="front/image/center-part_foot04.png" id="foot01_img"/>765</a>
               </div>
        </div>
       
       <div id="center-part-content_01">
            	<a href="javascript:void(0)" id="center-part_img"><img src="front/image/defaultPhoto2.png"/></a>
                <a href="javascript:void(0)" class="center-part_way" id="center-part_way1" onClick='showcenterhidediv("center-part_choose1")' onMouseOver="changecentercolor('center-part_way1')" onMouseOut="changecentercolors('center-part_way1')"><img src="front/image/conter-part_wayimg01.png"/></a>
                    <div style="display:none;" class="center-partchoose" id="center-part_choose1" onMouseUp="hidecenterdiv('center-part_choose1')">
                        <ul>
                            <li class="center-partc1" id="center-partchoose1" style="height:20px;width:90px;margin-top:0px;"><a href="javascript:void(0)" id="center-parta1">帮上头条</a></li><br>
                           <li class="center-partc1" id="center-partchoose4" style="height:20px;width:90px;margin-top:30px;"><a href="javascript:void(0)" id="center-parta2">举报</a></li>
                        </ul>
                	</div>
   
                <ul id="center-part_ul" style="width:180px;position:relative;left:-140px;">
                	<li id="center-part_li" style="height:15px;width:50px;">APP菌</li>
                    <li style="height:15px;width:150px;"><a href="javascript:void(0)">8</a>分钟前 来自 weibo.com</li>
                </ul>
                <p id="center-part_p" style="width:500px;position:relative;left:29px;">【The Clocks】跟Fliqlo类似，都是拍照时候的背景神器[doge]！而且相比<br>之下TheClocks有数字和指针两种形式，还可以设定闹铃中区也有，而且free<br>帮APP菌卖安利#</p>
               <div id="content_img01"><img src="front/image/content_img01.jpg" style="width:150px;height:160px;position:relative;left:80px;"/></div>
               
               <div id="center_footnum">
                   <a href="javascript:void(0)" id="center_footnum1"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>已收藏</a>
                   <a href="javascript:void(0)" id="center_footnum2"><img src="front/image/center-part_foot02.png" id="foot01_img"/>204</a>
                   <a href="javascript:void(0)" id="center_footnum3"><img src="front/image/center-part_foot03.png" id="foot01_img"/>45</a>
                   <a href="javascript:void(0)" id="center_footnum4"><img src="front/image/center-part_foot04.png" id="foot01_img"/>765</a>
               </div>
        </div>
       
       <div id="center-part-content_01">
            	<a href="javascript:void(0)" id="center-part_img"><img src="front/image/defaultPhoto2.png"/></a>
                <a href="javascript:void(0)" class="center-part_way" id="center-part_way2" onClick='showcenterhidediv("center-part_choose2")' onMouseOver="changecentercolor('center-part_way2')" onMouseOut="changecentercolors('center-part_way2')"><img src="front/image/conter-part_wayimg01.png"/></a>
                    <div style="display:none;" class="center-partchoose"  id="center-part_choose2" onMouseUp="hidecenterdiv('center-part_choose2')">
                        <ul>
                            <li class="center-partc1" id="center-partchoose1" style="height:20px;width:90px;margin-top:0px;"><a href="javascript:void(0)" id="center-parta1">帮上头条</a></li><br>
                           <li class="center-partc1" id="center-partchoose4" style="height:20px;width:90px;margin-top:30px;"><a href="javascript:void(0)" id="center-parta2">举报</a></li>
                        </ul>
                	</div>
   
                <ul id="center-part_ul" style="width:180px;position:relative;left:-140px;">
                	<li id="center-part_li" style="height:15px;width:50px;">APP菌</li>
                    <li style="height:15px;width:150px;"><a href="javascript:void(0)">8</a>分钟前 来自 weibo.com</li>
                </ul>
                <p id="center-part_p" style="width:500px;position:relative;left:29px;">【The Clocks】跟Fliqlo类似，都是拍照时候的背景神器[doge]！而且相比<br>之下TheClocks有数字和指针两种形式，还可以设定闹铃中区也有，而且free<br>帮APP菌卖安利#</p>
               <div id="content_img01"><img src="front/image/content_img01.jpg" style="width:150px;height:160px;position:relative;left:80px;"/></div>
               
               <div id="center_footnum">
                   <a href="javascript:void(0)" id="center_footnum1"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>已收藏</a>
                   <a href="javascript:void(0)" id="center_footnum2"><img src="front/image/center-part_foot02.png" id="foot01_img"/>204</a>
                   <a href="javascript:void(0)" id="center_footnum3"><img src="front/image/center-part_foot03.png" id="foot01_img"/>45</a>
                   <a href="javascript:void(0)" id="center_footnum4"><img src="front/image/center-part_foot04.png" id="foot01_img"/>765</a>
               </div>
        </div>
       
    </div>  
    
    <div id="right-part">
    	<div id="right-part-content">
        	<img src="front/image/praiseimg.png" id="right-part-contentimg" style="padding-top:10px;padding-left:15px;"/><span id="right-part_tip1">赞过的兴趣主页</span>
        </div>
        
        <div id="right-part-content01">
        	<div id="right-part_unline"><span id="right-part_tip2"><h4>微博意见反馈</h4></span></div>
            <span style="position:relative;left:15px;font-size:12px;">欢迎使用微博并提出宝贵建议。请<a href="javascript:void(0)" style="color:red;">点<br>击这里</a>提交微博意见反馈。</span>
			<ul style="position:relative;left:15px;font-size:12px;margin-top:5px;">
                <li style="height:0px;"><a href="javascript:void(0)" style="color:red;">微博常见问题</a></li>
                <li style="height:0px;"><a href="javascript:void(0)" style="color:red;">微博客服专区</a></li>
    		<ul>
   			<span style="position:relative;left:0px;font-size:12px;"><a href="javascript:void(0)" style="color:red;">全国人大常委会《关于加强网络信息<br>保护的决定》</a></span><br>
			<img src="front/image/advice_sos.png" style="margin-top:10px;"/><a href="javascript:void(0)" style="color:red;font-size:12px;position:relative;bottom:5px;">微博举报处理中心</a>
        </div>
    </div> 
    
    <!-- <div id="foot-part">
    	<img alt="呼呼" src="front/image/weibofoot.png"/>
    </div>
        -->
    <div id="buoys">
    	<img src="front/image/letterchat.png" id="buoysimg1"/><span id="buoyschat">私信聊天</span><img src="front/image/chatmes.png" id="buoysimg2"/>
    </div>
</div>
   
</body>
</html>