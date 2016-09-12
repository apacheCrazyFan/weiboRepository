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
<script type="text/javascript" src="front/js/unlogin_page.js"></script>
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
            	<li style="height:0px;"><a href="front/page/login.jsp" name="login" id="login">登录</a></li>
                <li style="height:0px;"><a href="front/page/register.jsp" name="register" id="register">注册</a></li>
            </ul>
        </div>
        
    </div>
	
<div id="frame">
	<div id="left-part">
    	<ul>
            <li class="one" style="height:32px;"><img src="front/image/left_01.png" class="img"/><a href="javascript:void(0)" id="two">推荐</a></li>
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
    	<div id="xinxin">
    	<div id="center-part-content_01" style="margin-top:20px;">
            <a href="javascript:void(0)" id="center-part_img" class="center-part_img"><img title="啦啦啦" src="front/image/userphoto003.png"/></a>
                <ul id="center-part_ul">
                	<li id="center-part_li">APP菌</li>
                    <li style="height:0px;width:150px;"><a href="javascript:void(0)">8</a>分钟前 来自 weibo.com</li>
                </ul>
                <p id="center-part_p">【The Clocks】跟Fliqlo类似，都是拍照时候的背景神器[
                doge]！而且相比之下TheClocks有数字和指针两种形式，还可以设定闹铃中区也有，而且free帮APP菌卖安利#</p>
               <div id="content_img01">
               		<img src="front/image/weiboimg003.png"/>
               </div>
               
               <div id="center_footnum" class="center_footnum">
                   <a href="javascript:void(0)" id="center_footnum1" onClick="addcollectiondiv('center_footnum1_col')"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>
                   <a href="javascript:void(0)" id="center_footnum2" onClick="addtransmitdiv('center_footnum2_transmit')"><img src="front/image/center-part_foot02.png" id="foot01_img"/>204</a>
                   <a href="javascript:void(0)" id="center_footnum3" onClick="addcommentdiv('comment_div')"><img src="front/image/center-part_foot03.png" id="foot01_img"/>45</a>
                   <a href="javascript:void(0)" id="center_footnum4"><img src="front/image/center-part_foot04.png" id="foot01_img"/>765</a>
               </div>
               
             
               <div id="center_footnum1_col" class="center_footnum1_col" style="display:none;">
               		<div id="collection_div_unline">
               			<span id="collection_div_title">收藏</span>
                        <a href="javascript:void(0)" id="colle_closepng_a" class="colle_closepng_a" onMouseOut="collectiondivcloseimg('colle_closepng_a')" onClick="changecollectionsearch('center_footnum1_col')" onMouseOver="collectiondivcloseimg2('colle_closepng_a')"><img src="front/image/superdivclose.png" id="colle_closepng"></a>
                    </div>
                    <div id="collection_div_tishi">
                    	<img src="front/image/collectionsuccess.png" id="collection_div_img"/>
                        <span id="collection_div_su">收藏成功!</span>
                    </div>
                    <div id="collection_div_word"><img src="front/image/tishi.png" id="tishi_img"/><font id="tishi_word">添加标签来管理你的收藏</font></div>
                   
              		<div id="keyword" style="width:390px;height:32px;">
                    	<input type="text" id="keyword_tip1" style="width:390px;height:32px;"/>
                        
                        <div style="height:45px;background:#F0F0F0;width:430px;position:relative;top:16px;right:20px;"><input type="image" id="keyword_tip2" src="front/image/keyword_add.png"/>
                        <input type="image" id="keyword_tip2" src="front/image/keyword_cancel.png" onClick="closecollectiondiv('center_footnum1_col')"/></div>
                    </div>
           	  </div>
              
          <div id="center_footnum2_transmit" class="center_footnum2_transmit" style="display:none;">
              		<div id="transmit_div_unline">
                    	<span id="transmit_div_title">转发微博</span>
                        <a href="javascript:void(0)" id="transmit_closepng_a" class="transmit_closepng_a" onMouseOut="transmitdivcloseimg('transmit_closepng_a')" onClick="changetransmitsearch('center_footnum2_transmit')" onMouseOver="transmitdivcloseimg2('transmit_closepng_a')"><img src="front/image/superdivclose.png" id="colle_closepng"></a>
                    </div>
                    <div id="transmit_header">
                    	<span id="transmit_header_word">转发到：</span><a href="javascript:void(0)" id="transmit_where">我的微博</a>
                    </div>
              		<textarea class="transmit_input" id="transmit_txt" title="微博输入框" node-type="textE1" placeholder="请输入转发理由"></textarea>
                <a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img1.png" id="transmit_pace_png"/></a>
           		<a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img2.png" id="transmit_pace_png"/></a>
                <a href="javascript:void(0)" id="transmit_aa" onClick='showhidetransmitdiv("transmit_choose")'>公开<img src="front/image/limits_img5.png"/></a>
       			<input name="imgbtn" type="image" src="front/image/transmit_sure.png" id="transmit">
                    
                    <div id="transmit_choose" class="transmit_choose" style="display:none;" onMouseUp="hidetransmitdiv('transmit_choose')">
                        <ul>
                            <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:26px;position:relative;top:4px;right:-3px;"><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;top:2px;left:6px"/><li class="c1" id="choose1" onClick="changewords()" style="height:12px;position:relative;bottom:4px;"/>公开</li></a><br>
                            <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:26px;position:relative;top:4px;right:-3px;"><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose2" onClick="changewords1()" style="height:12px;position:relative;bottom:-1px;">好友圈</li></a><br>
                            <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:26px;position:relative;top:10px;right:-3px;"><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose3" onClick="changewords2()" style="height:12px;position:relative;bottom:-1px;">仅自己可见</li></a>
                            <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:26px;position:relative;top:17px;right:-3px;"><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose4" onClick="changewords3()" style="height:12px;position:relative;bottom:-2px;">群可见</li></a>
                        </ul>
           			 </div>
              </div>
              
              <div id="comment_div" class="comment_div" style="display:none;">
              		<img src="front/image/comment_header_img.png" id="comment_img">
                    <input type="text" id="comment_input"/><br>
                    <a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img1.png" id="comment_pace_png"/></a>
           			<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img2.png" id="comment_pace_png"/></a>
                    <input type="checkbox" id="comment_check"><span id="comment_check_word">同时转发到我的微博</span>
                    <img src="front/image/comment_btn.png" id="comment_btn"/>
              </div>
              
        </div>
        
      <div id="center-part-content_01">
            	<a href="javascript:void(0)" id="center-part_img"><img src="front/image/userphoto001.png"/></a>
   
                <ul id="center-part_ul">
                	<li id="center-part_li">百科酱</li>
                    <li style="height:0px;width:150px;"><a href="javascript:void(0)">3</a>小时前 来自 weibo.com</li>
                </ul>
                <p id="center-part_p">阿里巴巴集团董事局主席马云成功的十大法则！不要抱怨，寻找机会，时刻拥有梦想，尊重文化，取一个好听的名字</p>
               <div id="content_img01" style="width:"><img src="front/image/weiboimg002.png"/>
            
               </div>
               
               <div id="center_footnum">
                   <a href="javascript:void(0)" id="center_footnum1" onClick="addcollectiondiv('center_footnum1_col')"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>
                   <a href="javascript:void(0)" id="center_footnum2" onClick="addtransmitdiv('center_footnum2_transmit')"><img src="front/image/center-part_foot02.png" id="foot01_img"/>204</a>
                   <a href="javascript:void(0)" id="center_footnum3" onClick="addcommentdiv1('comment_div1')"><img src="front/image/center-part_foot03.png" id="foot01_img"/>45</a>
                   <a href="javascript:void(0)" id="center_footnum4"><img src="front/image/center-part_foot04.png" id="foot01_img"/>765</a>
               </div>
               
               <div id="center_footnum1_col" style="display:none;">
               		<div id="collection_div_unline">
               			<span id="collection_div_title">收藏</span>
                        <a href="javascript:void(0)" id="colle_closepng_a" onMouseOut="collectiondivcloseimg('colle_closepng_a')" onClick="changecollectionsearch('center_footnum1_col')" onMouseOver="collectiondivcloseimg2('colle_closepng_a')"><img src="front/image/superdivclose.png" id="colle_closepng"></a>
                    </div>
                    <div id="collection_div_tishi">
                    	<img src="front/image/collectionsuccess.png" id="collection_div_img"/>
                        <span id="collection_div_su">收藏成功!</span>
                    </div>
                    <div id="collection_div_word"><img src="front/image/tishi.png" id="tishi_img"/><font id="tishi_word">添加标签来管理你的收藏</font></div>
                   
              		<div id="keyword" style="width:390px;height:32px;">
                    	<input type="text" id="keyword_tip1" style="width:390px;height:32px;"/>
                        
                        <div style="height:45px;background:#F0F0F0;width:430px;position:relative;top:16px;right:20px;"><input type="image" id="keyword_tip2" src="front/image/keyword_add.png"/>
                        <input type="image" id="keyword_tip2" src="front/image/keyword_cancel.png" onClick="closecollectiondiv('center_footnum1_col')"/></div>
                    </div>
           	  </div>
              
          <div id="center_footnum2_transmit" style="display:none;">
              		<div id="transmit_div_unline">
                    	<span id="transmit_div_title">转发微博</span>
                        <a href="javascript:void(0)" id="transmit_closepng_a" onMouseOut="transmitdivcloseimg('transmit_closepng_a')" onClick="changetransmitsearch('center_footnum2_transmit')" onMouseOver="transmitdivcloseimg2('transmit_closepng_a')"><img src="front/image/superdivclose.png" id="colle_closepng"></a>
                    </div>
                    <div id="transmit_header">
                    	<span id="transmit_header_word">转发到：</span><a href="javascript:void(0)" id="transmit_where">我的微博</a>
                    </div>
              		<textarea class="transmit_input" id="transmit_txt" title="微博输入框" node-type="textE1" placeholder="请输入转发理由"></textarea>
                <a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img1.png" id="transmit_pace_png"/></a>
           		<a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img2.png" id="transmit_pace_png"/></a>
                <a href="javascript:void(0)" id="transmit_aa" onClick='showhidetransmitdiv("transmit_choose")'>公开<img src="front/image/limits_img5.png"/></a>
       			<input name="imgbtn" type="image" src="front/image/transmit_sure.png" id="transmit">
                    
                    <div id="transmit_choose" style="display:none;" onMouseUp="hidetransmitdiv('transmit_choose')">
                        <ul>
                            <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:90px;height:2px;position:relative;top:4px;right:5px;"><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose1" onClick="changewords()" style="height:12px;position:relative;bottom:8px;"/>公开</li></a><br>
                            <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:90px;height:2px;position:relative;top:4px;right:5px;"><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose2" onClick="changewords1()" style="height:12px;position:relative;bottom:8px;right:5px;">好友圈</li></a><br>
                            <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:90px;height:2px;position:relative;top:4px;right:5px;"><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose3" onClick="changewords2()" style="height:12px;position:relative;bottom:8px;">仅自己可见</li></a>
                            <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:90px;height:2px;position:relative;top:4px;right:5px;"><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose4" onClick="changewords3()" style="height:12px;position:relative;bottom:8px;">群可见</li></a>
                        </ul>
           			 </div>
              </div>
              
              <div id="comment_div1" class="comment_div" style="display:none;">
              		<img src="front/image/comment_header_img.png" id="comment_img">
                    <input type="text" id="comment_input"/><br>
                    <a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img1.png" id="comment_pace_png"/></a>
           			<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img2.png" id="comment_pace_png"/></a>
                    <input type="checkbox" id="comment_check"><span id="comment_check_word">同时转发到我的微博</span>
                    <img src="front/image/comment_btn.png" id="comment_btn"/>
              </div>
              
               
        </div>
       
       <div id="center-part-content_01">
            	<a href="javascript:void(0)" id="center-part_img"><img src="front/image/userphoto004.png"/></a>
   
                <ul id="center-part_ul">
                	<li id="center-part_li">网易云音乐</li>
                    <li style="height:0px;width:150px;"><a href="javascript:void(0)">20</a>分钟前 来自 weibo.com</li>
                </ul>
                <p id="center-part_p">音乐一响起，好似曾经的追剧时光回来了！用一首歌的时间去感受中国电视剧20年！一起来看！</p>
               <div id="content_img01">
               		<img src="front/image/weibonewimg001.png"/>
               </div>
               
               <div id="center_footnum">
                   <a href="javascript:void(0)" id="center_footnum1" onClick="addcollectiondiv('center_footnum1_col')"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>
                   <a href="javascript:void(0)" id="center_footnum2" onClick="addtransmitdiv('center_footnum2_transmit')"><img src="front/image/center-part_foot02.png" id="foot01_img"/>204</a>
                   <a href="javascript:void(0)" id="center_footnum3" onClick="addcommentdiv2('comment_div2')"><img src="front/image/center-part_foot03.png" id="foot01_img"/>45</a>
                   <a href="javascript:void(0)" id="center_footnum4"><img src="front/image/center-part_foot04.png" id="foot01_img"/>765</a>
               </div>
               
               <div id="center_footnum1_col" style="display:none;">
               		<div id="collection_div_unline">
               			<span id="collection_div_title">收藏</span>
                        <a href="javascript:void(0)" id="colle_closepng_a" onMouseOut="collectiondivcloseimg('colle_closepng_a')" onClick="changecollectionsearch('center_footnum1_col')" onMouseOver="collectiondivcloseimg2('colle_closepng_a')"><img src="front/image/superdivclose.png" id="colle_closepng"></a>
                    </div>
                    <div id="collection_div_tishi">
                    	<img src="front/image/collectionsuccess.png" id="collection_div_img"/>
                        <span id="collection_div_su">收藏成功!</span>
                    </div>
                    <div id="collection_div_word"><img src="front/image/tishi.png" id="tishi_img"/><font id="tishi_word">添加标签来管理你的收藏</font></div>
                   
              		<div id="keyword" style="width:390px;height:32px;">
                    	<input type="text" id="keyword_tip1" style="width:390px;height:32px;"/>
                        
                        <div style="height:45px;background:#F0F0F0;width:430px;position:relative;top:16px;right:20px;"><input type="image" id="keyword_tip2" src="front/image/keyword_add.png"/>
                        <input type="image" id="keyword_tip2" src="front/image/keyword_cancel.png" onClick="closecollectiondiv('center_footnum1_col')"/></div>
                    </div>
           	  </div>
              
          <div id="center_footnum2_transmit" style="display:none;">
              		<div id="transmit_div_unline">
                    	<span id="transmit_div_title">转发微博</span>
                        <a href="javascript:void(0)" id="transmit_closepng_a" onMouseOut="transmitdivcloseimg('transmit_closepng_a')" onClick="changetransmitsearch('center_footnum2_transmit')" onMouseOver="transmitdivcloseimg2('transmit_closepng_a')"><img src="front/image/superdivclose.png" id="colle_closepng"></a>
                    </div>
                    <div id="transmit_header">
                    	<span id="transmit_header_word">转发到：</span><a href="javascript:void(0)" id="transmit_where">我的微博</a>
                    </div>
              		<textarea class="transmit_input" id="transmit_txt" title="微博输入框" node-type="textE1" placeholder="请输入转发理由"></textarea>
                <a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img1.png" id="transmit_pace_png"/></a>
           		<a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img2.png" id="transmit_pace_png"/></a>
                <a href="javascript:void(0)" id="transmit_aa" onClick='showhidetransmitdiv("transmit_choose")'>公开<img src="front/image/limits_img5.png"/></a>
       			<input name="imgbtn" type="image" src="front/image/transmit_sure.png" id="transmit">
                    
                    <div id="transmit_choose" style="display:none;" onMouseUp="hidetransmitdiv('transmit_choose')">
                        <ul>
                            <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:90px;height:2px;position:relative;top:4px;right:5px;"><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose1" onClick="changewords()" style="height:12px;position:relative;bottom:8px;"/>公开</li></a><br>
                            <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:90px;height:2px;position:relative;top:4px;right:5px;"><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose2" onClick="changewords1()" style="height:12px;position:relative;bottom:8px;right:5px;">好友圈</li></a><br>
                            <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:90px;height:2px;position:relative;top:4px;right:5px;"><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose3" onClick="changewords2()" style="height:12px;position:relative;bottom:8px;">仅自己可见</li></a>
                            <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:90px;height:2px;position:relative;top:4px;right:5px;"><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose4" onClick="changewords3()" style="height:12px;position:relative;bottom:8px;">群可见</li></a>
                        </ul>
           			 </div>
              </div>
              
              <div id="comment_div2" class="comment_div" style="display:none;">
              		<img src="front/image/comment_header_img.png" id="comment_img">
                    <input type="text" id="comment_input"/><br>
                    <a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img1.png" id="comment_pace_png"/></a>
           			<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img2.png" id="comment_pace_png"/></a>
                    <input type="checkbox" id="comment_check"><span id="comment_check_word">同时转发到我的微博</span>
                    <img src="front/image/comment_btn.png" id="comment_btn"/>
              </div>
        </div>
       
    </div>  
    <div id="changePage" style="float:left;background:#fff;margin-top:3px;margin-left:50px;">
        	<div style="float:left;background:#fff;width:240px;border-right:1px gray solid;"><a href="#">上一页</a></div>
        	<div style="float:left;background:#fff;width:240px;"><a href="#">下一页</a></div>
    </div>
    
    <!-- <div id="right-part-content01">
        
    </div> -->
    </div> 
		
	<div id="buoys">
    	<img src="front/image/letterchat.png" id="buoysimg1"/><span id="buoyschat">私信聊天</span><img src="front/image/chatmes.png" id="buoysimg2"/>
    </div>
   	</div>
   	<div id="right-part">
    	<div id="right-part-content">
        	<div class="nav">
                <a href="javascript:void(0)"><span id="loginsoon" onclick="clickunlogin('loginsoon','loginslow')">快速登录</span></a>
                <a href="javascript:void(0)"><span class="span2" id="loginslow" onclick="clickunlogin('loginslow','loginsoon')">账号密码登录</span></a>
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
</div>
</body>
</html>

