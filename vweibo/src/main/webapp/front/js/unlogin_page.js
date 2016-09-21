// JavaScript Document
var range = 50;             //距下边界长度/单位px  
var elemt = 500;           //插入元素高度/单位px  
var maxnum = 15;            //设置加载最多次数  
var num = 1;  
var totalheight = 0; 

var dataStrArr = '';

$(document).ready(function(){  
var pageSize = 15;
var pageNum = 1;
$.ajax({
	  url: "weibo/indexDataPrarery",
	  cache: false,
	  data:{"pageSize":pageSize,"pageNum":pageNum},
	  dataType:"json",
	  Type:"GET",
	  success: function(data,textStatus){
	    if(data){
	    	dataStrArr = JSON.stringify(data.weiboList); //json对象转化为json字符串
	    	
	    	for(var i=0;i<6;i++){
	    		num ++;
	    		
	    		var dataMsg = data.weiboList[i];
	    		
	    		if(dataMsg != undefined){
	    			
	    		
	    		var content = dataMsg.WBTXT; //首先已经确定他的内容不为空了！
	    		var username = dataMsg.UNAME;  //用户名
	    		var userImgPaht = dataMsg.UIMGPATH; //用户图像路径
	    		var location = dataMsg.WBLOCATION; //地理位置/电脑用户名 
	    		
	    		var videoMap = ''; //视频路径
				var picsMap = ''; //图片路径 
				var musicMap = '';//音乐路径
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
				
				newStr += '<a href="javascript:void(0)" id="center-part_img" class="center-part_img"  style="padding-right:10px;"><img title="'+username+'" style="width:65px;height:65px;border-radius:10px;" src="/weibouserimages/'+userImgPaht+'"/></a>';
				newStr += '<ul id="center-part_ul">';
				newStr += '<li id="center-part_li">'+username+'</li>';
            	newStr += '<li style="height:0px;width:250px;margin-left:16px;"><a href="javascript:void(0)">'+date+'</a> 来自 '+location+'</li>';
            	newStr += '</ul>';
                
				//表情处理
				var newContent ='';
				var newContent1 = '';
				faceArr = content.split("[");
				for(var k = 0; k < faceArr.length; k ++){
					if(faceArr[k] != "" && faceArr[k].split("]]").length == 1 && faceArr[k].split("]").length > 1){ //说明是表情 
						faceArr[k] = '<img src="front/image/face_image/'+faceArr[k].split("]")[0]+'.png" style="margin-left:16px" />'+faceArr[k].split("]")[1];
						newContent += faceArr[k];
					}
					if(faceArr[k].split("]]").length > 1){
						newContent = '[['+faceArr[k]+newContent;
					}
				}
				
				/* console.info(content);
				console.info(faceArr);
				console.info(newContent); */
				var faceRegx1 = new RegExp('\\n','gi');
				faceArr1 = newContent.split(faceRegx1);
				for(var j = 0; j < faceArr1.length; j ++){
					newContent1 += faceArr1[j]+'<br />';
				}
				newStr += '<p id="center-part_p" style="width:500px;position:relative;left:29px;">'+newContent1+'</p>';
			
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
						newStr += '<embed autoplay="true" src="/weibovideoes/'+video[i]+'" style="width:500px;height:300px;"/>';
					}
				}

				//音乐处理
				if (musicMap != "") {
					var music = musicMap.split(",");
					for(var i = 0; i < music.length; i ++){
						newStr += '<audio autoplay="true" style="width:100px;height:100px;display:block;" src="/weibomusics/'+music[i]+'"/>';
					}
				}
				
				newStr += '</div>';
				newStr += '<div id="center_footnum" class="center_footnum">';
				newStr += '<a href="javascript:void(0)" id="center_footnum1" onClick="addcollectiondiv(&quot;center_footnum1_col&quot;)"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>';
				newStr += '<a href="javascript:void(0)" id="center_footnum2" onClick="addtransmitdiv(&quot;center_footnum2_transmit&quot;)"><img src="front/image/center-part_foot02.png" id="foot01_img"/>'+dataMsg.WHREPRINTACCOUNT+'</a>';
				newStr += '<a href="javascript:void(0)" id="center_footnum3" onClick="addcommentdiv(&quot;comment_div&quot;)"><img src="front/image/center-part_foot03.png" id="foot01_img"/>'+dataMsg.WHCOMMENTACCOUNT+'</a>';
				newStr += '<a href="javascript:void(0)" id="center_footnum4"><img src="front/image/center-part_foot04.png" id="foot01_img"/>'+dataMsg.WHGREATEACCOUNT+'</a>';
				newStr += '</div>';
				
				
				newStr += '<div id="center_footnum1_col" class="center_footnum1_col" style="display:none;">';
				newStr += '<div id="collection_div_unline">';
				newStr += '<span id="collection_div_title">收藏</span>';
				newStr += '<a href="javascript:void(0)" id="colle_closepng_a" class="colle_closepng_a" onMouseOut="collectiondivcloseimg(&quot;colle_closepng_a&quot;)" onClick="changecollectionsearch(&quot;center_footnum1_col&quot;)" onMouseOver="collectiondivcloseimg2(&quot;colle_closepng_a&quot;)"><img src="front/image/superdivclose.png" id="colle_closepng"></a>';
				newStr += '</div>';
				newStr += '<div id="collection_div_tishi">';
				newStr += '<img src="front/image/collectionsuccess.png" id="collection_div_img"/>';
				newStr += '<span id="collection_div_su">收藏成功!</span>';
				newStr += '</div>';
				newStr += '<div id="collection_div_word"><img src="front/image/tishi.png" id="tishi_img"/><font id="tishi_word">添加标签来管理你的收藏</font></div>';
				
				newStr += '<div id="keyword" style="width:390px;height:32px;">';
				newStr += '<input type="text" id="keyword_tip1" style="width:390px;height:32px;"/>';
				
				newStr += '<div style="height:45px;background:#F0F0F0;width:430px;position:relative;top:16px;right:20px;"><input type="image" id="keyword_tip2" src="front/image/keyword_add.png"/>';
				newStr += '<input type="image" id="keyword_tip2" src="front/image/keyword_cancel.png" onClick="closecollectiondiv(&quot;center_footnum1_col&quot;)"/></div>';
				newStr += '</div>';
				newStr += '</div>';
				
				newStr += '<div id="center_footnum2_transmit" class="center_footnum2_transmit" style="display:none;">';
				newStr += '<div id="transmit_div_unline">';
				newStr += '<span id="transmit_div_title">转发微博</span>';
				newStr += '<a href="javascript:void(0)" id="transmit_closepng_a" class="transmit_closepng_a" onMouseOut="transmitdivcloseimg(&quot;transmit_closepng_a&quot;)" onClick="changetransmitsearch(&quot;center_footnum2_transmit&quot;)" onMouseOver="transmitdivcloseimg2(&quot;transmit_closepng_a&quot;)"><img src="front/image/superdivclose.png" id="colle_closepng"></a>';
				newStr += '</div>';
				newStr += '<div id="transmit_header">';
				newStr += '<span id="transmit_header_word">转发到：</span><a href="javascript:void(0)" id="transmit_where">我的微博</a>';
				newStr += '</div>';
				newStr += '<textarea class="transmit_input" id="transmit_txt" title="微博输入框" node-type="textE1" placeholder="请输入转发理由"></textarea>';
				newStr += '<a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img1.png" id="transmit_pace_png"/></a>';
				newStr += '<a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img2.png" id="transmit_pace_png"/></a>';
				newStr += '<a href="javascript:void(0)" id="transmit_aa" onClick="showhidetransmitdiv(&quot;transmit_choose&quot;)">公开<img src="front/image/limits_img5.png"/></a>';
				newStr += '<input name="imgbtn" type="image" src="front/image/transmit_sure.png" id="transmit">';
				
				newStr += '<div id="transmit_choose" class="transmit_choose" style="display:none;" onMouseUp="hidetransmitdiv(&quot;transmit_choose&quot;)">';
				newStr += '<ul>';
				newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:26px;position:relative;top:4px;right:-3px;"><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;top:2px;left:6px"/><li class="c1" id="choose1" onClick="changewords()" style="height:12px;position:relative;bottom:4px;"/>公开</li></a><br>';
				newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:26px;position:relative;top:4px;right:-3px;"><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose2" onClick="changewords1()" style="height:12px;position:relative;bottom:-1px;">好友圈</li></a><br>';
				newStr += ' <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:26px;position:relative;top:10px;right:-3px;"><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose3" onClick="changewords2()" style="height:12px;position:relative;bottom:-1px;">仅自己可见</li></a>';
				newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:26px;position:relative;top:17px;right:-3px;"><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose4" onClick="changewords3()" style="height:12px;position:relative;bottom:-2px;">群可见</li></a>';
				newStr += '</ul>';
				newStr += '</div>';
				newStr += '</div>';
				
				newStr += '<div id="comment_div" class="comment_div" style="display:none;">';
				newStr += '<img src="front/image/comment_header_img.png" id="comment_img">';
				newStr += '<input type="text" id="comment_input"/><br>';
				newStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img1.png" id="comment_pace_png"/></a>';
				newStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img2.png" id="comment_pace_png"/></a>';
				newStr += '<input type="checkbox" id="comment_check"><span id="comment_check_word">同时转发到我的微博</span>';
				newStr += '<img src="front/image/comment_btn.png" id="comment_btn"/>';
				newStr += '</div>';
				
				
				$("#xinxin").append('<div id="center-part-content_01">'+newStr+'</div>');  
	    	}  
	      }
	    }
	  },
	  error:function(textStatus,error){
		  alert("数据加载有误:"+error);
	  }
	
});


$(window).scroll(function(){  
	var srollPos = $(window).scrollTop();    //滚动条距顶部距离(页面超出窗口的高度)  
	  
	//console.log("滚动条到顶部的垂直高度: "+$(document).scrollTop());  
	//console.log("页面的文档高度 ："+$(document).height());  
	//console.log('浏览器的高度：'+$(window).height());  
	  
	totalheight = parseFloat($(window).height()) + parseFloat(srollPos);  
	
	if(($(document).height()-range) <= totalheight  && num<=maxnum) { 
		
		$("#center-part").append('<div id="center-part-content"></div>');  
 		num++;  
	}  
});
});  

$(window).scroll(function(){  
	var srollPos = $(window).scrollTop();    //滚动条距顶部距离(页面超出窗口的高度)  
	  
	//console.log("滚动条到顶部的垂直高度: "+$(document).scrollTop());  
	//console.log("页面的文档高度 ："+$(document).height());  
	//console.log('浏览器的高度：'+$(window).height());  
	  
	totalheight = parseFloat($(window).height()) + parseFloat(srollPos);  
	
	if(($(document).height()-range) <= totalheight  && num<=maxnum) { 
		var newDataArr = dataStrArr.split("},{");
		var dataMsgPre = '{'+newDataArr[num-1]+'}';
		if(num == newDataArr.length){
			dataMsgPre = '{'+newDataArr[num-1].substring(0,newDataArr[num-1].length-1);
		}
		
		if(dataMsgPre == '{' || dataMsgPre == '}' || dataMsgPre == '{undefined}'){
			return;
		}
		var dataMsg = JSON.parse(dataMsgPre);
		
		var dataStrJson =  JSON.parse(dataStrArr)   //将json字符串转换为JSON对象
		
		//console.info(dataStrJson);

		//var dataMsg = data.weiboList[i];
		var content = dataMsg.WBTXT; //首先已经确定他的内容不为空了！
		var username = dataMsg.UNAME;  //用户名
		var userImgPaht = dataMsg.UIMGPATH; //用户图像路径
		var location = dataMsg.WBLOCATION; //地理位置/电脑用户名 
		
		var videoMap = ''; //视频路径
		var picsMap = ''; //图片路径 
		var musicMap = '';//音乐路径
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
		
		newStr += '<a href="javascript:void(0)" id="center-part_img" class="center-part_img"><img title="'+username+'" style="width:65px;height:65px;" src="/weibouserimages/'+userImgPaht+'"/></a>';
		newStr += '<ul id="center-part_ul">';
		newStr += '<li id="center-part_li">'+username+'</li>';
        newStr += '<li style="height:0px;width:150px;"><a href="javascript:void(0)">'+date+'</a> 来自 '+location+'</li>';
        newStr += '</ul>';
        
		//表情处理
		var newContent ='';
		var newContent1 = '';
		faceArr = content.split("[");
		for(var k = 0; k < faceArr.length; k ++){
			if(faceArr[k] != "" && faceArr[k].split("]]").length == 1 && faceArr[k].split("]").length > 1){ //说明是表情 
				faceArr[k] = '<img src="front/image/face_image/'+faceArr[k].split("]")[0]+'.png" />'+faceArr[k].split("]")[1];
				newContent += faceArr[k];
			}
			if(faceArr[k].split("]]").length > 1){
				newContent = '[['+faceArr[k]+newContent;
			}
		}
		
		 console.info(content);
		console.info(faceArr);
		console.info(newContent); 
		var faceRegx1 = new RegExp('\\n','gi');
		faceArr1 = newContent.split(faceRegx1);
		for(var j = 0; j < faceArr1.length; j ++){
			newContent1 += faceArr1[j]+'<br />';
		}
		newStr += '<p id="center-part_p" style="width:500px;position:relative;left:29px;">'+newContent1+'</p>';
	
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
				newStr += '<embed autoplay="true" src="/weibovideoes/'+video[i]+'" style="width:500px;height:300px;"/>';
			}
		}

		//音乐处理
		if (musicMap != "") {
			var music = musicMap.split(",");
			for(var i = 0; i < music.length; i ++){
				newStr += '<audio autoplay="true" style="width:100px;height:100px;display:block;" src="/weibomusics/'+music[i]+'"/>';
			}
		}
		
		newStr += '</div>';
		newStr += '<div id="center_footnum" class="center_footnum">';
		newStr += '<a href="javascript:void(0)" id="center_footnum1" onClick="addcollectiondiv(&quot;center_footnum1_col&quot;)"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>';
		newStr += '<a href="javascript:void(0)" id="center_footnum2" onClick="addtransmitdiv(&quot;center_footnum2_transmit&quot;)"><img src="front/image/center-part_foot02.png" id="foot01_img"/>'+dataMsg.WHREPRINTACCOUNT+'</a>';
		newStr += '<a href="javascript:void(0)" id="center_footnum3" onClick="addcommentdiv(&quot;comment_div&quot;)"><img src="front/image/center-part_foot03.png" id="foot01_img"/>'+dataMsg.WHCOMMENTACCOUNT+'</a>';
		newStr += '<a href="javascript:void(0)" id="center_footnum4"><img src="front/image/center-part_foot04.png" id="foot01_img"/>'+dataMsg.WHGREATEACCOUNT+'</a>';
		newStr += '</div>';
		
		
		newStr += '<div id="center_footnum1_col" class="center_footnum1_col" style="display:none;">';
		newStr += '<div id="collection_div_unline">';
		newStr += '<span id="collection_div_title">收藏</span>';
		newStr += '<a href="javascript:void(0)" id="colle_closepng_a" class="colle_closepng_a" onMouseOut="collectiondivcloseimg(&quot;colle_closepng_a&quot;)" onClick="changecollectionsearch(&quot;center_footnum1_col&quot;)" onMouseOver="collectiondivcloseimg2(&quot;colle_closepng_a&quot;)"><img src="front/image/superdivclose.png" id="colle_closepng"></a>';
		newStr += '</div>';
		newStr += '<div id="collection_div_tishi">';
		newStr += '<img src="front/image/collectionsuccess.png" id="collection_div_img"/>';
		newStr += '<span id="collection_div_su">收藏成功!</span>';
		newStr += '</div>';
		newStr += '<div id="collection_div_word"><img src="front/image/tishi.png" id="tishi_img"/><font id="tishi_word">添加标签来管理你的收藏</font></div>';
		
		newStr += '<div id="keyword" style="width:390px;height:32px;">';
		newStr += '<input type="text" id="keyword_tip1" style="width:390px;height:32px;"/>';
		
		newStr += '<div style="height:45px;background:#F0F0F0;width:430px;position:relative;top:16px;right:20px;"><input type="image" id="keyword_tip2" src="front/image/keyword_add.png"/>';
		newStr += '<input type="image" id="keyword_tip2" src="front/image/keyword_cancel.png" onClick="closecollectiondiv(&quot;center_footnum1_col&quot;)"/></div>';
		newStr += '</div>';
		newStr += '</div>';
		
		newStr += '<div id="center_footnum2_transmit" class="center_footnum2_transmit" style="display:none;">';
		newStr += '<div id="transmit_div_unline">';
		newStr += '<span id="transmit_div_title">转发微博</span>';
		newStr += '<a href="javascript:void(0)" id="transmit_closepng_a" class="transmit_closepng_a" onMouseOut="transmitdivcloseimg(&quot;transmit_closepng_a&quot;)" onClick="changetransmitsearch(&quot;center_footnum2_transmit&quot;)" onMouseOver="transmitdivcloseimg2(&quot;transmit_closepng_a&quot;)"><img src="front/image/superdivclose.png" id="colle_closepng"></a>';
		newStr += '</div>';
		newStr += '<div id="transmit_header">';
		newStr += '<span id="transmit_header_word">转发到：</span><a href="javascript:void(0)" id="transmit_where">我的微博</a>';
		newStr += '</div>';
		newStr += '<textarea class="transmit_input" id="transmit_txt" title="微博输入框" node-type="textE1" placeholder="请输入转发理由"></textarea>';
		newStr += '<a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img1.png" id="transmit_pace_png"/></a>';
		newStr += '<a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img2.png" id="transmit_pace_png"/></a>';
		newStr += '<a href="javascript:void(0)" id="transmit_aa" onClick="showhidetransmitdiv(&quot;transmit_choose&quot;)">公开<img src="front/image/limits_img5.png"/></a>';
		newStr += '<input name="imgbtn" type="image" src="front/image/transmit_sure.png" id="transmit">';
		
		newStr += '<div id="transmit_choose" class="transmit_choose" style="display:none;" onMouseUp="hidetransmitdiv(&quot;transmit_choose&quot;)">';
		newStr += '<ul>';
		newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:26px;position:relative;top:4px;right:-3px;"><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;top:2px;left:6px"/><li class="c1" id="choose1" onClick="changewords()" style="height:12px;position:relative;bottom:4px;"/>公开</li></a><br>';
		newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:26px;position:relative;top:4px;right:-3px;"><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose2" onClick="changewords1()" style="height:12px;position:relative;bottom:-1px;">好友圈</li></a><br>';
		newStr += ' <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:26px;position:relative;top:10px;right:-3px;"><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose3" onClick="changewords2()" style="height:12px;position:relative;bottom:-1px;">仅自己可见</li></a>';
		newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:26px;position:relative;top:17px;right:-3px;"><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose4" onClick="changewords3()" style="height:12px;position:relative;bottom:-2px;">群可见</li></a>';
		newStr += '</ul>';
		newStr += '</div>';
		newStr += '</div>';
		
		newStr += '<div id="comment_div" class="comment_div" style="display:none;">';
		newStr += '<img src="front/image/comment_header_img.png" id="comment_img">';
		newStr += '<input type="text" id="comment_input"/><br>';
		newStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img1.png" id="comment_pace_png"/></a>';
		newStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img2.png" id="comment_pace_png"/></a>';
		newStr += '<input type="checkbox" id="comment_check"><span id="comment_check_word">同时转发到我的微博</span>';
		newStr += '<img src="front/image/comment_btn.png" id="comment_btn"/>';
		newStr += '</div>';
		
		
		$("#xinxin").append('<div id="center-part-content_01">'+newStr+'</div>');  
	
 		num++;  
	}  
});


//取消键关闭收藏标签
function closecollectiondiv(id){
	var cancelbtn2=document.getElementById(id);
	if(cancelbtn2){
		if(cancelbtn2.style.display=='block'){
			cancelbtn2.style.display='none';
		}else{
			cancelbtn2.style.display='block';
		}
	}
}

//取消键关闭添加标签(jquery)
function closecollectiondiv(id){
	var cancelbtn2=$('.'+id);
	if(cancelbtn2.is(":visible")){
		if(cancelbtn2.is(":visible")){
			cancelbtn2.hide();
			}else{
				cancelbtn2.show();
			}
	}
}


//控制收藏标签栏的可见
function addcollectiondiv(id){
	var tips2=document.getElementById(id);
	if(tips2){
		if(tips2.style.display=='block'){
			tips2.style.display='none';
		}else{
			tips2.style.display='block';
		}
	}
}

//close图标改变颜色
function collectiondivcloseimg2(id){
	document.getElementById(id).innerHTML='<img src="front/image/superdivclose2.png" id="colle_closepng">';
}
function collectiondivcloseimg(id){
	document.getElementById(id).innerHTML='<img src="front/image/superdivclose.png" id="colle_closepng">';
}
//colse图标关闭div
function changecollectionsearch(id){
	var cancelbtn3=document.getElementById(id);
	if(cancelbtn3){
		if(cancelbtn3.style.display=='block'){
			cancelbtn3.style.display='none';
		}else{
			cancelbtn3.style.display='block';
		}
	}
}

//close图标改变颜色
function transmitdivcloseimg2(id){
	document.getElementById(id).innerHTML='<img src="front/image/superdivclose2.png" id="colle_closepng">';
}
function transmitdivcloseimg(id){
	document.getElementById(id).innerHTML='<img src="front/image/superdivclose.png" id="colle_closepng">';
}
//colse图标关闭div
function changetransmitsearch(id){
	var cancelbtn4=document.getElementById(id);
	if(cancelbtn4){
		if(cancelbtn4.style.display=='block'){
			cancelbtn4.style.display='none';
		}else{
			cancelbtn4.style.display='block';
		}
	}
}

//转发  换权限（公开，朋友圈。。。）
function changewords(){
	document.getElementById("transmit_aa").innerHTML=document.getElementById("choose1").innerHTML;		
}
function changewords1(){
	document.getElementById("transmit_aa").innerHTML=document.getElementById("choose2").innerHTML;	
}

function changewords2(){
	document.getElementById("transmit_aa").innerHTML=document.getElementById("choose3").innerHTML;	
}
function changewords3(){
	document.getElementById("transmit_aa").innerHTML=document.getElementById("choose4").innerHTML;	
}



//转发  选择完权限后隐藏div 
function hidetransmitdiv(id){
	document.getElementById(id).style.display='none';
}
//转发   点击公开出现隐藏的div
function showhidetransmitdiv(id){
	var sbtitle2=document.getElementById(id);
	if(sbtitle2){
		if(sbtitle2.style.display=='block'){
			sbtitle2.style.display='none';
		}else{
			sbtitle2.style.display='block';
		}
	}
}
//控制转发栏的可见
function addtransmitdiv(id){
	var tips2=document.getElementById(id);
	if(tips2){
		if(tips2.style.display=='block'){
			tips2.style.display='none';
		}else{
			tips2.style.display='block';
		}
	}
}

//控制评论标签栏的可见
function addcommentdiv(id){
	var tips3=document.getElementById(id);
	if(tips3){
		if(tips3.style.display=='block'){
			tips3.style.display='none';
		}else{
			tips3.style.display='block';
		}
	}
}

function addcommentdiv1(id){
	var tips4=document.getElementById(id);
	if(tips4){
		if(tips4.style.display=='block'){
			tips4.style.display='none';
		}else{
			tips4.style.display='block';
		}
	}
}
function addcommentdiv2(id){
	var tips5=document.getElementById(id);
	if(tips5){
		if(tips5.style.display=='block'){
			tips5.style.display='none';
		}else{
			tips5.style.display='block';
		}
	}
}

function clickunlogin(id1,id2){
	$("#"+id1).css("border-bottom","2px solid red");
	$("#"+id2).css("border-bottom","2px solid #eee");
}


