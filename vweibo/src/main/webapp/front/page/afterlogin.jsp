<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.yc.weibo.entity.WeiBoUser" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<base href="/vweibo/">
<title>登录后的页面</title>
<link type="text/css" rel="stylesheet" href="front/css/afterlogin.css"/>
<script src="front/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="front/js/afterlogin.js"></script>
</head>

<%
	HttpSession sessions = request.getSession();
	WeiBoUser user = (WeiBoUser)sessions.getAttribute("user");
	
%>
<body id="bg">
	<div id="header">
    	<img class="head_logo" src="front/image/head_logo_sh_mini.png"/>
        <div class="searchTextBorder">
        	<input type="text" class="searchText" placeholder="微微一笑很倾城" onClick="searchClick()" onBlur="searchBlur()"/>
            <a href="javascript:void(0)" class="search_pic"></a>
        </div>
        <ul>
        	<li><a href="javascript:void(0)" class="homePage">首页</a></li>
            <li><a href="javascript:void(0)" class="videoPage">视频</a></li>
            <li><a href="javascript:void(0)" class="foundPage">发现</a></li>
            <li><a href="javascript:void(0)" class="gamePage">游戏</a></li>
            <li><a href="javascript:void(0)" class="personPage"><%=user.getUname() %></a></li>
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
        	<p>
                <span id="s1"><img src="front/image/weibonav.png"/></span>
                <a href="javascript:void(0)"><span id="s2" style="color:red;">王宝强，马蓉离婚案</span></a>
        	</p>
       		<textarea class="W_input" id="txt" title="微博输入框" name="" node-type="textE1" content=""></textarea>
        	<a href="javascript:void(0)" id="wword"><img src="front/image/write_img1.png" id="wimg"/>表情</a>
            <a href="javascript:void(0)" id="wword"><img src="front/image/write_img2.png" id="wimg"/>图片</a>
            <a href="javascript:void(0)" id="wword"><img src="front/image/write_img3.png" id="wimg"/>视频</a>
            <a href="javascript:void(0)" id="wword"><img src="front/image/write_img4.png" id="wimg"/>话题</a>
            <a href="javascript:void(0)" id="wword"><img src="front/image/write_img5.png" id="wimg"/>头条文章</a>
            <a href="javascript:void(0)" id="wword"><img src="front/image/write_img6.png" id="wimg"/></a>
            
            <a href="javascript:void(0)" id="aa" onClick='showhidediv("choose")'>公开<img src="front/image/limits_img5.png"/></a>
            <input name="imgbtn" type="image" src="front/image/write_img7.png" id="fabu">	
            
            <div id="choose" style="display:none;" onMouseUp="hidediv()">
            	<ul>
					<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:85px;height:2px;"><img src="front/image/limits_img1.png" id="limits_img"/><li class="c1" id="choose1" onClick="changeword()" style="height:10px;"/>公开</li></a><br>
                    <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:85px;height:2px;"><img src="front/image/limits_img2.png" id="limits_img"/><li class="c1" id="choose2" onClick="changeword1()" style="height:10px;">好友圈</li></a><br>
                   	<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:85px;height:2px;"><img src="front/image/limits_img3.png" id="limits_img"/><li class="c1" id="choose3" onClick="changeword2()" style="height:10px;">仅自己可见</li></a>
                    <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:85px;height:2px;"><img src="front/image/limits_img4.png" id="limits_img"/><li class="c1" id="choose4" onClick="changeword3()" style="height:10px;">群可见</li></a>
                </ul>
           
            </div>
    	</div>
        
        <div id="navigation" style="display:block">
        	<a href="javascript:void(0)" id="na1">全部</a>
            <a href="javascript:void(0)" id="na1">原创</a>
            <a href="javascript:void(0)" id="na1">视频</a>
            <a href="javascript:void(0)" id="na1">图片</a>
            <a href="javascript:void(0)" id="na1">音乐</a>
            <a href="javascript:void(0)" id="na1">文章</a>
            <div id="nav_search">
                <input type="text" id="search_text" placeholder="搜索我关注人的微博"/>
                <a href="javascript:void(0)"><img src="front/image/icon_search.png" id="nav-search"/></a>
                <a href="javascript:void(0)" id="nav-icon" onMouseOver="changecolor()" onMouseOut="changecolors()" onClick='changesupersearch(1)'><img src="front/image/navigation_icon.png"/></a>
    		</div>
        </div>
        
        <div id="supersearch" style="display:none;background: #FFF;position: relative;top:10px">
            <p style="font-size:14px;font-weight:bold; margin-left:20px;position:relative;top:10px;">高级搜索</p>
            <a href="javascript:void(0)" id="superdivclose" onMouseOut="superdivcloseimg('superdivclose')" onClick="changesupersearch(2)" onMouseOver="superdivcloseimg2('superdivclose')"><img src="front/image/superdivclose.png" id="closepng"></a>
           	类&nbsp;&nbsp;&nbsp;型：<input type="checkbox" id="check" checked="checked" style="margin-top:30px;"/>原创
           	<input type="checkbox" checked="checked" id="check"/>转发&nbsp;&nbsp;
           	<input type="checkbox" checked="checked" id="check"/>纯文字&nbsp;&nbsp;
           	<input type="checkbox" checked="checked" id="check"/>含图片&nbsp;&nbsp;
           	<input type="checkbox" checked="checked" id="check"/>含视频&nbsp;&nbsp;
           	<input type="checkbox" checked="checked" id="check"/>含音乐&nbsp;&nbsp;
           	<input type="checkbox" checked="checked" id="check"/>含文章<br>
           	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;关键字：<input type="text" id="keyword" placeholder="查找我关注人的微博" style="margin-top:10px;height:28px;"/><br>
           	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时&nbsp;&nbsp;&nbsp;间：<input type="text" id="dateone" placeholder="选择日期" style="margin-top:10px;height:28px;"/>&nbsp;到&nbsp;<input type="text" id="datetwo" placeholder="2016-08-30" style="height:28px;"/><br>
           	<input type="image" src="front/image/supersearch.png" id="searchbtn" style="position:relative;left:70px;margin-top:20px;"/>
        </div>
       
        <div id="center-part-content_01" style="margin-top:20px;">
            	<a href="javascript:void(0)" id="center-part_img"><img title="啦啦啦" src="front/image/defaultPhoto2.png"/></a>
                <a href="javascript:void(0)" class="center-part_way" id="center-part_way" onClick='showcenterhidediv("center-partchoose")' onMouseOver="changecentercolor('center-part_way')" onMouseOut="changecentercolors('center-part_way')"><img src="front/image/conter-part_wayimg01.png"/></a>
                    <div style="display:none;" class="center-partchoose"  id="center-partchoose" onMouseUp="hidecenterdiv('center-partchoose')">
                        <ul>
                            <li class="center-partc1" id="center-partchoose1" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">帮上头条</a></li><br>
                           <li class="center-partc1" id="center-partchoose2" style="height:20px;width:130px;"> <a href="javascript:void(0)" id="center-parta1">屏蔽</a></li><br>
                            <li class="center-partc1" id="center-partchoose3" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">取消关注</a></li>
                           <li class="center-partc1" id="center-partchoose4" style="height:20px;width:130px;"> <a href="javascript:void(0)" id="center-parta1">举报</a></li>
                        </ul>
                	</div>
   
                <ul id="center-part_ul" style="width:180px;position:relative;left:-140px;">
                	<li id="center-part_li" style="height:15px;width:50px;">APP菌</li>
                    <li style="height:15px;width:150px;"><a href="javascript:void(0)">8</a>分钟前 来自 weibo.com</li>
                </ul>
                <p id="center-part_p" style="width:500px;position:relative;left:29px;">【The Clocks】跟Fliqlo类似，都是拍照时候的背景神器[
                doge]！而且相比<br>之下TheClocks有数字和指针两种形式，还可以设定闹铃中区也有，而且free<br>帮APP菌卖安利#</p>
               <div id="content_img01"><img src="front/image/content_img01.jpg" style="width:150px;height:160px;"/></div>
               
               <div id="center_footnum">
                   <a href="javascript:void(0)" id="center_footnum1"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>
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
                            <li class="center-partc1" id="center-partchoose1" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">帮上头条</a></li><br>
                           <li class="center-partc1" id="center-partchoose2" style="height:20px;width:130px;"> <a href="javascript:void(0)" id="center-parta1">屏蔽</a></li><br>
                            <li class="center-partc1" id="center-partchoose3" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">取消关注</a></li>
                           <li class="center-partc1" id="center-partchoose4" style="height:20px;width:130px;"> <a href="javascript:void(0)" id="center-parta1">举报</a></li>
                        </ul>
                	</div>
   
                <ul id="center-part_ul" style="width:180px;position:relative;left:-140px;">
                	<li id="center-part_li" style="height:15px;width:50px;">APP菌</li>
                    <li style="height:15px;width:150px;"><a href="javascript:void(0)">8</a>分钟前 来自 weibo.com</li>
                </ul>
                <p id="center-part_p" style="width:500px;position:relative;left:29px;">【The Clocks】跟Fliqlo类似，都是拍照时候的背景神器[
                doge]！而且相比<br>之下TheClocks有数字和指针两种形式，还可以设定闹铃中区也有，而且free<br>帮APP菌卖安利#</p>
               <div id="content_img01"><img src="front/image/content_img01.jpg" style="width:150px;height:160px;"/></div>
               
               <div id="center_footnum">
                   <a href="javascript:void(0)" id="center_footnum1"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>
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
                            <li class="center-partc1" id="center-partchoose1" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">帮上头条</a></li><br>
                           <li class="center-partc1" id="center-partchoose2" style="height:20px;width:130px;"> <a href="javascript:void(0)" id="center-parta1">屏蔽</a></li><br>
                            <li class="center-partc1" id="center-partchoose3" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">取消关注</a></li>
                           <li class="center-partc1" id="center-partchoose4" style="height:20px;width:130px;"> <a href="javascript:void(0)" id="center-parta1">举报</a></li>
                        </ul>
                	</div>
   
                <ul id="center-part_ul" style="width:180px;position:relative;left:-140px;">
                	<li id="center-part_li" style="height:15px;width:50px;">APP菌</li>
                    <li style="height:15px;width:150px;"><a href="javascript:void(0)">8</a>分钟前 来自 weibo.com</li>
                </ul>
                <p id="center-part_p" style="width:500px;position:relative;left:29px;">【The Clocks】跟Fliqlo类似，都是拍照时候的背景神器[
                doge]！而且相比<br>之下TheClocks有数字和指针两种形式，还可以设定闹铃中区也有，而且free<br>帮APP菌卖安利#</p>
               <div id="content_img01"><img src="front/image/content_img01.jpg" style="width:150px;height:160px;"/></div>
               
               <div id="center_footnum">
                   <a href="javascript:void(0)" id="center_footnum1"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>
                   <a href="javascript:void(0)" id="center_footnum2"><img src="front/image/center-part_foot02.png" id="foot01_img"/>204</a>
                   <a href="javascript:void(0)" id="center_footnum3"><img src="front/image/center-part_foot03.png" id="foot01_img"/>45</a>
                   <a href="javascript:void(0)" id="center_footnum4"><img src="front/image/center-part_foot04.png" id="foot01_img"/>765</a>
               </div>
        </div>
       
    </div>  
    
    <div id="right-part">
    	<div id="right-part-content">
        	<a href="javascript:void(0)" id="user_img"><img src="front/image/userimg.jpg"/></a>
            <a href="javascript:void(0)" id="user_name">巴拉拉</a>
            <a href="javascript:void(0)" id="vip_img"><img src="front/image/vip_logo.jpg"/></a>
            <div id="levelimg">
            	<a href="javascript:void(0)" id="level">Lv.10</a>
            </div>
            <div id="usernum">
                <a href="javascript:void(0)" id="usernumone"><font id="num">209</font>关注</a>
                <a href="javascript:void(0)" id="usernumone"><font id="num">29</font>粉丝</a>
                <a href="javascript:void(0)" id="usernumone"><font id="num">129</font>微博</a>
            </div>
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

