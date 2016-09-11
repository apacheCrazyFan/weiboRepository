<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.yc.weibo.entity.WeiBoUser"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8"> 
<base href="/vweibo/">
<style type="text/css">
</style>
<title>登录后的页面</title>
<link type="text/css" rel="stylesheet" href="front/css/afterlogin.css" />
<link rel="stylesheet" href="front/css/blueimp-gallery.css">
<link rel="stylesheet" href="front/css/blueimp-gallery-indicator.css">
<link rel="stylesheet" href="front/css/blueimp-gallery-video.css">
<link rel="stylesheet" href="front/css/demo.css">

	<!-- js操作session的包 -->
<script type="text/javascript" src="front/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="back/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="front/js/afterlogin.js"></script>
<script type="text/javascript" src="front/js/blueimp-helper.js"></script>
<script type="text/javascript" src="front/js/blueimp-gallery.js"></script>
<script type="text/javascript" src="front/js/blueimp-gallery-fullscreen.js"></script>
<script type="text/javascript" src="front/js/blueimp-gallery-indicator.js"></script>
<script type="text/javascript" src="front/js/blueimp-gallery-video.js"></script>
<script type="text/javascript" src="front/js/blueimp-gallery-vimeo.js"></script>
<script type="text/javascript" src="front/js/blueimp-gallery-youtube.js"></script>
<script type="text/javascript" src="front/js/vendor/jquery.js"></script>
<script type="text/javascript" src="front/js/jquery.blueimp-gallery.js"></script>
<script type="text/javascript" src="back/easyui/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="front/js/demo.js"></script>
<script type="text/javascript" src="front/js/session.js"></script>


<script type="text/javascript">


function shining(){
	var obj=$("#txt");
	var str=obj.attr("style");
	if(count>0){
		if(str){
			if(str.indexOf("rgba(255, 100, 100, 0.3)")>=0){
				obj.css("background","white");
			}else{
				obj.css("background","rgba(255,100,100,.3)");
			}
		}else{
			obj.css("background","rgba(255,100,100,.3)");
		}
		
	}else if(timeout){
		clearInterval(timeout);
	}
	count--;
}

//全局变量 
var weibocount = $("#weibocount").val();  //当前用户的微博数	
var media = new Array();

var count=4;

function publishWeibo() {
	count = 4;
	var obj = $("#txt");
	var str2 = obj.val().length;
	//alert(str2);
	if (obj.val() == "" || str2 > 140) {
		timeout = setInterval("shining()", 200);
		return;
	}
	alert($("#user").val());
	var statue = $("#form_push_op").val();
	var content = $("#txt").val().trim();

	alert(statue + " <--> " + content);

	$.ajaxFileUpload({
		url : 'weibo/publish',
		secureuri : false,
		data : {
			'statue' : statue,
			'content' : content
		},
		fileElementId : media,
		dataType : 'json',
		type : 'post',
		success : function(data, status) {
			if (data.rate == -1) {
				alert("【图片上传失败】");
			} else if (data.rate == 1) {
				alert("【图片上传成功】");
			} else if (data.rate == 2) {
				alert("【微博发表成功】");
				var location = data.location; //地理位置/电脑用户名 
				var picsMap = data.picsMap; //图片路径 
				var videoMap = data.videoMap; //视频路径
				var musicMap = data.musicMap; //音乐路径
				var date = data.publishDate; //发表日期
				
				console.info(location+" - "+picsMap+" - ");
				
				var newWeiBoStr = "";
				var rootXIXI = $("#xixi");
				var firstChrid = $("#xixi").children().first();
				
				var newWeiBoDiv = document.createElement("div");
				newWeiBoDiv.id = "center-part-content_01";
				
				$(newWeiBoDiv).insertBefore($("#xixi div").first());

				//newWeiBoDiv.style="margin-top:20px;";

				newWeiBoStr += '<a href="javascript:void(0)" id="center-part_img" class="center-part_img"><img id="'+${sessionScope.user.WBUid}+'" title="${sessionScope.user.uname}" src="/weibouserimages/${sessionScope.user.uimgPath}"/></a>';
				newWeiBoStr += '<a href="javascript:void(0)" class="center-part_way" id="center-part_way" onClick="showcenterhidediv(&quot;center-partchoose&quot;)" onMouseOver="changecentercolor(&quot;center-part_way&quot;)" onMouseOut="changecentercolors("&quot;center-part_way&quot;)"><img src="front/image/conter-part_wayimg01.png"/></a>';
				newWeiBoStr += '<div style="display:none;" class="center-partchoose"  id="center-partchoose" onMouseUp="hidecenterdiv(&quot;center-partchoose&quot;)">';
				newWeiBoStr += '<ul>';
				newWeiBoStr += '<li class="center-partc1" id="center-partchoose1" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">帮上头条</a></li><br>';
				newWeiBoStr += '<li class="center-partc1" id="center-partchoose2" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">屏蔽</a></li><br>';
				newWeiBoStr += '<li class="center-partc1" id="center-partchoose3" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">取消关注</a></li>';
				newWeiBoStr += '<li class="center-partc1" id="center-partchoose4" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">举报</a></li>';
				newWeiBoStr += '</ul>';
				newWeiBoStr += '</div>';

				newWeiBoStr += '<ul id="center-part_ul" style="width:180px;position:relative;left:-140px;">';
				newWeiBoStr += '<li id="center-part_li" style="height:0px;position:relative;left:18px;top:15px;">${sessionScope.user.uname}</li>';
				newWeiBoStr += '<li style="height:0px;width:250px;"><a href="javascript:void(0)">'+date+'</a> 来自 '+location+'</li>';
				newWeiBoStr += '</ul>';
				newWeiBoStr += '<p id="center-part_p" style="width:500px;position:relative;left:29px;">'+ content + '</p>';
				newWeiBoStr += '<div id="content_img01" style="position: relative;left:25px;bottom: 60px;width:500px;">';
				
				if(picsMap != ""){
					var pics = picsMap.split(",");
					for(var i = 0; i < pics.length; i ++){
						newWeiBoStr += '<img src="/weibopics/'+pics[i]+'"/>';
					}
				}
				if(videoMap != ""){
					var video = videoMap.split(",");
					for(var i = 0; i < video.length; i ++){
						newWeiBoStr += '<embed autoplay="true" src="/weibovideoes/'+video[i]+'" style="width:500px;height:300px;"/>';
					}
				}
				
					
				if(musicMap != ""){
					var music = musicMap.split(",");
					for(var i = 0; i < music.length; i ++){
						newWeiBoStr += '<embed type="audio" autoplay="true" src="/weibomusics/'+music[i]+'"/>';
					}
				}
				newWeiBoStr += '</div>';

				newWeiBoStr += '<div id="center_footnum" class="center_footnum">';
				newWeiBoStr += '<a href="javascript:void(0)" id="center_footnum1" onClick="addcollectiondiv(&quot;center_footnum1_col&quot;)"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>';
				newWeiBoStr += '<a href="javascript:void(0)" id="center_footnum2" onClick="addtransmitdiv(&quot;center_footnum2_transmit&quot;)"><img src="front/image/center-part_foot02.png" id="foot01_img"/>转发</a>';
				newWeiBoStr += '<a href="javascript:void(0)" id="center_footnum3" onClick="addcommentdiv(&quot;comment_div&quot;)"><img src="front/image/center-part_foot03.png" id="foot01_img"/>评论</a>';
				newWeiBoStr += '<a href="javascript:void(0)" id="center_footnum4"><img src="front/image/center-part_foot04.png" id="foot01_img" onclick="return clicklike('+${sessionScope.user.WBUid}+','+${sessionScope.user.WBUid}+')"/>赞</a>';
				newWeiBoStr += '</div>';

				newWeiBoStr += '<div id="center_footnum1_col" class="center_footnum1_col" style="display:none;">';
				newWeiBoStr += '<div id="collection_div_unline">';
				newWeiBoStr += '<span id="collection_div_title">收藏</span>';
				newWeiBoStr += '<a href="javascript:void(0)" id="colle_closepng_a" class="colle_closepng_a" onMouseOut="collectiondivcloseimg(&quot;colle_closepng_a&quot;)" onClick="changecollectionsearch(&quot;center_footnum1_col&quot;)" onMouseOver="collectiondivcloseimg2(&quot;colle_closepng_a&quot;)"><img src="front/image/superdivclose.png" id="colle_closepng"></a>';
				newWeiBoStr += '</div>';
				newWeiBoStr += '<div id="collection_div_tishi">';
				newWeiBoStr += '<img src="front/image/collectionsuccess.png" id="collection_div_img"/>';
				newWeiBoStr += '<span id="collection_div_su">收藏成功!</span>';
				newWeiBoStr += '</div>';
				newWeiBoStr += '<div id="collection_div_word"><img src="front/image/tishi.png" id="tishi_img"/><font id="tishi_word">添加标签来管理你的收藏</font></div>';

				newWeiBoStr += '<div id="keyword" style="width:390px;height:32px;">';
				newWeiBoStr += '<input type="text" id="keyword_tip1" style="width:390px;height:32px;"/>';

				newWeiBoStr += '<div style="height:45px;background:#F0F0F0;width:430px;position:relative;top:16px;right:20px;"><input type="image" id="keyword_tip2" src="front/image/keyword_add.png"/>';
				newWeiBoStr += '<input type="image" id="keyword_tip2" src="front/image/keyword_cancel.png" onClick="closecollectiondiv(&quot;center_footnum1_col&quot;)"/></div>';
				newWeiBoStr += '</div>';
				newWeiBoStr += '</div>';

				newWeiBoStr += '<div id="center_footnum2_transmit" class="center_footnum2_transmit" style="display:none;">';
				newWeiBoStr += '<div id="transmit_div_unline">';
				newWeiBoStr += '<span id="transmit_div_title">转发微博</span>';
				newWeiBoStr += '<a href="javascript:void(0)" id="transmit_closepng_a" class="transmit_closepng_a" onMouseOut="transmitdivcloseimg(&quot;transmit_closepng_a&quot;)" onClick="changetransmitsearch(&quot;center_footnum2_transmit&quot;)" onMouseOver="transmitdivcloseimg2(&quot;transmit_closepng_a&quot;)"><img src="front/image/superdivclose.png" id="colle_closepng"></a>';
				newWeiBoStr += '</div>';
				newWeiBoStr += '<div id="transmit_header">';
				newWeiBoStr += '<span id="transmit_header_word">转发到：</span><a href="javascript:void(0)" id="transmit_where">我的微博</a>';
				newWeiBoStr += '</div>';
				newWeiBoStr += '<textarea class="transmit_input" id="transmit_txt" title="微博输入框" node-type="textE1" placeholder="请输入转发理由"></textarea>';
				newWeiBoStr += '<a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img1.png" id="transmit_pace_png"/></a>';
				newWeiBoStr += '<a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img2.png" id="transmit_pace_png"/></a>';
				newWeiBoStr += '<a href="javascript:void(0)" id="transmit_aa" onClick="showhidetransmitdiv(&quot;transmit_choose&quot;)">公开<img src="front/image/limits_img5.png"/></a>';
				newWeiBoStr += '<input name="imgbtn" type="image" src="front/image/transmit_sure.png" id="transmit">';

				newWeiBoStr += '<div id="transmit_choose" class="transmit_choose" style="display:none;" onMouseUp="hidetransmitdiv(&quot;transmit_choose&quot;)">';
				newWeiBoStr += '<ul>';
				newWeiBoStr += '<a href="javascript:void(0)" id="choosea1"><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose1" onClick="changewords()" style="height:12px;position:relative;bottom:8px;"/>公开</li></a><br>';
				newWeiBoStr += '<a href="javascript:void(0)" id="choosea1"><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose2" onClick="changewords1()" style="height:12px;position:relative;bottom:8px;right:5px;">好友圈</li></a><br>';
				newWeiBoStr += '<a href="javascript:void(0)" id="choosea1"><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose3" onClick="changewords2()" style="height:12px;position:relative;bottom:8px;">仅自己可见</li></a>';
				newWeiBoStr += '<a href="javascript:void(0)" id="choosea1"><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose4" onClick="changewords3()" style="height:12px;position:relative;bottom:8px;">群可见</li></a>';
				newWeiBoStr += '</ul>';
				newWeiBoStr += '</div>';
				newWeiBoStr += '</div>';

				newWeiBoStr += '<div id="comment_div" class="comment_div" style="display:none;">';
				newWeiBoStr += '<img src="front/image/comment_header_img.png" id="comment_img">';
				newWeiBoStr += '<input type="text" id="comment_input"/><br>';
				newWeiBoStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img1.png" id="comment_pace_png"/></a>';
				newWeiBoStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img2.png" id="comment_pace_png"/></a>';
				newWeiBoStr += '<input type="checkbox" id="comment_check"><span id="comment_check_word">同时转发到我的微博</span>';
				newWeiBoStr += '<img src="front/image/comment_btn.png" id="comment_btn"/>';
				newWeiBoStr += '</div>';

				newWeiBoDiv.innerHTML = newWeiBoStr;
				//$(newWeiBoStr).insertBefore($("#xixi:first"));
				//rootXIXI.insertBefore(newWeiBoDiv,firstChrid);
				
				//document.getElementById("xixi").insertBefore(newWeiBoDiv,document.get); 
				//alert("终于到了这一步了");
				//alert($("#xixi").innerHTML);
				//document.getElementById("xixi").innerHTML = newWeiBoStr;
				
				//刷新微博数
				weibocount += 1;
				countStr = '<a href="javascript:void(0)" id="usernumone"><font id="num">${ sessionScope.groupnumber.FOCUSNUM }</font>关注</a>'
							+'<a href="javascript:void(0)" id="usernumone"><font id="num">${ sessionScope.groupnumber.FANSNUM }</font>粉丝</a>'
							+'<a href="javascript:void(0)" id="usernumone"><font id="num">$'+weibocount+'</font>微博</a>';
				$("#usernum").innerHTML = countStr;
				
				//刷新发布框
				$("#txt").value = "";
				
				//刷新文件框
				alert("剧终!");
			}
		},
		error : function(data, status, e) {
			alert("【服务器异常，请连续管理员！】" + e);
		}
	});
}
</script>
</head>
	<%
		/* HttpSession sessions = request.getSession();
		WeiBoUser user = (WeiBoUser)sessions.getAttribute("user"); */
	%>
<body id="bg">
<input type="hidden" id="user" value="${sessionScope.user.WBUid}" />
<!-- <form>
		<input type="submit">
	</form> --><input type="hidden" id="weibocount" value="${sessionScope.groupnumber.WEIBONUM}" />
	<div id="header">

    	<img class="head_logo" src="front/image/head_logo_sh_mini.png"/>
        <div class="searchTextBorder">
        	<input type="text" class="searchText" placeholder="iphone7 发布会" onClick="searchClick()" onBlur="searchBlur()"/>
            <a href="javascript:void(0)" class="search_pic"></a>
        </div>
        <ul>
        	<li><a href="javascript:void(0)" class="homePage">首页</a></li>
            <li><a href="javascript:void(0)" class="videoPage">视频</a></li>
            <li><a href="javascript:void(0)" class="foundPage">发现</a></li>
            <li><a href="javascript:void(0)" class="gamePage">游戏</a></li>
            <li><a href="javascript:void(0)" class="personPage">${sessionScope.user.uname}</a></li>
        </ul>
        <div class="settingArea">
        	<a href="javascript:void(0)" class="message_pic"></a>
            <a href="front/page/UserSet.jsp?WBUid=${sessionScope.user.WBUid}" class="setting_pic"></a>
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
                <a href="javascript:void(0)"><span id="s2" style="color:red;">亚洲新歌音乐节</span></a>
        	</p>
        	<form action="" method="" enctype="multipart/form-data" id="publishForm" name="myfrom">
       			<textarea class="W_input" id="txt" title="微博输入框" name="textContent" node-type="textE1" content=""></textarea>
       			
       			<!--隐藏域 ：op  用来传   0：公开    1：朋友圈       2：.... -->
       			<input id="form_push_op" name="op" value="0" type="hidden" />
       			
        		<a href="javascript:void(0)" id="wword" onClick="showfaceimage('face_image')"><img src="front/image/write_img1.png" id="wimg"/>表情</a>
            	<a href="javascript:void(0)" onClick="showNone('uploadPics','uploadVideo')" id="wword"><img src="front/image/write_img2.png" id="wimg"/>图片</a>
           	 	<a href="javascript:void(0)" onClick="showNone('uploadVideo','uploadPics')" id="wword"><img src="front/image/write_img3.png" id="wimg"/>视频</a>
            	<a href="javascript:void(0)" onClick="showtopicinput('topic_input')" id="wword"><img src="front/image/write_img4.png" id="wimg"/>话题</a>
            	<a href="javascript:void(0)" class="wword" id="moreimg" onMouseOver="changemoreimg()" onMouseOut="changemoreimgs()" style="position:relative;top:5px;"><img src="front/image/write_img6.png"/></a>
            	<a href="javascript:void(0)" id="aa" onClick='showhidediv("choose")'>公开<img src="front/image/limits_img5.png"/></a>

            	<!-- <input name="imgbtn" type="image" src="front/image/write_img7.png" id="fabu" onclick="publishWeibo()"> -->

            	<input type="button" value="发布" id="publish" onClick="publishWeibo()"/>
            	
            	<div id="uploadPics" style="display:none;position:relative;z-index:99;border:1px solid #CCC;">            		
            		<a href="javascript:void(0)" onclick="createInput('aapic')" style="font-size:14px;">&gt;&gt;添加附件&lt;&lt;</a>
            		<div id="aapic" style="position:relative;z-index:99;border:1px solid #CCC;">
            				
            		</div>
            			 <!-- <input type="file" name="myPicFile" multiple="multiple" id="myPicFile" style="width:250px"/>  -->
            	</div>
            	<div id="uploadVideo" style="display:none;position:relative;z-index:99;border:1px solid #CCC;">            		
            		<!-- <input type="file" name="myVideoFile" multiple="multiple" id="myVideoFile"/> -->
            		<a href="javascript:void(0)" onclick="createInput('bbpic')" style="font-size:14px;">&gt;&gt;添加附件&lt;&lt;</a>
            		<div id="bbpic" style="position:relative;z-index:99;border:1px solid #CCC;">
            				
            		</div>
            	</div>
            </form>
            
            <div id="choose" style="display:none;" onMouseUp="hidediv()">
				<a href="javascript:void(0)" id="choosea1"><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;bottom:8px;"/>
				<li class="c1" id="choose1" data="0" onClick="changeword(this)" style="height:12px;position:relative;bottom:8px;"/>公开</li></a><br>
                <a href="javascript:void(0)" id="choosea1" ><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;bottom:8px;"/>
                <li class="c1" id="choose2" data="1" onClick="changeword(this)" style="height:12px;position:relative;bottom:8px;right:5px;">好友圈</li></a><br>
                <a href="javascript:void(0)" id="choosea1" ><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;bottom:8px;"/>
                <li class="c1" id="choose3" data="2" onClick="changeword(this)" style="height:12px;position:relative;bottom:8px;">仅自己可见</li></a>
                <a href="javascript:void(0)" id="choosea1" ><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;bottom:8px;"/>
                <li class="c1" id="choose4" data="3" onClick="changeword(this)" style="height:12px;position:relative;bottom:8px;">群可见</li></a>
            </div>
            
            <div id="face_image" style="display:none;"> <!-- z-index应该是要和position一起用，this指针只能放在事件里面用  onClick  onMouseOver等 -->
           		<a href="javascript:void(0)" onClick="clickFace(this)" data="[daku]"><img src="front/image/face_image/daku003.png"></a>
	            <a href="javascript:void(0)" onClick="clickFace(this)" data="[daxiao]"><img src="front/image/face_image/daxiao007.png"></a>
	            <a href="javascript:void(0)" onClick="clickFace(this)" data="[kelian]"><img src="front/image/face_image/keling006.png"></a>
	            <a href="javascript:void(0)" onClick="clickFace(this)" data="[koubi]"><img src="front/image/face_image/koubi005.png"></a>
	            <a href="javascript:void(0)" onClick="clickFace(this)" data="[shuai]"><img src="front/image/face_image/shuai004.png"></a>
	            <a href="javascript:void(0)" onClick="clickFace(this)" data="[weixiao]"><img src="front/image/face_image/weixiao001.png"></a>
	            <a href="javascript:void(0)" onClick="clickFace(this)" data="[zan]"><img src="front/image/face_image/zan002.png"></a>
            </div>
            
            <div id="topic_input" style="display:none;">
            	<a href="javascript:void(0)" onClick="clicktopic(this)" id="topic_input_content" data="#在这里输入你想要说的话题#">#插入话题#</a>
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
        
        <div id="supersearch" style="display:none;background:#FFF;position:relative;top:10px">
            <p style="font-size:14px;font-weight:bold; margin-left:20px;position:relative;top:10px;">高级搜索</p>
            <a href="javascript:void(0)" id="superdivclose" class="superdivclose" onMouseOut="superdivcloseimg('superdivclose')" onClick="changesupersearch(2)" onMouseOver="superdivcloseimg2('superdivclose')"><img src="front/image/superdivclose.png" id="closepng"></a>
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
       
       <div id="xixi">
        <div id="center-part-content_01" style="margin-top:20px;">
            <a href="javascript:void(0)" id="center-part_img" class="center-part_img"><img title="啦啦啦" src="front/image/userphoto003.png"/></a>
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
                	<li id="center-part_li" style="height:0px;position:relative;left:18px;top:15px;">APP菌</li>
                    <li style="height:0px;width:250px;position:relative;left:14px;"><a href="javascript:void(0)">8</a>分钟前 来自 weibo.com</li>
                </ul>
                <p id="center-part_p" style="width:500px;position:relative;left:29px;">【The Clocks】跟Fliqlo类似，都是拍照时候的背景神器[
                doge]！而且相比之下TheClocks有数字和指针两种形式，还可以设定闹铃中区也有，而且free帮APP菌卖安利#</p>
               <div id="content_img01">
               		<img src="front/image/weiboimg003.png"/>
               		
               		<div id="blueimp-image-carousel"
						class="blueimp-gallery blueimp-gallery-carousel">
						<div class="slides"></div>
						<h4 class="title"></h4>
						<a class="prev">‹</a> 
						<a class="next">›</a> 
						<a class="play-pause"></a>
					</div>
					<br>
					<div id="blueimp-video-carousel"
						class="blueimp-gallery blueimp-gallery-controls blueimp-gallery-carousel">
						<div class="slides"></div>
						<h4 class="title"></h4>
						<a class="prev">‹</a> 
						<a class="next">›</a> 
						<a class="play-pause"></a>
					</div>
					<br>
					<div id="links" class="links"></div>
					<div id="blueimp-gallery" class="blueimp-gallery">
						<div class="slides"></div>
						<h4 class="title"></h4>
						<a class="prev">‹</a> 
						<a class="next">›</a> 
						<a class="close">×</a>
						<a class="play-pause"></a>
						<ol class="indicator"></ol>
					</div>
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
                            <a href="javascript:void(0)" id="choosea1"><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose1" onClick="changewords()" style="height:12px;position:relative;bottom:8px;"/>公开</li></a><br>
                            <a href="javascript:void(0)" id="choosea1"><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose2" onClick="changewords1()" style="height:12px;position:relative;bottom:8px;right:5px;">好友圈</li></a><br>
                            <a href="javascript:void(0)" id="choosea1"><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose3" onClick="changewords2()" style="height:12px;position:relative;bottom:8px;">仅自己可见</li></a>
                            <a href="javascript:void(0)" id="choosea1"><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose4" onClick="changewords3()" style="height:12px;position:relative;bottom:8px;">群可见</li></a>
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
                <a href="javascript:void(0)" class="center-part_way" id="center-part_way1" onClick="showcenterhidediv('center-part_choose1')"      onMouseOver="changecentercolor('center-part_way1')" onMouseOut="changecentercolors('center-part_way1')"><img src="front/image/conter-part_wayimg01.png"/></a>
                    <div style="display:none;" class="center-partchoose" id="center-part_choose1" onMouseUp="hidecenterdiv('center-part_choose1')">
                        <ul>
                            <li class="center-partc1" id="center-partchoose1" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">帮上头条</a></li><br>
                           <li class="center-partc1" id="center-partchoose2" style="height:20px;width:130px;"> <a href="javascript:void(0)" id="center-parta1">屏蔽</a></li><br>
                            <li class="center-partc1" id="center-partchoose3" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">取消关注</a></li>
                           <li class="center-partc1" id="center-partchoose4" style="height:20px;width:130px;"> <a href="javascript:void(0)" id="center-parta1">举报</a></li>
                   	  </ul>
                	</div>
   
                <ul id="center-part_ul" style="width:180px;position:relative;left:-140px;">
                	<li id="center-part_li" style="height:0px;position:relative;left:18px;top:15px;">百科酱</li>
                    <li style="height:0px;width:150px;"><a href="javascript:void(0)">3</a>小时前 来自 weibo.com</li>
                </ul>
                <p id="center-part_p" style="width:500px;position:relative;left:29px;">阿里巴巴集团董事局主席马云成功的十大法则！不要抱怨，寻找机会，时刻拥有梦想，尊重文化，取一个好听的名字</p>
                <div id="content_img01"><img src="front/image/weiboimg002.png"/>
              		
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
                            <a href="javascript:void(0)" id="choosea1"><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose1" onClick="changewords()" style="height:12px;position:relative;bottom:8px;"/>公开</li></a><br>
                            <a href="javascript:void(0)" id="choosea1"><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose2" onClick="changewords1()" style="height:12px;position:relative;bottom:8px;right:5px;">好友圈</li></a><br>
                            <a href="javascript:void(0)" id="choosea1"><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose3" onClick="changewords2()" style="height:12px;position:relative;bottom:8px;">仅自己可见</li></a>
                            <a href="javascript:void(0)" id="choosea1"><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose4" onClick="changewords3()" style="height:12px;position:relative;bottom:8px;">群可见</li></a>
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
                	<li id="center-part_li" style="height:0px;position:relative;left:18px;top:15px;">网易云音乐</li>
                    <li style="height:0px;width:150px;"><a href="javascript:void(0)">20</a>分钟前 来自 weibo.com</li>
                </ul>
                <p id="center-part_p" style="width:500px;position:relative;left:29px;">音乐一响起，好似曾经的追剧时光回来了！用一首歌的时间去感受中国电视剧20年！一起来看！</p>
                
              
               <div id="content_img01">
               		<img src="front/image/weibonewimg001.png"/>
               </div>
               
               <div id="center_footnum">
                   <a href="javascript:void(0)" id="center_footnum1" onClick="addcollectiondiv('center_footnum1_col')"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>
                   <a href="javascript:void(0)" id="center_footnum2" onClick="addtransmitdiv('center_footnum2_transmit')"><img src="front/image/center-part_foot02.png" id="foot01_img"/>204</a>
                   <a href="javascript:void(0)" id="center_footnum3" onClick="addcommentdiv2('comment_div2')"><img src="front/image/center-part_foot03.png"  id="foot01_img"/>45</a>
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
                            <a href="javascript:void(0)" id="choosea1"><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;bottom:8px;"/>
                            <li class="c1" id="choose1" onClick="changewords()" style="height:12px;position:relative;bottom:8px;"/>公开</li></a><br>
                            <a href="javascript:void(0)" id="choosea1"><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;bottom:8px;"/>
                            <li class="c1" id="choose2" onClick="changewords1()" style="height:12px;position:relative;bottom:8px;right:5px;">好友圈</li></a><br>
                            <a href="javascript:void(0)" id="choosea1"><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;bottom:8px;"/>
                            <li class="c1" id="choose3" onClick="changewords2()" style="height:12px;position:relative;bottom:8px;">仅自己可见</li></a>
                            <a href="javascript:void(0)" id="choosea1"><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;bottom:8px;"/>
                            <li class="c1" id="choose4" onClick="changewords3()" style="height:12px;position:relative;bottom:8px;">群可见</li></a>
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
          </div>  <!-- 目前三篇微博的根  id="xixi" -->
        </div>
       
    </div> 
    
    <div id="right-part">
    	<div id="right-part-content">
        	<a href="javascript:void(0)" id="user_img"><img src="/weibouserimages/${sessionScope.user.uimgPath}"/></a>
            <a href="javascript:void(0)" id="user_name">${sessionScope.user.uname}</a>
            <a href="javascript:void(0)" id="vip_img"><img src="front/image/vip_logo.jpg"/></a>
            <div id="levelimg">
            	<a href="javascript:void(0)" id="level">Lv.10</a>
            </div>
            <div id="usernum">
                <a href="javascript:void(0)" id="usernumone"><font id="num">${ sessionScope.groupnumber.FOCUSNUM }</font>关注</a>
                <a href="javascript:void(0)" id="usernumone"><font id="num">${ sessionScope.groupnumber.FANSNUM }</font>粉丝</a>
                <a href="javascript:void(0)" id="usernumone"><font id="num">${ sessionScope.groupnumber.WEIBONUM }</font>微博</a>
            </div>
        </div>
        
        <div class="hot_topic">
            <span class="hot_topic_head">热门话题<a href="javascript:void(0)" onClick="letRandom()" id="huanyihuan" class="hot_topic_change">换一换</a></span>
            <div  id="hot_topic_content" class="hot_topic_content">
            	<c:forEach items="${Themes}" var="theme">
            		<li><a href="javascript:void(0)" class="hot_topic_detail">${theme.tname}</a><span class="hot_topic_detail_click">${theme.tview}</span></li><br/>
            	</c:forEach>

            </div>
         </div>


		<div class="goodfriend_trends">
			<div id="goodfriend_trends_head">
            	<span class="goodfriend_trends_head">好友关注动态</span>
            </div>
            <span class="goodfriend_trends_detail">你赞过他的微博</span><br/>
            <div class="goodfriend_trends_content">
              	 <img src="front/image/goodfriend_trens.png" id="goodfriend_img"/>
              	 <a href="javascript:void(0)"><span id="goodfriend_word1">文神原</span></a><br>
              	 <a href="javascript:void(0)"><span id="goodfriend_word2">新兰本《初》编...</span></a>
              	 <input type="image" src="front/image/attention_friend.png" id="goodfriend_attention"/>
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