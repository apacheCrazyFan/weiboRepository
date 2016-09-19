<%@page import="com.yc.weibo.util.PageUtil"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.yc.weibo.entity.WeiBoUser"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="springmvc" uri="http://www.springframework.org/tags/form" %>
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

<link rel="stylesheet" href="jquery-easyui-1.3.5/themes/default/easyui.css">
<link rel="stylesheet" href="jquery-easyui-1.3.5/themes/icon.css">
<link rel="stylesheet" href="jquery-easyui-1.3.5/demo/demo.css">

<script type="text/javascript" src="front/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="back/js/jquery-1.9.1.js"></script>

<script type="text/javascript" src="jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.5/easyloader.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.5/locale/easyui-lang-zh_CN.js"></script>

	<!-- js操作session的包 -->
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
var media = new Array();
var weibocount;  //当前用户的微博数
	
	
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

		weibocount = Number($("#weibocount").val());
		var statue = $("#form_push_op").val();
		var content = $("#txt").val().trim();
		var uid = parseInt($("#user").val().trim());  //用户id;

		//alert(content);
		$.ajaxFileUpload({
			url : 'weibo/publish',
			secureuri : false,
			data : {
				'statue' : statue,
				'content' : content,
				'uid' : uid
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
					
					var wbid = data.wbid;  //微博发表成功后的 微博id
					var location = data.location; //地理位置/电脑用户名 
					var picsMap = data.picsMap; //图片路径 
					var videoMap = data.videoMap; //视频路径
					var musicMap = data.musicMap; //音乐路径
					var date = data.publishDate; //发表日期
					

					var newWeiBoDiv = document.createElement("div");
					newWeiBoDiv.id = "center-part-content_01";
					newWeiBoDiv.className = "divid_d_"+clicklikenum;
					
					var newWeiBoStr = '';
					newWeiBoStr += '<a href="javascript:void(0)" id="center-part_img" class="center-part_img"><img id="img_'+clicklikenum+'" title="${sessionScope.user.uname}" style="width:65px;height:65px;border-radius:10px;padding-left:10px" src="/weibouserimages/${sessionScope.user.uimgPath}"/></a>';
					newWeiBoStr += '<a href="javascript:void(0)" class="center-part_way" id="center-part_way" onClick="showcenterhidediv(&quot;center-partchoose&quot;)" onMouseOver="changecentercolor(&quot;center-part_way&quot;)" onMouseOut="changecentercolors("&quot;center-part_way&quot;)"><img src="front/image/conter-part_wayimg01.png"/></a>';
					newWeiBoStr += '<div style="display:none;" class="center-partchoose"  id="center-partchoose_'+clicklikenum+'" onMouseUp="hidecenterdiv(&quot;center-partchoose&quot;)">';
					newWeiBoStr += '<ul>';
					newWeiBoStr += '<li class="center-partc1" id="center-partchoose1" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">帮上头条</a></li><br>';
					newWeiBoStr += '<li class="center-partc1" id="center-partchoose2" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">屏蔽</a></li><br>';
					newWeiBoStr += '<li class="center-partc1" id="center-partchoose3" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">取消关注</a></li>';
					newWeiBoStr += '<li class="center-partc1" id="center-partchoose4" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">举报</a></li>';
					newWeiBoStr += '</ul>';
					newWeiBoStr += '</div>';

					newWeiBoStr += '<ul id="center-part_ul">';
					newWeiBoStr += '<li id="center-part_li">${sessionScope.user.uname}</li>';
	                newWeiBoStr += '<li style="height:0px;width:250px;"><a href="javascript:void(0)">今天&nbsp;'+date.split(' ')[1]+'</a> 来自 '+location+'</li>';
	                newWeiBoStr += '</ul>';
	                
					//表情处理
					var newContent ='';
					var newContent1 = '';
					var faceArr = content.split("[");
					for(var k = 0; k < faceArr.length; k ++){
						if(faceArr[k].split("]]").length > 1){  //主题
							newContent = '[['+faceArr[k]+newContent;
						}else if(faceArr[k] != "" && faceArr[k].split("]]").length == 1 && faceArr[k].split("]").length > 1){ //说明是表情 
								faceArr[k] = '<img src="front/image/face_image/'+faceArr[k].split("]")[0]+'.png" />'+faceArr[k].split("]")[1];
								newContent += faceArr[k];
						}else{
							newContent += faceArr[k];
						}
					}
					
					
					var faceRegx1 = new RegExp('\\n','gi');
					var faceArr1 = newContent.split(faceRegx1);
					for(var j = 0; j < faceArr1.length; j ++){
						newContent1 += faceArr1[j]+'<br />';
					}
					newWeiBoStr += '<p id="center-part_p_'+clicklikenum+'" class="center-part_p" style="width:450px;position:relative;left:29px;">'+newContent1+'</p>';
				
					newWeiBoStr += '<div id="content_img01">';
					
					//图片处理 
					if (picsMap != ""  && picsMap != undefined ) {
						var pics = picsMap.split(",");
						//console.info(pics);
						if(pics.length == 1){
							newWeiBoStr += '<img width="500px;" height="250px;" src="/weibopics/'+pics[0]+'"/>';
						}else if(pics.length == 2){
							for(var l = 0; l < pics.length; l ++){
								newWeiBoStr += '<img width="245px;" height="250px;" src="/weibopics/'+pics[l]+'"/>';
							}
						}else if(pics.length == 3){
							for(var m = 0; m < pics.length; m ++){
								newWeiBoStr += '<img width="160px;" height="250px;" src="/weibopics/'+pics[m]+'"/>';
							}
						}else if(pics.length == 4){
							newWeiBoStr += '<img style="width:500px;height:330px;" src="/weibopics/'+pics[0]+'"/>';
							for(var n = 1; n < pics.length; n ++){
								newWeiBoStr += '<img style="width:160px;height:80px;padding-right:3px;padding-left:3px;padding-top:3px;" src="/weibopics/'+pics[n]+'"/>';
							}
						}else if(pics.length == 9){
							for(var r = 0; r <pics.length; r ++){
								newWeiBoStr += '<img width="160px;" height="160px;" src="/weibopics/'+pics[r]+'"/>';
							}
						}else{
							//图片轮换
							
							
						}
					}
					
					
					//视频处理 
					if (videoMap != "" && videoMap != undefined) {
						var video = videoMap.split(",");
						for (var i = 0; i < video.length; i++) {
							newWeiBoStr += '<video controls="true" src="/weibovideoes/'+video[i]+'" style="width:500px;height:300px;"/>';
						}
					}

					//音乐处理
					if (musicMap != "" && musicMap != undefined) {
						var music = musicMap.split(",");
						for(var i = 0; i < music.length; i ++){
							newWeiBoStr += '<audio controls="true" src="/weibomusics/'+music[i]+'" style="width:500px;height:25px;"></video>';
						}
					}
					
					newWeiBoStr += '</div>';
					newWeiBoStr += '<div id="center_footnum_'+collectiondivnum+'" class="center_footnum">';
					newWeiBoStr += '<a href="javascript:void(0)" id="center_footnum1_'+collectiondivnum+'" class="center_footnum1" onClick="addcollectiondiv(&quot;center_footnum_col_'+collectiondivnum+'&quot;,'+uid+','+wbid+')"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>';	//收藏
					newWeiBoStr += '<a href="javascript:void(0)" id="center_footnum2_'+transmitdivnum+'" class="center_footnum2" onClick="addtransmitdiv(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;)"><img src="front/image/center-part_foot02.png" id="foot01_img"/>0</a>'; //转发
					newWeiBoStr += '<a href="javascript:void(0)" id="center_footnum3_'+commentdivnum+'" class="center_footnum3" onClick="addcommentdiv(&quot;comment_div_'+commentdivnum+'&quot;)"><img src="front/image/center-part_foot03.png" id="foot01_img"/>0</a>';		//评论
					newWeiBoStr += '<a href="javascript:void(0)" id="center_footnum4_'+clicklikenum+'" class="center_footnum4" onClick="clicklike(this,'+uid+','+wbid+','+uid+')"><img src="front/image/center-part_foot04.png" id="foot01_img"/>0</a>';   //点赞
					newWeiBoStr += '</div>';
					
					
					newWeiBoStr += '<div id="center_footnum_col_'+collectiondivnum+'" class="center_footnum_col" style="display:none;">';
					newWeiBoStr += '<div id="collection_div_unline>';
					newWeiBoStr += '<span id="collection_div_title">收藏</span>';
					newWeiBoStr += '<a href="javascript:void(0)" id="colle_closepng_a" class="colle_closepng_a" onMouseOut="collectiondivcloseimg(&quot;colle_closepng_a&quot;)" onClick="changecollectionsearch(&quot;center_footnum_col_'+collectiondivnum+'&quot;,&quot;keyword_tip_'+collectiondivnum+'&quot;)" onMouseOver="collectiondivcloseimg2(&quot;colle_closepng_a&quot;)"><img src="front/image/superdivclose.png" id="colle_closepng"></a>';
					newWeiBoStr += '</div>';
					newWeiBoStr += '<div id="collection_div_tishi">';
					newWeiBoStr += '<img src="front/image/collectionsuccess.png" id="collection_div_img"/>';
					newWeiBoStr += '<span id="collection_div_su">收藏成功!</span>';
					newWeiBoStr += '</div>';
					newWeiBoStr += '<div id="collection_div_word"><img src="front/image/tishi.png" id="tishi_img"/><font id="tishi_word">添加标签来管理你的收藏</font></div>';
					
					newWeiBoStr += '<div id="keyword" style="width:390px;height:32px;">';
					newWeiBoStr += '<input type="text" id="keyword_tip_'+collectiondivnum+'" class="keyword_tip1" style="width:390px;height:32px;"/>';
					
					newWeiBoStr += '<div style="height:45px;background:#F0F0F0;width:430px;position:relative;top:16px;right:20px;"><input type="image" id="keyword_tip2" src="front/image/keyword_add.png" onClick="collectiontag(&quot;center_footnum_col_'+collectiondivnum+'&quot;,&quot;keyword_tip_'+collectiondivnum+'&quot;,&quot;center_footnum1_'+collectiondivnum+'&quot;,'+uid+','+wbid+','+uid+')"/>';
					newWeiBoStr += '<input type="image" id="keyword_tip2" src="front/image/keyword_cancel.png" onClick="closecollectiondiv(&quot;center_footnum_col_'+collectiondivnum+'&quot;,&quot;keyword_tip_'+collectiondivnum+'&quot;)"/></div>';
					newWeiBoStr += '</div>';
					newWeiBoStr += '</div>';
					
					newWeiBoStr += '<div id="center_footnum_transmit_'+transmitdivnum+'" class="center_footnum_transmit" style="display:none;">';
					newWeiBoStr += '<div id="transmit_div_unline">';
					newWeiBoStr += '<span id="transmit_div_title">转发微博</span>';
					newWeiBoStr += '<a href="javascript:void(0)" id="transmit_closepng_a" class="transmit_closepng_a" onMouseOut="transmitdivcloseimg(&quot;transmit_closepng_a&quot;)" onClick="changetransmitsearch(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;,&quot;transmit_input_'+transmitdivnum+'&quot;)" onMouseOver="transmitdivcloseimg2(&quot;transmit_closepng_a&quot;)"><img src="front/image/superdivclose.png" id="colle_closepng"></a>';
					newWeiBoStr += '</div>';
					newWeiBoStr += '<div id="transmit_header">';
					newWeiBoStr += '<span id="transmit_header_word">转发到：</span><a href="javascript:void(0)" id="transmit_where">我的微博</a>';
					newWeiBoStr += '</div>';
					newWeiBoStr += '<textarea id="transmit_input_'+transmitdivnum+'" class="transmit_txt" title="微博输入框" node-type="textE1" placeholder="请输入转发理由"></textarea>';
					newWeiBoStr += '<a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img1.png" id="transmit_pace_png"/></a>';
					newWeiBoStr += '<a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img2.png" id="transmit_pace_png"/></a>';
					newWeiBoStr += '<a href="javascript:void(0)" id="transmit_aa" onClick="showhidetransmitdiv(&quot;transmit_choose&quot;)">公开<img src="front/image/limits_img5.png"/></a>';
					newWeiBoStr += '<input name="imgbtn" type="image" src="front/image/transmit_sure.png" id="transmit" onClick="transmitweibo(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;,&quot;transmit_input_'+transmitdivnum+'&quot;,&quot;center_footnum2_'+transmitdivnum+'&quot;,&quot;center_footnum2_'+transmitdivnum+'&quot;,'+uid+','+wbid+','+uid+')">';
					
					newWeiBoStr += '<div id="transmit_choose" class="transmit_choose" style="display:none;" onMouseUp="hidetransmitdiv(&quot;transmit_choose&quot;)">';
					newWeiBoStr += '<ul>';
					newWeiBoStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;top:2px;left:6px"/><li class="c1" id="choose1" onClick="changewords()" style="height:12px;position:relative;bottom:4px;top:3px;">公开</li></a><br>';
					newWeiBoStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose2" onClick="changewords1()" style="height:12px;position:relative;bottom:-1px;top:3px;">好友圈</li></a><br>';
					newWeiBoStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose3" onClick="changewords2()" style="height:12px;position:relative;bottom:-1px;top:3px;">仅自己可见</li></a>';
					newWeiBoStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose4" onClick="changewords3s)" style="height:12px;position:relative;bottom:-2px;top:3px;">群可见</li></a>';
					newWeiBoStr += '</ul>';
					newWeiBoStr += '</div>';
					newWeiBoStr += '</div>';
					
					newWeiBoStr += '<div id="comment_div_'+commentdivnum+'" class="comment_div" style="display:none;">';
					newWeiBoStr += '<img src="front/image/comment_header_img.png" id="comment_img">';
					newWeiBoStr += '<input type="text" id="comment_input'+commentdivnum+'" class="comment_input"/><br>';
					newWeiBoStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img1.png" id="comment_pace_png"/></a>';
					newWeiBoStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img2.png" id="comment_pace_png"/></a>';
					newWeiBoStr += '<input type="checkbox" id="comment_check'+commentdivnum+'" class="comment_check"><span id="comment_check_word">同时转发到我的微博</span>';
					newWeiBoStr += '<img src="front/image/comment_btn.png" id="comment_btn" onClick="commentsWeibo(&quot;center_footnum3_'+commentdivnum+'&quot;,&quot;comment_div_'+commentdivnum+'&quot;,&quot;comment_input'+commentdivnum+'&quot;,&quot;comment_check'+commentdivnum+'&quot;,'+uid+','+wbid+')"/>';
					newWeiBoStr += '</div>';
					
					
					newWeiBoDiv.innerHTML = newWeiBoStr;
					$(newWeiBoDiv).insertBefore($("#xixi div").first());
					
					
					//刷新右边用户信息框
					//刷新微博数
					weibocount += 1;
					MsgStr = '';
					MsgStr += '<a href="javascript:void(0)" id="user_img"><img style="width:65px;height:65px;border-radius:10px;padding-left:10px" src="/weibouserimages/${sessionScope.user.uimgPath}"/></a>';
					MsgStr += '<a href="javascript:void(0)" id="user_name">${sessionScope.user.uname}</a>';
					MsgStr += '<a href="javascript:void(0)" id="vip_img"><img src="front/image/vip_logo.jpg"/></a>';
					MsgStr += '<div id="levelimg">';
		            MsgStr += '<a href="javascript:void(0)" id="level">Lv.10</a>';
		            MsgStr += '</div>';
		            MsgStr += '<div id="usernum">';
		            MsgStr += ' <a href="javascript:void(0)" id="usernumone"><font id="num">${ sessionScope.groupnumber.FOCUSNUM }</font>关注</a>';
		            MsgStr += '<a href="javascript:void(0)" id="usernumone"><font id="num">${ sessionScope.groupnumber.FANSNUM }</font>粉丝</a>';
		            MsgStr += '<a href="javascript:void(0)" id="usernumone"><font id="num">'+weibocount+'</font>微博</a>';
		            MsgStr += '</div>';
					var MsgDiv = document.getElementById("right-part-content");
					if(undefined != MsgDiv){
						MsgDiv.innerHTML = MsgStr;
					}
					document.getElementById("weibocount").value =weibocount;
					

					//刷新发布框
					$("#txt").val('');
					document.getElementById("aapic").innerHTML = '';
					document.getElementById("bbpic").innerHTML = '';
					document.getElementById("uploadVideo").style.display = "none";
					document.getElementById("uploadPics").style.display = "none";
					
					//刷新状态
					var statueStr = '';
					statueStr += '<a href="javascript:void(0)" id="choosea1"><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;bottom:8px;"/>';
					statueStr += '<li class="c1" id="choose1" data="0" onClick="changeword(this)" style="height:12px;position:relative;bottom:8px;"/>公开</li></a><br>';
					statueStr += '<a href="javascript:void(0)" id="choosea1" ><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;bottom:8px;"/>';
		            statueStr += '<li class="c1" id="choose2" data="1" onClick="changeword(this)" style="height:12px;position:relative;bottom:8px;right:5px;">好友圈</li></a><br>';
		            statueStr += '<a href="javascript:void(0)" id="choosea1" ><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;bottom:8px;"/>';
		            statueStr += '<li class="c1" id="choose3" data="2" onClick="changeword(this)" style="height:12px;position:relative;bottom:8px;">仅自己可见</li></a>';
		            statueStr += '<a href="javascript:void(0)" id="choosea1" ><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;bottom:8px;"/>';
		            statueStr += '<li class="c1" id="choose4" data="3" onClick="changeword(this)" style="height:12px;position:relative;bottom:8px;">群可见</li></a>';
		            document.getElementById('choose').innerHTML = statueStr;
		            
		            clicklikenum ++;
					commentdivnum ++;
					transmitdivnum ++;
					collectiondivnum ++;
		            
					alert("剧终!");
				}
			},
			error : function(data, status, e) {
				alert("【服务器异常，请连续管理员！】" + e);
			}
		});
	}
	
	
	
	/* 群微博 */
function findGroupWeiBo(WBUid){
	$("#xixi").empty();
	var pageSize = 15;
	var pageNum = 1;
	
	$.ajax({
		  url: "weibo/findGroupWeiBo",
		  cache: false,
		  data:{"pageSize":pageSize,"pageNum":pageNum,"WBUid":WBUid},
		  dataType:"json",
		  Type:"GET",
		  success: function(data,textStatus){
		    if(data){
		    	dataStrArrcopy = JSON.stringify(data.weiboList); //json对象转化为json字符串
		    	datawbids = JSON.stringify(data.wbids);
		    	for(var zz = 0;zz < 6; zz ++){
		    		var dataMsg = data.weiboList[zz];
		    		if(dataMsg != undefined){
		    			
		    		var content = dataMsg.WBTXT; //首先已经确定他的内容不为空了！
		    		var wbuid = dataMsg.WBUID//发表微博的用户id
		    		var weiboid = dataMsg.WBID; //微博id
		    		var username = dataMsg.UNAME;  //用户名
		    		var userImgPaht = dataMsg.UIMGPATH; //用户图像路径
		    		var location = dataMsg.WBLOCATION; //地理位置/电脑用户名 
		    		var yon = dataMsg.YON;  //是否是转发的微博
		    		
		    		var videoMap = ''; //视频路径
					var picsMap = ''; //图片路径 
					var musicMap = '';//音乐路径
					
					if(yon.indexOf("N") > -1){
						
						if(dataMsg.WBPIC != undefined){
							picsMap = dataMsg.WBPIC;
						}
						if(dataMsg.WBVIDEO != undefined){
							videoMap = dataMsg.WBVIDEO;
						}
						if(dataMsg.WBMUSIC != undefined){
							musicMap = dataMsg.WBMUSIC; 
						}
						var newDate = new Date();
						newDate.setTime(dataMsg.WBDATE);
						var date = newDate.toLocaleString().substring(newDate.toLocaleString().indexOf(" "));
					
						var newStr = '';
						newStr += '<a href="javascript:void(0)" class="center-part_way" id="center-part_way" onClick="showcenterhidediv(&quot;center-partchoose&quot;)" onMouseOver="changecentercolor(&quot;center-part_way&quot;)" onMouseOut="changecentercolors("&quot;center-part_way&quot;)"><img src="front/image/conter-part_wayimg01.png"/></a>';
						newStr += '<div style="display:none;" class="center-partchoose"  id="center-partchoose" onMouseUp="hidecenterdiv(&quot;center-partchoose&quot;)">';
						newStr += '<ul>';
						newStr += '<li class="center-partc1" id="center-partchoose1" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">帮上头条</a></li><br>';
						newStr += '<li class="center-partc1" id="center-partchoose2" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">屏蔽</a></li><br>';
						newStr += '<li class="center-partc1" id="center-partchoose3" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">取消关注</a></li>';
						newStr += '<li class="center-partc1" id="center-partchoose4" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">举报</a></li>';
						newStr += '</ul>';
						newStr += '</div>';
					
						newStr += '<a href="javascript:void(0)" id="center-part_img" class="center-part_img"  style="padding-right:10px;"><img title="'+username+'" src="/weibouserimages/'+userImgPaht+'"style="hight:60px;width:60px"/></a>';
						newStr += '<ul id="center-part_ul">';
						newStr += '<li id="center-part_li">'+username+'</li>';
	                	newStr += '<li style="height:0px;width:250px;margin-left:16px;"><a href="javascript:void(0)">'+date+'</a> 来自 '+location+'</li>';
	                	newStr += '</ul>';
	                
						//表情处理
						var newContent ='';
						var newContent1 = '';
						if(content != undefined){
							var faceArr = content.split("[");
							for(var k = 0; k < faceArr.length; k ++){
								if(faceArr[k].split("]]").length > 1){  //主题
									newContent = '[['+faceArr[k]+newContent;
								}else if(faceArr[k] != "" && faceArr[k].split("]]").length == 1 && faceArr[k].split("]").length > 1){ //说明是表情 
									faceArr[k] = '<img src="front/image/face_image/'+faceArr[k].split("]")[0]+'.png" />'+faceArr[k].split("]")[1];
									newContent += faceArr[k];
								}else{
									newContent += faceArr[k];
								}
							}
						}
					
						/*console.info(content);
						console.info(faceArr);
						console.info(newContent); */
						var faceRegx1 = new RegExp('\\n','gi');
						var faceArr1 = newContent.split(faceRegx1);
						for(var j = 0; j < faceArr1.length; j ++){
							newContent1 += faceArr1[j]+'<br />';
						}
						newStr += '<p id="center-part_p_'+collectiondivnum+'" class="center-part_p" style="width:450px;position:relative;margin-left:80px;">'+newContent1+'</p>';
				
					
						newStr += '<div id="content_img01">';
						//图片处理 
						if (picsMap != "") {
							var pics = picsMap.split(",");
							//console.info(pics);
							if(pics.length == 1){
								newStr += '<img width="500px;" height="250px;" src="/weibopics/'+pics[0]+'"/>';
							}else if(pics.length == 2){
								for(var l = 0; l < pics.length; l ++){
									newStr += '<img width="245px;" height="250px;" src="/weibopics/'+pics[l]+'"/>';
								}
							}else if(pics.length == 3){
								for(var m = 0; m < pics.length; m ++){
									newStr += '<img width="160px;" height="250px;" src="/weibopics/'+pics[m]+'"/>';
								}
							}else if(pics.length == 4){
								newStr += '<img style="width:500px;height:330px;" src="/weibopics/'+pics[0]+'"/>';
								for(var n = 1; n < pics.length; n ++){
									newStr += '<img style="width:160px;height:80px;padding-right:3px;padding-left:3px;padding-top:3px;" src="/weibopics/'+pics[n]+'"/>';
								}
							}else if(pics.length == 9){
								for(var r = 0; r <pics.length; r ++){
									newStr += '<img width="160px;" height="160px;" src="/weibopics/'+pics[r]+'"/>';
								}
							}else{
								//图片轮换
							
							
							}
						}
					
					
						//视频处理 
						if (videoMap != "") {
							var video = videoMap.split(",");
							for (var i = 0; i < video.length; i++) {
								newStr += '<video controls="true" src="/weibovideoes/'+video[i]+'" style="width:500px;height:300px;"/>';
							}
						}

						//音乐处理
						if (musicMap != "") {
							var music = musicMap.split(",");
							for(var i = 0; i < music.length; i ++){
								newStr += '<audio controls="true" src="/weibomusics/'+music[i]+'" style="width:500px;height:25px;"></video>';
							}
						}
					
						newStr += '</div>';
						newStr += '<div id="center_footnum_'+collectiondivnum+'" class="center_footnum">';
					
						if(datawbids.indexOf(''+weiboid) < 0){
							newStr += '<a href="javascript:void(0)"	id="center_footnum1_'+collectiondivnum+'" class="center_footnum1" onClick="addcollectiondiv(&quot;center_footnum_col_'+collectiondivnum+'&quot;,'+userid+','+weiboid+')"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>';	//收藏
						}else{
							newStr += '<a href="javascript:void(0)"	id="center_footnum1_'+collectiondivnum+'" class="center_footnum1" onClick="addcollectiondiv(&quot;center_footnum_col_'+collectiondivnum+'&quot;,'+userid+','+weiboid+')"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>已收藏</a>';	//收藏
						}
					
						newStr += '<a href="javascript:void(0)" id="center_footnum2_'+transmitdivnum+'" class="center_footnum2" onClick="addtransmitdiv(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;)"><img src="front/image/center-part_foot02.png" id="foot01_img"/>'+dataMsg.WHREPRINTACCOUNT+'</a>'; //转发
						newStr += '<a href="javascript:void(0)" id="center_footnum3_'+commentdivnum+'" class="center_footnum3" onClick="addcommentdiv(&quot;comment_div_'+commentdivnum+'&quot;)"><img src="front/image/center-part_foot03.png" id="foot01_img"/>'+dataMsg.WHCOMMENTACCOUNT+'</a>';		//评论
						newStr += '<a href="javascript:void(0)" id="center_footnum4_'+clicklikenum+'" class="center_footnum4" onClick="clicklike(this,'+userid+','+weiboid+','+wbuid+')"><img src="front/image/center-part_foot04.png" id="foot01_img"/>'+dataMsg.WHGREATEACCOUNT+'</a>';   //点赞
						newStr += '</div>';
					
					
						newStr += '<div id="center_footnum_col_'+collectiondivnum+'" class="center_footnum_col" style="display:none;">';
						newStr += '<div id="collection_div_unline>';
						newStr += '<span id="collection_div_title">收藏</span>';
						newStr += '<a href="javascript:void(0)" id="colle_closepng_a" class="colle_closepng_a" onMouseOut="collectiondivcloseimg(&quot;colle_closepng_a&quot;)" onClick="changecollectionsearch(&quot;center_footnum_col_'+collectiondivnum+'&quot;,&quot;keyword_tip_'+collectiondivnum+'&quot;)" onMouseOver="collectiondivcloseimg2(&quot;colle_closepng_a&quot;)"><img src="front/image/superdivclose.png" id="colle_closepng"></a>';
						newStr += '</div>';
						newStr += '<div id="collection_div_tishi">';
						newStr += '<img src="front/image/collectionsuccess.png" id="collection_div_img"/>';
						newStr += '<span id="collection_div_su">收藏成功!</span>';
						newStr += '</div>';
						newStr += '<div id="collection_div_word"><img src="front/image/tishi.png" id="tishi_img"/><font id="tishi_word">添加标签来管理你的收藏</font></div>';
					
						newStr += '<div id="keyword" style="width:390px;height:32px;">';
						newStr += '<input type="text" id="keyword_tip_'+collectiondivnum+'" class="keyword_tip1" style="width:390px;height:32px;"/>';
																																																							 
						newStr += '<div style="height:45px;background:#F0F0F0;width:430px;position:relative;top:16px;right:20px;"><input type="image" id="keyword_tip2" src="front/image/keyword_add.png" onClick="collectiontag(&quot;center_footnum_col_'+collectiondivnum+'&quot;,&quot;keyword_tip_'+collectiondivnum+'&quot;,&quot;center_footnum1_'+collectiondivnum+'&quot;,'+userid+','+weiboid+','+wbuid+')"/>';
						newStr += '<input type="image" id="keyword_tip2" src="front/image/keyword_cancel.png" onClick="closecollectiondiv(&quot;center_footnum_col_'+collectiondivnum+'&quot;,&quot;keyword_tip_'+collectiondivnum+'&quot;)"/></div>';
						newStr += '</div>';
						newStr += '</div>';
					
						newStr += '<div id="center_footnum_transmit_'+transmitdivnum+'" class="center_footnum_transmit" style="display:none;">';
						newStr += '<div id="transmit_div_unline">';
						newStr += '<span id="transmit_div_title">转发微博</span>';
						newStr += '<a href="javascript:void(0)" id="transmit_closepng_a" class="transmit_closepng_a" onMouseOut="transmitdivcloseimg(&quot;transmit_closepng_a&quot;)" onClick="changetransmitsearch(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;,&quot;transmit_input_'+transmitdivnum+'&quot;)" onMouseOver="transmitdivcloseimg2(&quot;transmit_closepng_a&quot;)"><img src="front/image/superdivclose.png" id="colle_closepng"></a>';
						newStr += '</div>';
						newStr += '<div id="transmit_header">';
						newStr += '<span id="transmit_header_word">转发到：</span><a href="javascript:void(0)" id="transmit_where">我的微博</a>';
						newStr += '</div>';
						newStr += '<textarea id="transmit_input_'+transmitdivnum+'" class="transmit_txt" title="微博输入框" node-type="textE1" placeholder="请输入转发理由"></textarea>';
						newStr += '<a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img1.png" id="transmit_pace_png"/></a>';
						newStr += '<a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img2.png" id="transmit_pace_png"/></a>';
						newStr += '<a href="javascript:void(0)" id="transmit_aa" onClick="showhidetransmitdiv(&quot;transmit_choose&quot;)">公开<img src="front/image/limits_img5.png"/></a>';
						newStr += '<input name="imgbtn" type="image" src="front/image/transmit_sure.png" id="transmit" onClick="transmitweibo(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;,&quot;transmit_input_'+transmitdivnum+'&quot;,&quot;center_footnum2_'+transmitdivnum+'&quot;,'+userid+','+weiboid+','+wbuid+')" onMouseOver="transmitdivcloseimg2(&quot;transmit_closepng_a&quot;)">';
					
						newStr += '<div id="transmit_choose" class="transmit_choose" style="display:none;" onMouseUp="hidetransmitdiv(&quot;transmit_choose&quot;)">';
						newStr += '<ul>';
						newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;top:2px;left:6px"/><li class="c1" id="choose1" onClick="changewords()" style="height:12px;position:relative;bottom:4px;top:3px;">公开</li></a><br>';
						newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose2" onClick="changewords1()" style="height:12px;position:relative;bottom:-1px;top:3px;">好友圈</li></a><br>';
						newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose3" onClick="changewords2()" style="height:12px;position:relative;bottom:-1px;top:3px;">仅自己可见</li></a>';
						newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose4" onClick="changewords3()" style="height:12px;position:relative;bottom:-2px;top:3px;">群可见</li></a>';
						newStr += '</ul>';
						newStr += '</div>';
						newStr += '</div>';
					
						newStr += '<div id="comment_div_'+commentdivnum+'" class="comment_div" style="display:none;">';
						newStr += '<img src="front/image/comment_header_img.png" id="comment_img">';
						newStr += '<form id="form_'+commentdivnum+'">';
						newStr += '<input type="text" id="comment_input"/><br>';
						newStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img1.png" id="comment_pace_png"/></a>';
						newStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img2.png" id="comment_pace_png"/></a>';
						newStr += '<input type="checkbox" id="comment_check"><span id="comment_check_word">同时转发到我的微博</span>';
						newStr += '<img src="front/image/comment_btn.png" id="comment_btn" onClick="commentsWeibo('+userid+','+weiboid+',&quot;form_'+commentdivnum+'&quot;)"/>';
						newStr += '</form>';
						newStr += '</div>';
					
					
						$("#xixi").append('<div id="center-part-content_01" class="divid_'+clicklikenum+'">'+newStr+'</div>');  
					
						num ++;
						clicklikenum ++;
						commentdivnum ++;
						transmitdivnum ++;
						collectiondivnum ++;
					}else{ //转发微博的处理（即如何显示）
						
					} 
		    	}
		      } //for()
		    } //if(data)
		  },  //success
		  error:function(textStatus,error){
			  alert("数据加载有误:"+error);
		  }
		
	}); //ajax
}
	
	
	/* 特别关心 */
	function findMoreAttentionWeiBo(WBUid){
	$("#xixi").empty();
	var pageSize = 15;
	var pageNum = 1;
	
	$.ajax({
		  url: "weibo/findMoreAttentionWeiBo",
		  cache: false,
		  data:{"pageSize":pageSize,"pageNum":pageNum,"WBUid":WBUid},
		  dataType:"json",
		  Type:"GET",
		  success: function(data,textStatus){
		    if(data){
		    	dataStrArrcopy = JSON.stringify(data.weiboList); //json对象转化为json字符串
		    	datawbids = JSON.stringify(data.wbids);
		    	for(var zz = 0;zz < 6; zz ++){
		    		var dataMsg = data.weiboList[zz];
		    		if(dataMsg != undefined){
		    			
		    		var content = dataMsg.WBTXT; //首先已经确定他的内容不为空了！
		    		var wbuid = dataMsg.WBUID//发表微博的用户id
		    		var weiboid = dataMsg.WBID; //微博id
		    		var username = dataMsg.UNAME;  //用户名
		    		var userImgPaht = dataMsg.UIMGPATH; //用户图像路径
		    		var location = dataMsg.WBLOCATION; //地理位置/电脑用户名 
		    		var yon = dataMsg.YON;  //是否是转发的微博
		    		
		    		var videoMap = ''; //视频路径
					var picsMap = ''; //图片路径 
					var musicMap = '';//音乐路径
					
					if(yon.indexOf("N") > -1){
						
						if(dataMsg.WBPIC != undefined){
							picsMap = dataMsg.WBPIC;
						}
						if(dataMsg.WBVIDEO != undefined){
							videoMap = dataMsg.WBVIDEO;
						}
						if(dataMsg.WBMUSIC != undefined){
							musicMap = dataMsg.WBMUSIC; 
						}
						var newDate = new Date();
						newDate.setTime(dataMsg.WBDATE);
						var date = newDate.toLocaleString().substring(newDate.toLocaleString().indexOf(" "));
					
						var newStr = '';
						newStr += '<a href="javascript:void(0)" class="center-part_way" id="center-part_way" onClick="showcenterhidediv(&quot;center-partchoose&quot;)" onMouseOver="changecentercolor(&quot;center-part_way&quot;)" onMouseOut="changecentercolors("&quot;center-part_way&quot;)"><img src="front/image/conter-part_wayimg01.png"/></a>';
						newStr += '<div style="display:none;" class="center-partchoose"  id="center-partchoose" onMouseUp="hidecenterdiv(&quot;center-partchoose&quot;)">';
						newStr += '<ul>';
						newStr += '<li class="center-partc1" id="center-partchoose1" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">帮上头条</a></li><br>';
						newStr += '<li class="center-partc1" id="center-partchoose2" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">屏蔽</a></li><br>';
						newStr += '<li class="center-partc1" id="center-partchoose3" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">取消关注</a></li>';
						newStr += '<li class="center-partc1" id="center-partchoose4" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">举报</a></li>';
						newStr += '</ul>';
						newStr += '</div>';
					
						newStr += '<a href="javascript:void(0)" id="center-part_img" class="center-part_img"  style="padding-right:10px;"><img title="'+username+'" src="/weibouserimages/'+userImgPaht+'"/></a>';
						newStr += '<ul id="center-part_ul">';
						newStr += '<li id="center-part_li">'+username+'</li>';
	                	newStr += '<li style="height:0px;width:250px;margin-left:16px;"><a href="javascript:void(0)">'+date+'</a> 来自 '+location+'</li>';
	                	newStr += '</ul>';
	                
						//表情处理
						var newContent ='';
						var newContent1 = '';
						if(content != undefined){
							var faceArr = content.split("[");
							for(var k = 0; k < faceArr.length; k ++){
								if(faceArr[k].split("]]").length > 1){  //主题
									newContent = '[['+faceArr[k]+newContent;
								}else if(faceArr[k] != "" && faceArr[k].split("]]").length == 1 && faceArr[k].split("]").length > 1){ //说明是表情 
									faceArr[k] = '<img src="front/image/face_image/'+faceArr[k].split("]")[0]+'.png" />'+faceArr[k].split("]")[1];
									newContent += faceArr[k];
								}else{
									newContent += faceArr[k];
								}
							}
						}
					
						/*console.info(content);
						console.info(faceArr);
						console.info(newContent); */
						var faceRegx1 = new RegExp('\\n','gi');
						var faceArr1 = newContent.split(faceRegx1);
						for(var j = 0; j < faceArr1.length; j ++){
							newContent1 += faceArr1[j]+'<br />';
						}
						newStr += '<p id="center-part_p_'+collectiondivnum+'" class="center-part_p" style="width:450px;position:relative;margin-left:80px;">'+newContent1+'</p>';
				
					
						newStr += '<div id="content_img01">';
						//图片处理 
						if (picsMap != "") {
							var pics = picsMap.split(",");
							//console.info(pics);
							if(pics.length == 1){
								newStr += '<img width="500px;" height="250px;" src="/weibopics/'+pics[0]+'"/>';
							}else if(pics.length == 2){
								for(var l = 0; l < pics.length; l ++){
									newStr += '<img width="245px;" height="250px;" src="/weibopics/'+pics[l]+'"/>';
								}
							}else if(pics.length == 3){
								for(var m = 0; m < pics.length; m ++){
									newStr += '<img width="160px;" height="250px;" src="/weibopics/'+pics[m]+'"/>';
								}
							}else if(pics.length == 4){
								newStr += '<img style="width:500px;height:330px;" src="/weibopics/'+pics[0]+'"/>';
								for(var n = 1; n < pics.length; n ++){
									newStr += '<img style="width:160px;height:80px;padding-right:3px;padding-left:3px;padding-top:3px;" src="/weibopics/'+pics[n]+'"/>';
								}
							}else if(pics.length == 9){
								for(var r = 0; r <pics.length; r ++){
									newStr += '<img width="160px;" height="160px;" src="/weibopics/'+pics[r]+'"/>';
								}
							}else{
								//图片轮换
							
							
							}
						}
					
					
						//视频处理 
						if (videoMap != "") {
							var video = videoMap.split(",");
							for (var i = 0; i < video.length; i++) {
								newStr += '<video controls="true" src="/weibovideoes/'+video[i]+'" style="width:500px;height:300px;"/>';
							}
						}

						//音乐处理
						if (musicMap != "") {
							var music = musicMap.split(",");
							for(var i = 0; i < music.length; i ++){
								newStr += '<audio controls="true" src="/weibomusics/'+music[i]+'" style="width:500px;height:25px;"></video>';
							}
						}
					
						newStr += '</div>';
						newStr += '<div id="center_footnum_'+collectiondivnum+'" class="center_footnum">';
					
						if(datawbids.indexOf(''+weiboid) < 0){
							newStr += '<a href="javascript:void(0)"	id="center_footnum1_'+collectiondivnum+'" class="center_footnum1" onClick="addcollectiondiv(&quot;center_footnum_col_'+collectiondivnum+'&quot;,'+userid+','+weiboid+')"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>';	//收藏
						}else{
							newStr += '<a href="javascript:void(0)"	id="center_footnum1_'+collectiondivnum+'" class="center_footnum1" onClick="addcollectiondiv(&quot;center_footnum_col_'+collectiondivnum+'&quot;,'+userid+','+weiboid+')"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>已收藏</a>';	//收藏
						}
					
						newStr += '<a href="javascript:void(0)" id="center_footnum2_'+transmitdivnum+'" class="center_footnum2" onClick="addtransmitdiv(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;)"><img src="front/image/center-part_foot02.png" id="foot01_img"/>'+dataMsg.WHREPRINTACCOUNT+'</a>'; //转发
						newStr += '<a href="javascript:void(0)" id="center_footnum3_'+commentdivnum+'" class="center_footnum3" onClick="addcommentdiv(&quot;comment_div_'+commentdivnum+'&quot;)"><img src="front/image/center-part_foot03.png" id="foot01_img"/>'+dataMsg.WHCOMMENTACCOUNT+'</a>';		//评论
						newStr += '<a href="javascript:void(0)" id="center_footnum4_'+clicklikenum+'" class="center_footnum4" onClick="clicklike(this,'+userid+','+weiboid+','+wbuid+')"><img src="front/image/center-part_foot04.png" id="foot01_img"/>'+dataMsg.WHGREATEACCOUNT+'</a>';   //点赞
						newStr += '</div>';
					
					
						newStr += '<div id="center_footnum_col_'+collectiondivnum+'" class="center_footnum_col" style="display:none;">';
						newStr += '<div id="collection_div_unline>';
						newStr += '<span id="collection_div_title">收藏</span>';
						newStr += '<a href="javascript:void(0)" id="colle_closepng_a" class="colle_closepng_a" onMouseOut="collectiondivcloseimg(&quot;colle_closepng_a&quot;)" onClick="changecollectionsearch(&quot;center_footnum_col_'+collectiondivnum+'&quot;,&quot;keyword_tip_'+collectiondivnum+'&quot;)" onMouseOver="collectiondivcloseimg2(&quot;colle_closepng_a&quot;)"><img src="front/image/superdivclose.png" id="colle_closepng"></a>';
						newStr += '</div>';
						newStr += '<div id="collection_div_tishi">';
						newStr += '<img src="front/image/collectionsuccess.png" id="collection_div_img"/>';
						newStr += '<span id="collection_div_su">收藏成功!</span>';
						newStr += '</div>';
						newStr += '<div id="collection_div_word"><img src="front/image/tishi.png" id="tishi_img"/><font id="tishi_word">添加标签来管理你的收藏</font></div>';
					
						newStr += '<div id="keyword" style="width:390px;height:32px;">';
						newStr += '<input type="text" id="keyword_tip_'+collectiondivnum+'" class="keyword_tip1" style="width:390px;height:32px;"/>';
																																																							 
						newStr += '<div style="height:45px;background:#F0F0F0;width:430px;position:relative;top:16px;right:20px;"><input type="image" id="keyword_tip2" src="front/image/keyword_add.png" onClick="collectiontag(&quot;center_footnum_col_'+collectiondivnum+'&quot;,&quot;keyword_tip_'+collectiondivnum+'&quot;,&quot;center_footnum1_'+collectiondivnum+'&quot;,'+userid+','+weiboid+','+wbuid+')"/>';
						newStr += '<input type="image" id="keyword_tip2" src="front/image/keyword_cancel.png" onClick="closecollectiondiv(&quot;center_footnum_col_'+collectiondivnum+'&quot;,&quot;keyword_tip_'+collectiondivnum+'&quot;)"/></div>';
						newStr += '</div>';
						newStr += '</div>';
					
						newStr += '<div id="center_footnum_transmit_'+transmitdivnum+'" class="center_footnum_transmit" style="display:none;">';
						newStr += '<div id="transmit_div_unline">';
						newStr += '<span id="transmit_div_title">转发微博</span>';
						newStr += '<a href="javascript:void(0)" id="transmit_closepng_a" class="transmit_closepng_a" onMouseOut="transmitdivcloseimg(&quot;transmit_closepng_a&quot;)" onClick="changetransmitsearch(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;,&quot;transmit_input_'+transmitdivnum+'&quot;)" onMouseOver="transmitdivcloseimg2(&quot;transmit_closepng_a&quot;)"><img src="front/image/superdivclose.png" id="colle_closepng"></a>';
						newStr += '</div>';
						newStr += '<div id="transmit_header">';
						newStr += '<span id="transmit_header_word">转发到：</span><a href="javascript:void(0)" id="transmit_where">我的微博</a>';
						newStr += '</div>';
						newStr += '<textarea id="transmit_input_'+transmitdivnum+'" class="transmit_txt" title="微博输入框" node-type="textE1" placeholder="请输入转发理由"></textarea>';
						newStr += '<a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img1.png" id="transmit_pace_png"/></a>';
						newStr += '<a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img2.png" id="transmit_pace_png"/></a>';
						newStr += '<a href="javascript:void(0)" id="transmit_aa" onClick="showhidetransmitdiv(&quot;transmit_choose&quot;)">公开<img src="front/image/limits_img5.png"/></a>';
						newStr += '<input name="imgbtn" type="image" src="front/image/transmit_sure.png" id="transmit" onClick="transmitweibo(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;,&quot;transmit_input_'+transmitdivnum+'&quot;,&quot;center_footnum2_'+transmitdivnum+'&quot;,'+userid+','+weiboid+','+wbuid+')" onMouseOver="transmitdivcloseimg2(&quot;transmit_closepng_a&quot;)">';
					
						newStr += '<div id="transmit_choose" class="transmit_choose" style="display:none;" onMouseUp="hidetransmitdiv(&quot;transmit_choose&quot;)">';
						newStr += '<ul>';
						newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;top:2px;left:6px"/><li class="c1" id="choose1" onClick="changewords()" style="height:12px;position:relative;bottom:4px;top:3px;">公开</li></a><br>';
						newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose2" onClick="changewords1()" style="height:12px;position:relative;bottom:-1px;top:3px;">好友圈</li></a><br>';
						newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose3" onClick="changewords2()" style="height:12px;position:relative;bottom:-1px;top:3px;">仅自己可见</li></a>';
						newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose4" onClick="changewords3()" style="height:12px;position:relative;bottom:-2px;top:3px;">群可见</li></a>';
						newStr += '</ul>';
						newStr += '</div>';
						newStr += '</div>';
					
						newStr += '<div id="comment_div_'+commentdivnum+'" class="comment_div" style="display:none;">';
						newStr += '<img src="front/image/comment_header_img.png" id="comment_img">';
						newStr += '<form id="form_'+commentdivnum+'">';
						newStr += '<input type="text" id="comment_input"/><br>';
						newStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img1.png" id="comment_pace_png"/></a>';
						newStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img2.png" id="comment_pace_png"/></a>';
						newStr += '<input type="checkbox" id="comment_check"><span id="comment_check_word">同时转发到我的微博</span>';
						newStr += '<img src="front/image/comment_btn.png" id="comment_btn" onClick="commentsWeibo('+userid+','+weiboid+',&quot;form_'+commentdivnum+'&quot;)"/>';
						newStr += '</form>';
						newStr += '</div>';
					
					
						$("#xixi").append('<div id="center-part-content_01" class="divid_'+clicklikenum+'">'+newStr+'</div>');  
					
						num ++;
						clicklikenum ++;
						commentdivnum ++;
						transmitdivnum ++;
						collectiondivnum ++;
					}else{ //转发微博的处理（即如何显示）
						
					} 
		    	}
		      } //for()
		    } //if(data)
		  },  //success
		  error:function(textStatus,error){
			  alert("数据加载有误:"+error);
		  }
		
	}); //ajax
}
</script>
</head>
	<%
		/* HttpSession sessions = request.getSession();
		WeiBoUser user = (WeiBoUser)sessions.getAttribute("user"); */
	%>
<body id="bg">
<input type="hidden" id="user" value="${sessionScope.user.WBUid}" />
<input type="hidden" id="username" value="${sessionScope.user.uname}" />
<input type="hidden" id="uimgPath" value="${sessionScope.user.uimgPath}" />
<input type="hidden" id="weibocount" value="${sessionScope.groupnumber.WEIBONUM}" />
<input type="hidden" id="focuscount" value="${sessionScope.groupnumber.FOCUSNUM}" />
<input type="hidden" id="fanedbocount" value="${sessionScope.groupnumber.FANSNUM}" /> 

<input type="hidden" id="originTransmitid" value="" /> 

		<%-- <div id="center_footnum1_col_'+collectiondivnum+'" class="center_footnum1_col_" style="display:none;">';
			<springmvc:form >
				<div id="collection_div_unline">
				<span id="collection_div_title">收藏</span>
				<a href="javascript:void(0)" id="colle_closepng_a" class="colle_closepng_a" onMouseOut="collectiondivcloseimg(&quot;colle_closepng_a&quot;)" onClick="changecollectionsearch(&quot;center_footnum1_col&quot;)" onMouseOver="collectiondivcloseimg2(&quot;colle_closepng_a&quot;)"><img src="front/image/superdivclose.png" id="colle_closepng"></a>
				</div>
				<div id="collection_div_tishi">
				<img src="front/image/collectionsuccess.png" id="collection_div_img"/>
				<span id="collection_div_su">收藏成功!</span>
				</div>
				<div id="collection_div_word"><img src="front/image/tishi.png" id="tishi_img"/><font id="tishi_word">添加标签来管理你的收藏</font></div>
		
				<div id="keyword" style="width:390px;height:32px;">
				<springmvc:input path="taginput" type="text" id="keyword_tip1" style="width:390px;height:32px;"/>
		
				<div style="height:45px;background:#F0F0F0;width:430px;position:relative;top:16px;right:20px;"><input type="image" id="keyword_tip2" src="front/image/keyword_add.png"/>
				<input type="image" id="keyword_tip2" src="front/image/keyword_cancel.png" onClick="closecollectiondiv(&quot;center_footnum1_col&quot;)"/></div>
				</div>
			</springmvc:form>
		</div> --%>
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
            <li><a href="front/page/Personal.jsp?operation=findpersonal&WBUid=${sessionScope.user.WBUid}" class="personPage">${sessionScope.user.uname}</a></li>
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
            <li style="height:25px;"><a href="front/page/Personal.jsp?operation=findcollection&WBUid=${sessionScope.user.WBUid}" id="two">我的收藏</a></li>
            <li style="height:25px;"><a href="front/page/Personal.jsp?operation=findmyzan&WBUid=${sessionScope.user.WBUid}" id="two">我的赞</a></li>
            <li style="height:25px;"><img src="front/image/afterlogin_logo1.jpg" class="img"/><a href="javascript:findHotWeiBo()" id="two">热门微博</a></li>
            <li style="height:25px;"><img src="front/image/afterlogin_logo2.jpg" class="img1"/><a href="javascript:findFriendWeiBo(${sessionScope.user.WBUid})" id="two">好友圈</a></li>
            <li style="height:25px;"><img src="front/image/afterlogin_logo3.jpg" class="img1"/><a  href="javascript:findGroupWeiBo(${sessionScope.user.WBUid})" id="two">群微博</a></li>
            <li style="height:25px;"><img src="front/image/afterlogin_logo4.jpg" class="img"/><a href="javascript:findMoreAttentionWeiBo(${sessionScope.user.WBUid})" id="two">特别关注</a></li>
            <li style="height:25px;"><img src="front/image/afterlogin_logo5.jpg" class="img2"/><a onclick="javascript:findWeiBoByWBtag(this)" id="two">大学</a></li>
            <li style="height:25px;"><img src="front/image/afterlogin_logo5.jpg" class="img2"/><a onclick="javascript:findWeiBoByWBtag(this)" id="two">搞笑</a></li>
            <li style="height:25px;"><img src="front/image/afterlogin_logo5.jpg" class="img2"/><a onclick="javascript:findWeiBoByWBtag(this)" id="two">时尚</a></li>
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
				<a href="javascript:void(0)" class="choosea1" id=""><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;bottom:8px;"/>
				<li class="c1" id="choose1" data="0" onClick="changeword(this)" style="height:12px;position:relative;bottom:8px;"/>公开</li></a><br>
                <a href="javascript:void(0)" class="choosea1" ><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;bottom:8px;"/>
                <li class="c1" id="choose2" data="1" onClick="changeword(this)" style="height:12px;position:relative;bottom:8px;right:5px;">好友圈</li></a><br>
                <a href="javascript:void(0)" class="choosea1" ><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;bottom:8px;"/>
                <li class="c1" id="choose3" data="2" onClick="changeword(this)" style="height:12px;position:relative;bottom:8px;">仅自己可见</li></a>
                <a href="javascript:void(0)" id="choosea1" ><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;bottom:8px;"/>
                <li class="c1" id="choose4" class="3" onClick="changeword(this)" style="height:12px;position:relative;bottom:8px;">群可见</li></a>
            </div>
            
            <div id="face_image" style="display:none;"> <!-- z-index应该是要和position一起用，this指针只能放在事件里面用  onClick  onMouseOver等 -->
           		<a href="javascript:void(0)" onClick="clickFace(this)" data="[daku]"><img src="front/image/face_image/daku.png"></a>
	            <a href="javascript:void(0)" onClick="clickFace(this)" data="[daxiao]"><img src="front/image/face_image/daxiao.png"></a>
	            <a href="javascript:void(0)" onClick="clickFace(this)" data="[kelian]"><img src="front/image/face_image/kelian.png"></a>
	            <a href="javascript:void(0)" onClick="clickFace(this)" data="[koubi]"><img src="front/image/face_image/koubi.png"></a>
	            <a href="javascript:void(0)" onClick="clickFace(this)" data="[shuai]"><img src="front/image/face_image/shuai.png"></a>
	            <a href="javascript:void(0)" onClick="clickFace(this)" data="[weixiao]"><img src="front/image/face_image/weixiao.png"></a>
	            <a href="javascript:void(0)" onClick="clickFace(this)" data="[zan]"><img src="front/image/face_image/zan.png"></a>
            </div>
            
            <div id="topic_input" style="display:none;">
            	<a href="javascript:void(0)" onClick="clicktopic(this)" id="topic_input_content" data="#在这里输入你想要说的话题#">#插入话题#</a>
            </div>
            
    	</div>
        
        <div id="navigation" style="display:block">
        	<a href="javascript:void(0)" id="na1">全部</a>
            <a href="javascript:void(0)" id="na1">视频</a>
            <a href="javascript:void(0)" id="na1">图片</a>
            <a href="javascript:void(0)" id="na1">音乐</a>
            <div id="nav_search">
                <input type="text" id="search_text" placeholder="搜索我关注人的微博"/>
                <a href="javascript:void(0)"><img src="front/image/icon_search.png" id="nav-search"/></a>
                <a href="javascript:void(0)" id="nav-icon" onMouseOver="changecolor()" onMouseOut="changecolors()" onClick='changesupersearch(1)'><img src="front/image/navigation_icon.png"/></a>
    		</div>
        </div>
        
        <div id="supersearch" style="display:none;background:#FFF;position:relative;top:10px">
            <p style="font-size:14px;font-weight:bold; margin-left:20px;position:relative;top:10px;">高级搜索</p>
            <a href="javascript:void(0)" id="superdivclose" class="superdivclose" onMouseOut="superdivcloseimg('superdivclose')" onClick="changesupersearch(2)" onMouseOver="superdivcloseimg2('superdivclose')"><img src="front/image/superdivclose.png" id="closepng"></a>
           	类&nbsp;&nbsp;&nbsp;型：
           	<input type="checkbox" checked="checked" id="check"/>转发&nbsp;&nbsp;
           	<input type="checkbox" checked="checked" id="check"/>纯文字&nbsp;&nbsp;
           	<input type="checkbox" checked="checked" id="check"/>含图片&nbsp;&nbsp;
           	<input type="checkbox" checked="checked" id="check"/>含视频&nbsp;&nbsp;
           	<input type="checkbox" checked="checked" id="check"/>含音乐&nbsp;&nbsp;<br>
           	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;关键字：<input type="text" id="keyword" placeholder="查找我关注人的微博" style="margin-top:10px;height:28px;"/><br>
           	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时&nbsp;&nbsp;&nbsp;间：<input type="text" id="dateone" placeholder="选择日期" style="margin-top:10px;height:28px;"/>&nbsp;到&nbsp;<input type="text" id="datetwo" placeholder="2016-08-30" style="height:28px;"/><br>
           	<input type="image" src="front/image/supersearch.png" id="searchbtn" style="position:relative;left:70px;margin-top:20px;"/>
        </div>
       
       <div id="xixi">
        <!-- <div id="center-part-content_01" style="margin-top:20px;">
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
   
                <ul id="center-part_ul">
                	<li id="center-part_li">APP菌</li>
                    <li style="height:0px;width:250px;position:relative;left:18px;"><a href="javascript:void(0)">8</a>分钟前 来自 weibo.com</li>
                </ul>
                <p id="center-part_p">【The Clocks】跟Fliqlo类似，都是拍照时候的背景神器[
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
              
              <!-- 评论 -->
              <div id="comment_div" class="comment_div" style="display:none;">
              		<img src="front/image/comment_header_img.png" id="comment_img">
                    <input type="text" id="comment_input"/><br>
                    <a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img1.png" id="comment_pace_png"/></a>
           			<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img2.png" id="comment_pace_png"/></a>
                    <input type="checkbox" id="comment_check"><span id="comment_check_word">同时转发到我的微博</span>
                    <img src="front/image/comment_btn.png" id="comment_btn"/>
                    
                    <div id="comment_div_two" class="comment_div_two">
                    	<a href="javascript:void(0)" class="comment_div_two_a1">全部</a>
                    	<a href="javascript:void(0)" class="comment_div_two_a">关注的人</a>
                    	<a href="javascript:void(0)" class="comment_div_two_a">陌生人</a>
                    	<a href="javascript:void(0)" class="comment_div_two_a2">共<font>10087</font>条</a>
                    </div>
                    
                    <div id="comment_div_three" class="comment_div_three">
                    	<a href="javascript:void(0)" class="comment_div_three_a1"><img src="front/image/comment_header_img.png" id="comment_img"></a>
                    	<a href="javascript:void(0)" class="comment_div_three_a">扎个马尾:</a>
                    	<span class="comment_div_three_a">中秋节快乐!!!</span>
                    </div>
                    <div id="comment_div_four" class="comment_div_four">
                    	<span class="comment_div_four_a1">9月15日  22:08</span>
                    	<a href="javascript:void(0)" class="comment_div_four_a"><img src="front/image/center-part_foot04.png"/><font class="comment_div_four_font">650</font></a>
                    	<a href="javascript:void(0)" class="comment_div_four_a" onclick="showcommentfour('comment_div_four_click')">回复</a>
                    	<a href="javascript:void(0)" class="comment_div_four_a">举报</a>
                    </div>
                    <div id="comment_four_first">
	                    <div id="comment_div_four_click" class="comment_div_four_click" style="display:none;">
		                    <input type="text" id="comment_input" class="comment_div_four_input"/><br>
		                    <a href="javascript:void(0)" id="comment_four_pace" class="comment_div_four_pace"><img src="front/image/write_img1.png" id="comment_pace_png"/></a>
		           			<a href="javascript:void(0)" id="comment_four_pace" class="comment_div_four_pace"><img src="front/image/write_img2.png" id="comment_pace_png"/></a>
		                    <input type="checkbox" id="comment_four_check" class="comment_div_four_check"><span id="comment_four_check_span" class="comment_div_four_check">同时转发到我的微博</span>
		                    <img src="front/image/comment_btn.png" id="comment_four_btn"/>
	              		</div>
	              	</div>
              </div>
              
        </div>
        
       <div id="center-part-content_01">
            	<a href="javascript:void(0)" id="center-part_img"><img src="front/image/userphoto001.png"/></a>
                <a href="javascript:void(0)" class="center-part_way" id="center-part_way1" onClick="showcenterhidediv('center-part_choose1')" onMouseOver="changecentercolor('center-part_way1')" onMouseOut="changecentercolors('center-part_way1')"><img src="front/image/conter-part_wayimg01.png"/></a>
                    <div style="display:none;" class="center-partchoose" id="center-part_choose1" onMouseUp="hidecenterdiv('center-part_choose1')">
                        <ul>
                            <li class="center-partc1" id="center-partchoose1" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">帮上头条</a></li><br>
                           <li class="center-partc1" id="center-partchoose2" style="height:20px;width:130px;"> <a href="javascript:void(0)" id="center-parta1">屏蔽</a></li><br>
                            <li class="center-partc1" id="center-partchoose3" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">取消关注</a></li>
                           <li class="center-partc1" id="center-partchoose4" style="height:20px;width:130px;"> <a href="javascript:void(0)" id="center-parta1">举报</a></li>
                   	  </ul>
                	</div>
   
                <ul id="center-part_ul">
                	<li id="center-part_li">百科酱</li>
                    <li style="height:0px;width:250px;position:relative;left:18px;"><a href="javascript:void(0)">3</a>小时前 来自 weibo.com</li>
                </ul>
                <p id="center-part_p">阿里巴巴集团董事局主席马云成功的十大法则！不要抱怨，寻找机会，时刻拥有梦想，尊重文化，取一个好听的名字</p>
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
   
                <ul id="center-part_ul">
                	<li id="center-part_li">网易云音乐</li>
                    <li style="height:0px;width:150pxwidth:250px;position:relative;left:18px;"><a href="javascript:void(0)">20</a>分钟前 来自 weibo.com</li>
                </ul>
                <p id="center-part_p">音乐一响起，好似曾经的追剧时光回来了！用一首歌的时间去感受中国电视剧20年！一起来看！</p>
                
              
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
            </div> -->
          </div>  <!-- 目前三篇微博的根  id="xixi" -->
          
          <div id="changePage" style="float:left;background:#fff;margin-top:3px;margin-left:50px;">
        	<div style="float:left;background:#fff;width:240px;border-right:1px gray solid;"><a href="javascript:void(0)" onclick="prePage(0)">上一页</a></div>
        	<select id="select1" onChange="selectPageNo(this)">
        		<%
        			PageUtil pages=(PageUtil)session.getAttribute("pageUtil");
        			for(int i=1;i<=pages.getTotalPages();i++){
        		%>
        				<option><%=i %></option>
        		<%
        			}
        		%>
        	</select>
        	<div style="float:left;background:#fff;width:240px;"><a href="javascript:void(0)" onclick="nextPage(0)">下一页</a></div>
    	  </div>
        </div>
       
    </div> 
    
    <div id="right-part">
    	<div id="right-part-content">
        	<a href="front/page/Personal.jsp?operation=findpersonal&WBUid=${sessionScope.user.WBUid}" id="user_img"><img style="width:65px;height:65px;border-radius:10px;" src="/weibouserimages/${sessionScope.user.uimgPath}"/></a>
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
            		<li style="margin-bottom:0px;"><a href="javascript:void(0)" class="hot_topic_detail">${theme.tname}</a><span class="hot_topic_detail_click">${theme.tview}</span></li>
            	</c:forEach>

            </div>
         </div>


		<!-- <div class="goodfriend_trends">
			<div id="goodfriend_trends_head">
            	<span class="goodfriend_trends_head">好友关注动态</span>
            </div>
            <span class="goodfriend_trends_detail">@shuishuishui等关注了</span><br/>
            <div class="goodfriend_trends_content">
              	 <img src="front/image/goodfriend_trens.png" id="goodfriend_img"/>
              	 <a href="javascript:void(0)"><span id="goodfriend_word1">文神原</span></a><br>
              	 <a href="javascript:void(0)"><span id="goodfriend_word2">新兰本《初》编...</span></a>
              	 <input type="image" src="front/image/attention_friend.png" id="goodfriend_attention"/>
            </div>
         </div> -->
	    
	    <!-- <div id="foot-part">
	    	<img alt="呼呼" src="front/image/weibofoot.png"/>
	    </div>
	        -->
	    <!-- <div id="buoys">
	    	<img src="front/image/letterchat.png" id="buoysimg1"/><span id="buoyschat">私信聊天</span><img src="front/image/chatmes.png" id="buoysimg2"/>
	    </div> -->
	</div>
	
	<script>
		function selectPageNo(obj){//这里就是点击页数的情况，
			//TODO:用ajax传选择的pageno，到后台，设置到session中取出来的pageUtil里面，然后查询，返回参数，然后进行填充
			$.ajax({
				url:'weibo/findWeiboByPage',//请求的url地址
				data:{op:"",pageNo:$(obj).val()},//传输的是json的数据格式
				type:'POST',//请求的类型
				dataType:'JSON',//返回类型的解析方式  
				success:function(data){
					
				}
			});
		}
		
		function prePage(){
			//TODO:用ajax到后台，session中取出pageUtil，然后调用prePage方法，设置pageNo为上一页，，然后查询，返回参数，然后进行填充   
			$.ajax({//这里就是点击前一页的时候，
				url:'weibo/findWeiboByPage',//请求的url地址
				data:{op:"prePage",pageNo:''},//传输的是json的数据格式
				type:'POST',//请求的类型
				dataType:'JSON',//返回类型的解析方式  
				success:function(data){
					//alert("放大招");
					var str="";
					for(var i=0;i<data.length;i++){
						var item=data[i];
						str+="";
					}
				}
			});
		}
		
		function nextPage(){
			//TODO:用ajax到后台，session中取出pageUtil，然后调用prePage方法，设置pageNo为下一页，，然后查询，返回参数，然后进行填充
			$.ajax({//这里就是点击前一页的时候，
				url:'weibo/findWeiboByPage',//请求的url地址
				data:{op:"nextPage",pageNo:''},//传输的是json的数据格式
				type:'POST',//请求的类型
				dataType:'JSON',//返回类型的解析方式  
				success:function(data){
					
				}
			});
		}
	</script>

	</body>
</html>