<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<base href="/vweibo/front/" />
<head>
<base href="/vweibo/front/">
<title>登录后的页面</title>
<link type="text/css" rel="stylesheet" href="css/afterlogin.css"/>
<script src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/afterlogin.js"></script>
</head>

<body id="bg">
<div id="login-main-head">
    <div id="logo"></div>
    <div id="search">
        <input type="text" id="search-text" placeholder="大家正在搜：定个小目标，先赚个一亿"/>
        <a href="javascript:void(0)"><img src="image/icon_search.png" id="search-icon"/></a>
    </div>
    
    <div id="something" class="headSon">
        <ul id="headDetail">      
            <li class="something_a1" style="height:10px;" ><a href="javascript:void(0)" id="changeheaderpng1" onMouseOver="changeheaderimg1('changeheaderpng1')" onMouseOut="changeheaderimgs1('changeheaderpng1')"><img src="image/index.png"/></a></li>
            <li class="something_a2" style="height:10px;"><a href="javascript:void(0)" id="changeheaderpng2" onMouseOver="changeheaderimg2('changeheaderpng2')" onMouseOut="changeheaderimgs2('changeheaderpng2')"><img src="image/found.png"/></a></li>
            <li class="something_a3" style="height:10px;"><a href="javascript:void(0)" id="changeheaderpng3"  onMouseOver="changeheaderimg3('changeheaderpng3')" onMouseOut="changeheaderimgs3('changeheaderpng3')"><img src="image/game.png"/></a></li>
            <li id="weiboname" style="height:0px;"><a href="javascript:void(0)" id="changeheaderpng4"  onMouseOver="changeheaderimg4('changeheaderpng4')" onMouseOut="changeheaderimgs4('changeheaderpng4')"><img src="image/people.png"/><span id="username1">王大大大啊aa</span></a></li>
        </ul> 
     </div>
     
     <div id="MsgAndSetting" class="headSon">
        <ul class="headDetails" id="headDetails">
            <li><a href="javascript:void(0)" id="changeheaderpng5" onMouseOver="changeheaderimg5('changeheaderpng5')" onMouseOut="changeheaderimgs5('changeheaderpng5')"><img src="image/chat.png"/></a></li>
            <li><a href="javascript:void(0)" id="changeheaderpng6" onMouseOver="changeheaderimg6('changeheaderpng6')" onMouseOut="changeheaderimgs6('changeheaderpng6')"><img src="image/set.png"/></a></li>
            <li><a href="javascript:void(0)"><img src="image/write.png"/></a></li>
        </ul>
        </div>
    
</div>
	
<div id="frame">
	<div id="left-part">
    	
        <ul id="left-part-content">
            <li><a href="javascript:void(0)" id="one">首页</a></li>
            <li><a href="javascript:void(0)" id="two">我的收藏</a></li>
            <li><a href="javascript:void(0)" id="two">我的赞</a></li>
            <li><img src="image/afterlogin_logo1.jpg" class="img"/><a href="javascript:void(0)" id="two">热门微博</a></li>
            <li><img src="image/afterlogin_logo2.jpg" class="img1"/><a href="javascript:void(0)" id="two">好友圈</a></li>
            <li><img src="image/afterlogin_logo3.jpg" class="img1"/><a href="javascript:void(0)" id="two">群微博</a></li>
            <li><img src="image/afterlogin_logo4.jpg" class="img"/><a href="javascript:void(0)" id="two">特别关注</a></li>
            <li><img src="image/afterlogin_logo5.jpg" class="img2"/><a href="javascript:void(0)" id="two">大学</a></li>
            <li><img src="image/afterlogin_logo5.jpg" class="img2"/><a href="javascript:void(0)" id="two">搞笑</a></li>
            <li><img src="image/afterlogin_logo5.jpg" class="img2"/><a href="javascript:void(0)" id="two">时尚</a></li>
        </ul>
        
    </div>
    <div id="center-part">
    	<div id="center-part-content">
        	<p>
                <span id="s1"><img src="image/weibonav.png"/></span>
                <a href="javascript:void(0)"><span id="s2" style="color:red;">王宝强，马蓉离婚案</span></a>
        	</p>
       		<textarea class="W_input" id="txt" title="微博输入框" name="" node-type="textE1" content=""></textarea>
        	<a href="javascript:void(0)" id="wword"><img src="image/write_img1.png" id="wimg"/>表情</a>
            <a href="javascript:void(0)" id="wword"><img src="image/write_img2.png" id="wimg"/>图片</a>
            <a href="javascript:void(0)" id="wword"><img src="image/write_img3.png" id="wimg"/>视频</a>
            <a href="javascript:void(0)" id="wword"><img src="image/write_img4.png" id="wimg"/>话题</a>
            <a href="javascript:void(0)" id="wword"><img src="image/write_img5.png" id="wimg"/>头条文章</a>
            <a href="javascript:void(0)" id="wword"><img src="image/write_img6.png" id="wimg"/></a>
            
            <a href="javascript:void(0)" id="aa" onClick='showhidediv("choose")'>公开<img src="image/limits_img5.png"/></a>
            <input name="imgbtn" type="image" src="image/write_img7.png" id="fabu">	
            
            <div id="choose" style="display:none;" onMouseUp="hidediv()">
            	<ul>
					<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:85px;height:2px;"><img src="image/limits_img1.png" id="limits_img"/><li class="c1" id="choose1" onClick="changeword()" style="height:10px;"/>公开</li></a><br>
                    <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:85px;height:2px;"><img src="image/limits_img2.png" id="limits_img"/><li class="c1" id="choose2" onClick="changeword1()" style="height:10px;">好友圈</li></a><br>
                   	<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:85px;height:2px;"><img src="image/limits_img3.png" id="limits_img"/><li class="c1" id="choose3" onClick="changeword2()" style="height:10px;">仅自己可见</li></a>
                    <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:85px;height:2px;"><img src="image/limits_img4.png" id="limits_img"/><li class="c1" id="choose4" onClick="changeword3()" style="height:10px;">群可见</li></a>
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
                <a href="javascript:void(0)"><img src="image/icon_search.png" id="nav-search"/></a>
                <a href="javascript:void(0)" id="nav-icon" onMouseOver="changecolor()" onMouseOut="changecolors()" onClick='changesupersearch("supersearch")'><img src="image/navigation_icon.png"/></a>
    		</div>
        </div>
        
        <div id="supersearch">
            <p style="font-size:14px;font-weight:bold; margin-left:20px;position:relative;top:10px;">高级搜索</p>
           	&nbsp;&nbsp;&nbsp;&nbsp;类&nbsp;&nbsp;&nbsp;型：<input type="checkbox" id="check" checked="checked" style="margin-top:30px;"/>原创&nbsp;&nbsp;
           	<input type="checkbox" checked="checked" id="check"/>转发&nbsp;&nbsp;
           	<input type="checkbox" checked="checked" id="check"/>纯文字&nbsp;&nbsp;
           	<input type="checkbox" checked="checked" id="check"/>含图片&nbsp;&nbsp;
           	<input type="checkbox" checked="checked" id="check"/>含视频&nbsp;&nbsp;
           	<input type="checkbox" checked="checked" id="check"/>含音乐&nbsp;&nbsp;
           	<input type="checkbox" checked="checked" id="check"/>含文章<br>
           	&nbsp;&nbsp;&nbsp;&nbsp;关键字：<input type="text" id="keyword" placeholder="查找我关注人的微博" style="margin-top:10px;"/><br>
           	&nbsp;&nbsp;&nbsp;&nbsp;时&nbsp;&nbsp;&nbsp;间：<input type="text" id="dateone" placeholder="选择日期" style="margin-top:10px;"/>&nbsp;到&nbsp;<input type="text" id="datetwo" placeholder="2016-08-30" /><br>
           	<input type="button" value="搜索" id="searchbtn" style="position:relative;left:77px;margin-top:10px;"/>
         </div>
       
        <div id="center-part-content_01" style="margin-top:20px;">
            	<a href="javascript:void(0)" id="center-part_img"><img title="啦啦啦" src="image/defaultPhoto2.png"/></a>
                <a href="javascript:void(0)" class="center-part_way" id="center-part_way" onClick='showcenterhidediv("center-partchoose")' onMouseOver="changecentercolor('center-part_way')" onMouseOut="changecentercolors('center-part_way')"><img src="image/conter-part_wayimg01.png"/></a>
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
               <div id="content_img01"><img src="image/content_img01.jpg" style="width:150px;height:160px;"/></div>
               
               <div id="center_footnum">
                   <a href="javascript:void(0)" id="center_footnum1"><img src="image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>
                   <a href="javascript:void(0)" id="center_footnum2"><img src="image/center-part_foot02.png" id="foot01_img"/>204</a>
                   <a href="javascript:void(0)" id="center_footnum3"><img src="image/center-part_foot03.png" id="foot01_img"/>45</a>
                   <a href="javascript:void(0)" id="center_footnum4"><img src="image/center-part_foot04.png" id="foot01_img"/>765</a>
               </div>
        </div>
       
       <div id="center-part-content_01">
            	<a href="javascript:void(0)" id="center-part_img"><img src="image/defaultPhoto2.png"/></a>
                <a href="javascript:void(0)" class="center-part_way" id="center-part_way1" onClick='showcenterhidediv("center-part_choose1")' onMouseOver="changecentercolor('center-part_way1')" onMouseOut="changecentercolors('center-part_way1')"><img src="image/conter-part_wayimg01.png"/></a>
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
               <div id="content_img01"><img src="image/content_img01.jpg" style="width:150px;height:160px;"/></div>
               
               <div id="center_footnum">
                   <a href="javascript:void(0)" id="center_footnum1"><img src="image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>
                   <a href="javascript:void(0)" id="center_footnum2"><img src="image/center-part_foot02.png" id="foot01_img"/>204</a>
                   <a href="javascript:void(0)" id="center_footnum3"><img src="image/center-part_foot03.png" id="foot01_img"/>45</a>
                   <a href="javascript:void(0)" id="center_footnum4"><img src="image/center-part_foot04.png" id="foot01_img"/>765</a>
               </div>
        </div>
       
       <div id="center-part-content_01">
            	<a href="javascript:void(0)" id="center-part_img"><img src="image/defaultPhoto2.png"/></a>
                <a href="javascript:void(0)" class="center-part_way" id="center-part_way2" onClick='showcenterhidediv("center-part_choose2")' onMouseOver="changecentercolor('center-part_way2')" onMouseOut="changecentercolors('center-part_way2')"><img src="image/conter-part_wayimg01.png"/></a>
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
               <div id="content_img01"><img src="image/content_img01.jpg" style="width:150px;height:160px;"/></div>
               
               <div id="center_footnum">
                   <a href="javascript:void(0)" id="center_footnum1"><img src="image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>
                   <a href="javascript:void(0)" id="center_footnum2"><img src="image/center-part_foot02.png" id="foot01_img"/>204</a>
                   <a href="javascript:void(0)" id="center_footnum3"><img src="image/center-part_foot03.png" id="foot01_img"/>45</a>
                   <a href="javascript:void(0)" id="center_footnum4"><img src="image/center-part_foot04.png" id="foot01_img"/>765</a>
               </div>
        </div>
       
    </div>  
    
    <div id="right-part">
    	<div id="right-part-content">
        	<a href="javascript:void(0)" id="user_img"><img src="image/userimg.jpg"/></a>
            <a href="javascript:void(0)" id="user_name">巴拉拉</a>
            <a href="javascript:void(0)" id="vip_img"><img src="image/vip_logo.jpg"/></a>
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
    	<img alt="呼呼" src="image/weibofoot.png"/>
    </div>
        -->
</div>
</body>
</html>
