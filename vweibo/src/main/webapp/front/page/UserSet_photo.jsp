<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta  http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="/vweibo/">
<title>无标题文档</title>
<link rel="stylesheet" href="front/css/UserSet_photo.css" />
<script src="front/js/jquery-1.11.1.min.js"></script>
<script src="front/js/UserSet_photo.js"></script>

</head>

<body>
	<div id="wrap">
    	<div id="left">
        	<span class="idSet">账号设置</span>
            <ul>
            	<li class="line1"></li>
                <li class="myInfo"><img src="front/image/UserSet_image/icon1_1.png"><a href="front/page/UserSet.jsp">我的信息</a></li>
                <li class="photo"><img src="front/image/UserSet_image/icon2_2.png"><a href="front/page/UserSet_photo.jsp">头像</a></li>
                <li class="line2"></li> 
                <li class="privacy"><img src="front/image/UserSet_image/icon3_1.png"><a href="front/page/UserSet_privacy.jsp">隐私设置</a></li>
                <li class="message"><img src="front/image/UserSet_image/icon4_1.png"><a href="front/page/UserSet_message.jsp">消息设置</a></li>
                <li class="prefer"><img src="front/image/UserSet_image/icon5_1.png"><a href="front/page/UserSet_prefer.jsp">偏好设置</a></li>
                <li class="line3"></li>
            </ul>
        </div>
        <div id="right">
            <span class="head_label">头像<span>无法上传？尝试</span><a href="javascript: changeUpWay();">普通上传方法</a></span>
            <span class="choose">选择上传方式</span><br/>
            <input type="file" id="myPhotoFile"/>
            <a href="javascript: openFile();"><img src="front/image/UserSet_image/uploadButton1.png" border="0" /></a> 
            <input type="image" id="myPhotoTake"  src="front/image/UserSet_image/takePhoto1.png" style="width:82px;height:30px"><br/>
            <span id="support">仅支持JPG、GIF、PNG格式，文件小于5M。(使用高质量图片，可生成高清头像)</span>
            <div id="picArea">
                <div id="upPhoto"><video id="video" width="220px" height="220px" autoplay style="margin-left: 20px"></video>
                		
                </div>
                <input type="button" id="snaPhoto" style="margin-left: 100px" value="确定图片">
                <div id="showPhoto">
                    <span class="attention">您上传的图片将会生成三种尺寸头像，请注意中小尺寸的头像是否清晰。</span>
                    <div id="photo1"><canvas  width="280px" height="280px" id="photocanvas"></canvas><blockquote class="bigSize">大尺寸头像，220*220像素</blockquote></div>
                    <div id="photo2"><img src="front/image/UserSet_image/defaultPhoto2.png"><blockquote class="centerSize">中尺寸头像50*50像素(自动生成)</blockquote></div>
                    <div id="photo3"><img src="front/image/UserSet_image/defaultPhoto3.png"><blockquote class="smallSize">小尺寸头像30*30像素(自动生成)</blockquote></div>
                </div>
            </div>
            
        </div>
        
        <div id="right1">
            <span class="head_label1">头像<span>无法上传？尝试</span><a href="javascript: changeUpWay();">更多上传方法</a></span>
            <span class="choose">普通模式上传</span><br/>
           	<div id="upFilePhoto"><img src="front/image/UserSet_image/commonUpPhoto.png"></div>
            <div id="commonUp">
                <input type="text" style="width:200px;height:25px"/>
                <input type="file" id="myCommonFile"/>
                <a href="javascript: openCommonFile();" class="browseFile"><img src="front/image/UserSet_image/browsePhoto1.png" border="0" /></a> <br/>
                <span id="support1">请选择jpg、gif格式，小于2M的图片（使用高质量图片，可生成高清头像）</span><br/>
                <input type="image" src="front/image/UserSet_image/savePhoto1.png" class="saveCommon"/>
            </div>
            
        </div>
    </div>
    <script type="text/javascript">
  //调用摄像头自拍
    var openVideo=document.getElementById("myPhotoTake");
    var snaPhoto=document.getElementById("snaPhoto");
    var canvas=document.getElementById("photocanvas");
    var context=canvas.getContext("2d");
    ///getContext方法创建一个在画布上绘图的环境，他里面的参数指定了你要绘制的图形类型
    var video=document.getElementById("video");
    openVideo.addEventListener("click",function(){
    	navigator.getMedia=(navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia ||  navigator.msGetUserMedia);
    	navigator.getMedia(
    		{
    			video:true,
    			audio:false	
    		},
    		//回调函数
    		function(localMediaStream){
    				video.src=window.URL.createObjectURL(localMediaStream);//视频流给video/标签
    					//对视频的处理方法	
    		},
    		function(err){
    			console.log(err);	
    		}
    	); 
    });
    
    snaPhoto.addEventListener("click",function(){
    	context.drawImage(video,0,0,220,220);	
    });
    </script>
</body>
</html>
