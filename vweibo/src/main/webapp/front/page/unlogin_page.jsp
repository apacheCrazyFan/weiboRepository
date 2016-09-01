<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<base href="/vweibo/">
<title>登录前的页面</title>
<link type="text/css" rel="stylesheet" href="front/css/unlogin_page.css"/>
<script src="front/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="front/js/unlogin.js"></script>
</head>


<body id="bg">
<div id="unlogin-main-head">
    	<div id="logo">
        	
        </div>
        <div id="search">
        	<input type="text" id="search-text"/>
        	<a href="javascript:void(0)"><img src="front/image/icon_search.png" id="search-icon"/></a>
        </div>
        <div id="registerandlogin">
        	<ul>
            	<li><a href="page/login.jsp" name="login" id="login">登录</a></li>
                <li><a href="page/register.jsp" name="register" id="register">注册</a></li>
            </ul>
        </div>
        
    </div>
	
<div id="frame">
	<div id="left-part">
    	<ul>
            <li class="one" style="height:35px;"><img src="front/image/left_01.png" class="img"/><a href="javascript:void(0)" id="two">推荐</a></li>
            <li style="height:32px;"><img src="front/image/left_02.png" class="img"/><a href="javascript:void(0)" id="two">明星</a></li>
            <li style="height:32px;"><img src="front/image/left_03.png" class="img"/><a href="javascript:void(0)" id="two">视频</a></li>
            <li style="height:32px;"><img src="front/image/left_04.png" class="img"/><a href="javascript:void(0)" id="two">搞笑</a></li>
            <li style="height:32px;"><img src="front/image/left_05.png" class="img"/><a href="javascript:void(0)" id="two">情感</a></li>
            <li style="height:32px;"><img src="front/image/left_06.png" class="img"/><a href="javascript:void(0)" id="two">社会</a></li>
            <li style="height:32px;"><img src="front/image/left_07.png" class="img"/><a href="javascript:void(0)" id="two">综艺</a></li>
            <li style="height:32px;"><img src="front/image/left_08.png" class="img"/><a href="javascript:void(0)" id="two">美妆</a></li>
            <li style="height:32px;"><img src="front/image/left_09.png" class="img"/><a href="javascript:void(0)" id="two">美食</a></li>
            <li style="height:32px;"><img src="front/image/left_10.png" class="img"/><a href="javascript:void(0)" id="two">更多</a></li>
		</ul>
    </div>
    <div id="center-part">
    	 <div id="center-part-content_01">
            	<a href="javascript:void(0)" id="center-part_img"><img src="front/image/defaultPhoto2.png"/></a>
                <a href="javascript:void(0)" class="center-part_way" id="center-part_way" onClick='showcenterhidediv("center-partchoose")' onMouseOver="changecentercolor('center-part_way')" onMouseOut="changecentercolors('center-part_way')"><img src="front/image/conter-part_wayimg01.png"/></a>
                    <div style="display:none;" class="center-partchoose"  id="center-partchoose" onMouseUp="hidecenterdiv('center-partchoose')">
                        <ul>
                            <li class="center-partc1" id="center-partchoose1" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">帮上头条</a></li><br />
                           <li class="center-partc1" id="center-partchoose2" style="height:20px;width:130px;"> <a href="javascript:void(0)" id="center-parta1">屏蔽</a></li><br />
                            <li class="center-partc1" id="center-partchoose3" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">取消关注</a></li>
                           <li class="center-partc1" id="center-partchoose4" style="height:20px;width:130px;"> <a href="javascript:void(0)" id="center-parta1">举报</a></li>
                        </ul>
                	</div>
   
                <ul id="center-part_ul">
                	<li id="center-part_li" style="height:15px;width:50px;">APP菌</li>
                    <li style="height:15px;width:150px;"><a href="javascript:void(0)">8</a>分钟前 来自 weibo.com</li>
                </ul>
                <p id="center-part_p">【The Clocks】跟Fliqlo类似，都是拍照时候的背景神器[
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
   
                <ul id="center-part_ul">
                	<li id="center-part_li" style="height:15px;width:50px;">APP菌</li>
                    <li style="height:15px;width:150px;"><a href="javascript:void(0)">8</a>分钟前 来自 weibo.com</li>
                </ul>
                <p id="center-part_p">【The Clocks】跟Fliqlo类似，都是拍照时候的背景神器[
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
                            <li class="center-partc1" id="center-partchoose1" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">帮上头条</a></li><br />
                           <li class="center-partc1" id="center-partchoose2" style="height:20px;width:130px;"> <a href="javascript:void(0)" id="center-parta1">屏蔽</a></li><br />
                            <li class="center-partc1" id="center-partchoose3" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">取消关注</a></li>
                           <li class="center-partc1" id="center-partchoose4" style="height:20px;width:130px;"> <a href="javascript:void(0)" id="center-parta1">举报</a></li>
                        </ul>
                	</div>
   
                <ul id="center-part_ul">
                	<li id="center-part_li" style="height:15px;width:50px;">APP菌</li>
                    <li style="height:15px;width:150px;"><a href="javascript:void(0)">8</a>分钟前 来自 weibo.com</li>
                </ul>
                <p id="center-part_p">【The Clocks】跟Fliqlo类似，都是拍照时候的背景神器[
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
        	<div class="nav">
                <span>快速登录</span>
                <span class="span2">账号密码登录</span>
        	</div>
        	<div class="content" style="position:relative;top:35px;">
        		<div class="content_top">
                    <form method="" action="">
                    <div class="webdiv"><input type="text" name="uname" id="web" placeholder="邮箱/会员账号/手机号登陆" /></div>
                    <div class="pwddiv"> <input type="password" name="pwd" id="pwd" placeholder="密码" /></div>
                    <div class="rember"><input type="checkbox" checked="checked" id="check"/>记住密码</div>
                    <div class="content_foot" style="position:relative;top:-8px;right:-2px;">
                    <a href="javascript:void(0)">忘记密码</a>
                    </div>
                    <div class="subdiv"><input type="submit" value="登录" id="sub" /></div>
                    </form>
            	</div>
                <div class="content_foot" style="position:relative;top:22px;right:10px;">
                    <a href="">还没有微博？立即注册！</a>
                </div>
        	</div>
        </div>
        
        <div id="right-part-content01">
        
        </div>
    </div> 
		
	<div id="buoys">
    	<img src="front/image/letterchat.png" id="buoysimg1"/><span id="buoyschat">私信聊天</span><img src="front/image/chatmes.png" id="buoysimg2"/>
    </div>
</div>
</body>
</html>

