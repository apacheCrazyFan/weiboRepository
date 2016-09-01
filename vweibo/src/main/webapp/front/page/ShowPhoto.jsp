<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/vweibo/s">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="front/js/jquery-1.11.1.min.js"></script>
</head>
<body>
	<div >
    	<video id="video" width="300px" height="280px"  autoplay></video>
        <button id="openVideo">打开摄像头</button>
        <button id="snaPhoto" >截取图片</button>
        <canvas style="margin-left: 0px" width="300px" height="280px" id="canvas" style="visibility: false"></canvas>
       <br/>
        <button  onClick="getData('canvas')">上传图片</button>
    </div>
</body>
	<script>
		var openVideo=document.getElementById("openVideo");
		var snaPhoto=document.getElementById("snaPhoto");
		var canvas=document.getElementById("canvas");
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
			context.drawImage(video,0,0,400,300);	
		});
		
		
		
		function getData(canvas){
			var imageData=document.getElementById("canvas").toDataURL("image/jpg");
			var base64Data = imageData.substr(22);
			$.ajax({
				url:"front/page/doPictrue.jsp",
				data:{datas:base64Data},
				type:"POST",
				success:function(data){
					console.info(data);
				}
			})
		}
		
	</script> 
</html>