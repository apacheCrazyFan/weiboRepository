<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<base href="/vweibo/">
<title>我的收藏</title>
<link type="text/css" rel="stylesheet" href="front/css/collection.css"/>
<script src="front/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="front/js/collection.js"></script>
</head>

<body>
	<div id="login-main-head">
    <div id="logo"></div>
    <div id="search">
        <input type="text" id="search-text" placeholder="大家正在搜：定个小目标，先赚个一亿"/>
        <a href="javascript:void(0)"><img src="front/image/icon_search.png" id="search-icon"/></a>
    </div>
    
    <div id="something" class="headSon">
        <ul id="headDetail">      
            <li class="something_a1" style="height:10px;" ><a href="javascript:void(0)" id="changeheaderpng1" onMouseOver="changeheaderimg1('changeheaderpng1')" onMouseOut="changeheaderimgs1('changeheaderpng1')"><img src="front/image/index.png"/></a></li>
            <li class="something_a2" style="height:10px;"><a href="javascript:void(0)" id="changeheaderpng2" onMouseOver="changeheaderimg2('changeheaderpng2')" onMouseOut="changeheaderimgs2('changeheaderpng2')"><img src="front/image/found.png"/></a></li>
            <li class="something_a3" style="height:10px;"><a href="javascript:void(0)" id="changeheaderpng3"  onMouseOver="changeheaderimg3('changeheaderpng3')" onMouseOut="changeheaderimgs3('changeheaderpng3')"><img src="front/image/game.png"/></a></li>
            <li id="weiboname" style="height:0px;"><a href="javascript:void(0)" id="changeheaderpng4"  onMouseOver="changeheaderimg4('changeheaderpng4')" onMouseOut="changeheaderimgs4('changeheaderpng4')"><img src="front/image/people.png"/><span id="username1">王大大大啊aa</span></a></li>
        </ul> 
     </div>
     
     <div id="MsgAndSetting" class="headSon">
        <ul class="headDetails" id="headDetails">
            <li><a href="javascript:void(0)" id="changeheaderpng5" onMouseOver="changeheaderimg5('changeheaderpng5')" onMouseOut="changeheaderimgs5('changeheaderpng5')"><img src="front/image/chat.png"/></a></li>
            <li><a href="javascript:void(0)" id="changeheaderpng6" onMouseOver="changeheaderimg6('changeheaderpng6')" onMouseOut="changeheaderimgs6('changeheaderpng6')"><img src="front/image/set.png"/></a></li>
            <li><a href="javascript:void(0)"><img src="front/image/write.png"/></a></li>
        </ul>
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
        	<a href="javascript:void(0)" id="na1" class="na1">我的收藏（<span>共23条</span>）</a>
            <a href="javascript:void(0)" id="na1" class="na2">热门收藏</a>
            
            <div id="nav_search">
                <input type="text" id="search_text" placeholder="搜索我收藏的微博"/>
                <a href="javascript:void(0)"><img src="front/image/icon_search.png" id="nav-search"/></a>
    		</div>
           
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
               <div id="center-part_ps">
               		<a href="javascript:void(0)" id="center_ps" onClick="addlabel('keyword')">加标签</a>
              		<div id="keyword" style="width:350px;height:32px;display:none;">
                    	<input type="text" id="keyword_tip1" placeholder="仅限12个字 用空格隔开" style="width:350px;height:32px;background:;"/>
                        <input type="image" id="keyword_tip2" src="front/image/keyword_add.png"/>
                        <input type="image" id="keyword_tip2" src="front/image/keyword_cancel.png" onClick="disapper('keyword')"/>
                    </div>
               </div>
               <span id="collection_date">收藏于2月5日 18:36</span>
              
               
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
        	<img src="front/image/youbao.png" style="margin:10px;"><a id="right-part_tip1" style="color:red;position:relative;bottom:15px;font-size:14px;">导出收藏夹至有道云笔记</a>
        </div>
        
        <div id="right-part-content01">
        	<span id="right-part_tip2" style="position:relative;left:18px;top:10px;font-size:15px;font-weight:bold;">收藏使用小帮助</span><br>
            <span style="font-size:12px;position:relative;top:15px;left:5px;">
                B：为什么要收藏微博？<br>
                A：微博变化太快，看到好东西，还不赶快收藏下来！</span> <br>
            <span style="font-size:12px;position:relative;top:25px;left:5px;"> B：为什么要给收藏的微博加标签？<br>
                   A：加标签方便日后查找，同时系统也可以根据你的喜好进行微博推荐哦！</span>
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