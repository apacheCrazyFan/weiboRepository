<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>发现-热门微博</title>
<base href="/vweibo/">
<link rel="shortcut icon" href="front/image/title_logo.png">
<link rel="stylesheet" href="front/css/found_hotWeibo.css">
<script src="front/js/jquery-1.11.1.min.js"></script>
<script src="front/js/found_hotWeibo.js"></script>
</head>

<body>
<input type="hidden" value="${sessionScope.user.WBUid}" id="hiddenid">
	<div id="header">
    	<img class="head_logo" src="front/image/found_image/head_logo_sh_mini.png"/>
        <div class="searchTextBorder">
        	<input type="text" class="searchText" placeholder="微微一笑很倾城" onClick="searchClick()" onBlur="searchBlur()"/>
            <a href="#" class="search_pic"></a>
        </div>
        <ul>
        	<li><a href="http://localhost:8080/vweibo/front/page/afterlogin.jsp" class="homePage">首页</a></li>
            <li><a href="http://localhost:8080/vweibo/front/page/found_hotWeibo.jsp?WBUid=${sessionScope.user.WBUid}" class="foundPage">发现</a></li>
            <li><a href="http://localhost:8080/vweibo/front/page/Personal.jsp?operation=findpersonal&WBUid=${sessionScope.user.WBUid}" class="personPage">${sessionScope.user.uname}</a></li>
        </ul>
        <div class="settingArea">
        	<a href="http://localhost:8080/vweibo/front/page/messagebox.jsp?wbuid=${sessionScope.user.WBUid}" class="message_pic"></a>
            <a href="http://localhost:8080/vweibo/front/page/UserSet.jsp?wbuid=${sessionScope.user.WBUid}" target="_blank" class="setting_pic"></a>
            <a href="http://localhost:8080/vweibo/front/page/helpArea.jsp?wbuid=${sessionScope.user.WBUid}" class="help_pic"></a>
        </div>
    </div>
    <div id="logoArea">
    	<img class="logo1" src="front/image/found_image/logoArea_logo.png">
        <img class="logo2" src="front/image/found_image/logoArea_word.png">
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
                	<!-- <div class="topic_content_detail"></div>
                    <div class="topic_content_detail">
                    	<img src="/weibouserimages/zanwu.jpg" style="height: 100px;width: 100px;border: 1px solid #DDDDDD;margin: 10px 0px 0px 10px;float: left">
                    	<a href="#" style="float: left; margin-left: 20px;margin-top: 15px;"><span style="color: red">Number 1</span> #乔任梁去世#</a>
                    	<span style="float: left; margin-left: 20px;margin-top: 10px;">乔任梁经纪公司发声明，确认乔任梁于9月16日晚去世。公司称过去</span>
                    	<span style="float: left; margin-left: 20px;margin-top: 10px;">阅读数：10亿 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发起人:新浪 </span>
                    </div>
                    <div class="topic_content_detail">2</div>
                    <div class="topic_content_detail">3</div>
                    <div class="topic_content_detail">4</div>
                    <div class="topic_content_detail">5</div>
                    <div class="topic_content_detail">6</div>
                    <div class="topic_content_detail">7</div>
                    <div class="topic_content_detail">8</div>
                    <div class="topic_content_detail">9</div> -->
                </div>
                <div class="topic_page"></div>
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
                    <div class="find_content_detail">
                    	 <!-- <ul>
                    		
                    		<li  style="margin:15px;float:left;border:1px solid #DDDDDD;width:250px;height:120px;postion:absolute">
                    		 <img  src="front/image/UserSet_image/test_pic.jpg" style="border-radius:50px;height: 50px;width: 50px">
                    		 <span style="float: right;margin-right: 125px;margin-top: 10px">122455</span>
                    		 <span  id="UserIntroduce">11111111111111111</span>
                    		 <img src="front/image/guanzhu.jpg" style="margin-left: 60px;margin-top: 10px">
                    		 </li>
                    		 
                    		
                    	</ul>
                    -->
                    </div>
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
    <script type="text/javascript">
    function openAndClose(menuId,contentId){
    	$(menuId).css('background','#A7B9D3');
    	$(contentId).show();	
    	if(menuId==".found_hot"){
    		$('.found_find').css('background','rgba(167,173,190,0)');$('#find_right').hide();
    		$('.found_music').css('background','rgba(167,173,190,0)');$('#music_right').hide();
    		$('.found_video').css('background','rgba(167,173,190,0)');$('#video_right').hide();
    		$('.found_news').css('background','rgba(167,173,190,0)');$('#news_right').hide();
    		$('.found_topic').css('background','rgba(167,173,190,0)');$('#topic_right').hide();
    	}
    	if(menuId==".found_find"){
    		$('.found_hot').css('background','rgba(167,173,190,0)');$('#hot_right').hide();
    		$('.found_music').css('background','rgba(167,173,190,0)');$('#music_right').hide();
    		$('.found_video').css('background','rgba(167,173,190,0)');$('#video_right').hide();
    		$('.found_news').css('background','rgba(167,173,190,0)');$('#news_right').hide();
    		$('.found_topic').css('background','rgba(167,173,190,0)');$('#topic_right').hide();
    		
        	$.post("user/findMingRen",function(data){
        		var str="";
        		for(var i=0;i<data.length;i++){
        			 str+='<ul><li  style="margin:15px;float:left;border:1px solid #DDDDDD;width:250px;height:120px;postion:absolute">';
	           		 if(data[i].UimgPath!=null && data[i].UimgPath!=""){
        				 str+='<img  src="/weibouserimages/'+data[i].UimgPath+'" style="border-radius:50px;height: 50px;width: 50px">';
	           		 }else{
        				 str+='<img  src="/weibouserimages/zanwu.jpg" style="border-radius:50px;height: 50px;width: 50px">';
	           		 }
	           		 
	           		 str+='<span style="float: right;margin-right: 125px;margin-top: 10px">'+data[i].Uname+'</span>';
	           		 /* if(data[i].Uintroduce!=null && data[i].Uintroduce!=""){
	           			 str+='<span  id="UserIntroduce" style="height:10px;width:80px">'+data[i].Uintroduce+'</span>';
	           		 }else{
	           			 str+='<span  id="UserIntroduce" style="height:10px;width:80px">暂无介绍</span>';
	           		 } */
	           		 str+='<img src="front/image/guanzhu.jpg" style="margin-left: 60px;margin-top: 10px" onclick="guanzhu('+data[i].WBUid+')">';
	           		 str+='</li></ul>';
        		}
        		$(".find_content_detail").append(str);
        	},"json");

    	}
    	if(menuId==".found_music"){
    		$('.found_find').css('background','rgba(167,173,190,0)');$('#find_right').hide();
    		$('.found_hot').css('background','rgba(167,173,190,0)');$('#hot_right').hide();
    		$('.found_video').css('background','rgba(167,173,190,0)');$('#video_right').hide();
    		$('.found_news').css('background','rgba(167,173,190,0)');$('#news_right').hide();
    		$('.found_topic').css('background','rgba(167,173,190,0)');$('#topic_right').hide();	
    	}
    	if(menuId==".found_video"){
    		$('.found_find').css('background','rgba(167,173,190,0)');$('#find_right').hide();
    		$('.found_music').css('background','rgba(167,173,190,0)');$('#music_right').hide();
    		$('.found_hot').css('background','rgba(167,173,190,0)');$('#hot_right').hide();
    		$('.found_news').css('background','rgba(167,173,190,0)');$('#news_right').hide();
    		$('.found_topic').css('background','rgba(167,173,190,0)');$('#topic_right').hide();
    	}
    	if(menuId==".found_news"){
    		$('.found_find').css('background','rgba(167,173,190,0)');$('#find_right').hide();
    		$('.found_music').css('background','rgba(167,173,190,0)');$('#music_right').hide();
    		$('.found_video').css('background','rgba(167,173,190,0)');$('#video_right').hide();
    		$('.found_hot').css('background','rgba(167,173,190,0)');$('#hot_right').hide();
    		$('.found_topic').css('background','rgba(167,173,190,0)');	$('#topic_right').hide();
    	}
    	if(menuId==".found_topic"){
    		$('.found_find').css('background','rgba(167,173,190,0)');$('#find_right').hide();
    		$('.found_music').css('background','rgba(167,173,190,0)');$('#music_right').hide();
    		$('.found_video').css('background','rgba(167,173,190,0)');$('#video_right').hide();
    		$('.found_news').css('background','rgba(167,173,190,0)');$('#news_right').hide();
    		$('.found_hot').css('background','rgba(167,173,190,0)');$('#hot_right').hide();
    		
    		$.post("theme/miniTheme",function(data){
    			var str='<div class="topic_content_detail"></div>';
    			for(var i=0;i<data.length;i++){
    				str+='<div class="topic_content_detail">';
    				if(data[i].tpics!="" && data[i].tpics!=null){
    					var pic=data[i].tpics.split(",")[0];
                 		str+='<img src="/weibopics/'+pic+'" style="height: 100px;width: 100px;border: 1px solid #DDDDDD;margin: 10px 0px 0px 10px;float: left">';
    				}else{
                 		str+='<img src="/weibouserimages/zanwu.jpg" style="height: 100px;width: 100px;border: 1px solid #DDDDDD;margin: 10px 0px 0px 10px;float: left">';
    				}
                 	str+='<a href="#" style="float: left; margin-left: 20px;margin-top: 15px;"><span style="color: red">Number '+(i+1)+'</span> '+data[i].tname+'</a><br>';
                 	if(data[i].ttxt.length>15){
                 		str+='<br><span style="float: left; margin-left: 20px;margin-top: 10px;">'+data[i].ttxt.substring(0,15)+'...</span>';
                 	}else{
                 		str+='<br><span style="float: left; margin-left: 20px;margin-top: 10px;">'+data[i].ttxt+'</span>';
                 	}
                 	var newDate = new Date(data[i].tdate);
                 	str+='<br/><span style="float: left; margin-left: 20px;margin-top: 10px;font-size:13px">阅读数：&nbsp;&nbsp;'+data[i].tview+' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发起时间 :&nbsp;&nbsp;'+newDate.toLocaleString()+' </span></div>';
    			}
    			$(".topic_content").append(str);
    		},"json")
    	}
    }

function guanzhu(obj){
	$.post("user/guanzhu",{"WBUid":$("#hiddenid").val(),"MWBUid":obj},function(data){
		alert(data);
	})
}
    
    
    </script>
</body>
</html>
