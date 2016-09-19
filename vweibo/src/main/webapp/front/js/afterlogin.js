//JavaScript Document
var range = 50;             //距下边界长度/单位px  
var elemt = 500;           //插入元素高度/单位px  
var maxnum = 15;            //设置加载最多次数  
var num = 1;  
var totalheight = 0; 

var clicklikenum = 1;
var commentdivnum = 1;
var transmitdivnum = 1;
var collectiondivnum = 1;

var dataStrArrcopy = '';

var datawbids = '';

var dataOriginwbJsonString = '';

var userid = 0;  //当前登录的用户

window.onload=function(){
	
	uid = $("#user").val().trim();
	
	if(uid != ""){
		userid = parseInt(uid);
	}
	var pageSize = 15;
	var pageNum = 1;
	
	$.ajax({
		  url: "weibo/afterLoginDataPrarery",
		  cache: false,
		  data:{"pageSize":pageSize,"pageNum":pageNum,"userid":userid},
		  dataType:"json",
		  Type:"GET",
		  success: function(data,textStatus){
		    if(data){
		    	dataStrArrcopy = JSON.stringify(data.weiboList); //json对象转化为json字符串
		    	datawbids = JSON.stringify(data.wbids);  //该用户收藏微博集合json字符串
		    	dataOriginwbJsonString = JSON.stringify(data.tweiboMap);  //源微博集合json字符串
		    	
		    	dataOriginwbJson = data.tweiboMap;  //源微博集合和json对象
		    	
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
					
					var newDate = new Date();
					newDate.setTime(dataMsg.WBDATE);
					var date = newDate.toLocaleString().substring(newDate.toLocaleString().indexOf(" "));
					
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
					
						newStr += '<a href="javascript:void(0)" id="center-part_img" class="center-part_img"  style="padding-right:10px;"><img title="'+username+'" style="width:65px;height:65px;border-radius:10px;padding-left:10px;" src="/weibouserimages/'+userImgPaht+'"/></a>';
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
								newStr += '<audio controls="true" src="/weibomusics/'+music[i]+'" style="width:500px;height:25px;"/>';
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
						newStr += '<a href="javascript:void(0)" id="center_footnum3_'+commentdivnum+'" class="center_footnum3" onClick="addcommentdiv(&quot;comment_div_'+commentdivnum+'&quot;,'+weiboid+')"><img src="front/image/center-part_foot03.png" id="foot01_img"/>'+dataMsg.WHCOMMENTACCOUNT+'</a>';		//评论
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
						newStr += '<input name="imgbtn" type="image" src="front/image/transmit_sure.png" id="transmit" onClick="transmitweibo(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;,&quot;transmit_input_'+transmitdivnum+'&quot;,&quot;center_footnum2_'+transmitdivnum+'&quot;,&quot;center_footnum2_'+transmitdivnum+'&quot;,'+userid+','+weiboid+','+wbuid+')" onMouseOver="transmitdivcloseimg2(&quot;transmit_closepng_a&quot;)">';
					
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
						newStr += '<img src="/weibouserimages/'+$("#uimgPath").val()+'" id="comment_img" style="width:30px;height:30px;margin-left:15px;margin-top:10px;position:relative;">';
						newStr += '<input type="text" id="comment_input'+commentdivnum+'" class="comment_input"/><br>';
						newStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img1.png" id="comment_pace_png"/></a>';
						newStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img2.png" id="comment_pace_png"/></a>';
						newStr += '<input type="checkbox" id="comment_check'+commentdivnum+'" class="comment_check"><span id="comment_check_word">同时转发到我的微博</span>';
						newStr += '<img src="front/image/comment_btn.png" id="comment_btn" onClick="commentsWeibo(&quot;center_footnum3_'+commentdivnum+'&quot;,&quot;comment_div_'+commentdivnum+'&quot;,&quot;comment_input'+commentdivnum+'&quot;,&quot;comment_check'+commentdivnum+'&quot;,'+userid+','+weiboid+')"/>';
						newStr += '</div>';
					
					
						$("#xixi").append('<div id="center-part-content_01" class="divid_'+clicklikenum+'">'+newStr+'</div>');  
					
						num ++;
						clicklikenum ++;
						commentdivnum ++;
						transmitdivnum ++;
						collectiondivnum ++;
					}else{ //转发微博的处理（即如何显示）
						var originweibo = dataOriginwbJson[weiboid];
						
						var wbuname = originweibo.UNAME;  //微博用户名
						var wbutag = originweibo.UTAG;	//学生，java工程师
						var wbuspeciatag = originweibo.USPECIALTAG; //中国 cn
						  
						var wb_wbid = originweibo.WBID; //yuan微博id
						var wb_transmitaccount = originweibo.WHREPRINTACCOUNT;//yuan转发数
						var wb_commentaccount = originweibo.WHCOMMENTACCOUNT;	//yuan评论数
						var wb_greateaccount = originweibo.WHGREATEACCOUNT; //yuan点赞数
						  
						var wb_picsMap = originweibo.WBPIC; //yuan图片路径 
						var wb_videoMap = originweibo.WBVIDEO; //yuan视频路径
						var wb_musicMap = originweibo.WBMUSIC; //yuan音乐路径
						var wb_wbdate = originweibo.WBDATE; //yuan发表日期
						  
						var wb_content = originweibo.WBTXT; //yuan微博的文本内容
						var wb_location = originweibo.WBLOCATION; //yuan微博的发表地址
						
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
					
						newStr += '<a href="javascript:void(0)" id="center-part_img" class="center-part_img"  style="padding-right:10px;"><img title="'+username+'" style="width:65px;height:65px;border-radius:10px;" src="/weibouserimages/'+userImgPaht+'"/></a>';
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
						newStr += '<p id="center-part_p_'+clicklikenum+'" class="center-part_p" style="width:450px;position:relative;margin-left:80px;">'+newContent1+'</p>';
				
						
						//转发的源微博处理
						var weiboUserMsg = '';
						weiboUserMsg += '<a href="javascript:void(0)"><span style="color:red;">@'+wbuname+'</span></a>';
						weiboUserMsg += '&nbsp;<a href="javascript:void(0)"><span style="color:red;">'+wbutag+'</span></a>';
						weiboUserMsg += '&nbsp;<a href="javascript:void(0)"><span style="color:red;"><img src="/weiboContriesFlags/'+wbuspeciatag+'"</span></a>';
						
						newStr += '<p id="center-part_p_'+clicklikenum+'" class="center-part_p" style="width:450px;position:relative;left:29px;">'+weiboUserMsg+'</p>';
						
						//表情处理
						var wb_newContent ='';
						var wb_newContent1 = '';
						var faceArr = wb_content.split("[");
						for(var k = 0; k < faceArr.length; k ++){
							if(faceArr[k].split("]]").length > 1){  //主题
								wb_newContent = '[['+faceArr[k]+wb_newContent;
							}else if(faceArr[k] != "" && faceArr[k].split("]]").length == 1 && faceArr[k].split("]").length > 1){ //说明是表情 
									faceArr[k] = '<img src="front/image/face_image/'+faceArr[k].split("]")[0]+'.png" />'+faceArr[k].split("]")[1];
									wb_newContent += faceArr[k];
							}else{
								wb_newContent += faceArr[k];
							}
						}
						
						
						var faceRegx1 = new RegExp('\\n','gi');
						var faceArr1 = wb_newContent.split(faceRegx1);
						for(var j = 0; j < faceArr1.length; j ++){
							wb_newContent1 += faceArr1[j]+'<br />';
						}
						newStr += '<p id="center-part_p_'+clicklikenum+'" class="center-part_p" style="width:450px;position:relative;left:29px;">'+wb_newContent1+'</p>';
					
						newStr += '<div id="content_img01">';
						//图片处理 
						if (wb_picsMap != "" && wb_picsMap != undefined) {
							var wb_pics = wb_picsMap.split(",");
							//console.info(pics);
							if(wb_pics.length == 1){
								newStr += '<img width="500px;" height="250px;" src="/weibopics/'+wb_pics[0]+'"/>';
							}else if(wb_pics.length == 2){
								for(var l = 0; l < wb_pics.length; l ++){
									newStr += '<img width="245px;" height="250px;" src="/weibopics/'+wb_pics[l]+'"/>';
								}
							}else if(wb_pics.length == 3){
								for(var m = 0; m < wb_pics.length; m ++){
									newStr += '<img width="160px;" height="250px;" src="/weibopics/'+wb_pics[m]+'"/>';
								}
							}else if(wb_pics.length == 4){
								newStr += '<img style="width:500px;height:330px;" src="/weibopics/'+wb_pics[0]+'"/>';
								for(var n = 1; n < wb_pics.length; n ++){
									newStr += '<img style="width:160px;height:80px;padding-right:3px;padding-left:3px;padding-top:3px;" src="/weibopics/'+wb_pics[n]+'"/>';
								}
							}else if(wb_pics.length == 9){
								for(var r = 0; r < wb_pics.length; r ++){
									newStr += '<img width="160px;" height="160px;" src="/weibopics/'+wb_pics[r]+'"/>';
								}
							}else{
								//图片轮换
								
								
							}
						}
						
						
						//视频处理 
						if (wb_videoMap != "" && wb_videoMap != undefined) {
							var wb_video = wb_videoMap.split(",");
							for (var i = 0; i < wb_video.length; i++) {
								newStr += '<video controls="true" src="/weibovideoes/'+wb_video[i]+'" style="width:500px;height:300px;"/>';
							}
						}

						//音乐处理
						if (wb_musicMap != "" && wb_musicMap != undefined) {
							var wb_music = wb_musicMap.split(",");
							for(var i = 0; i < wb_music.length; i ++){
								newStr += '<audio controls="true" src="/weibomusics/'+wb_music[i]+'" style="width:500px;height:25px;"/>';
							}
						}
						
						var wb_string = new Date();
						wb_string.setTime(wb_wbdate);
						var wb_string_date = wb_string.toLocaleString();
						
						newStr += '<div>';
						newStr += '<li style="height:0px;width:250px;float:left;"><a href="javascript:void(0)">'+wb_string_date+'</a> 来自 '+wb_location;
						newStr += '</li>';
						newStr += '<li style="height:0px;width:250px;float:right;">';
						newStr += '<div id="center_footnum_i_m_g_'+collectiondivnum+'" class="center_footnum_">';
						newStr += '<a href="javascript:void(0)" id="center_footnum2_i_m_g_'+transmitdivnum+'" class="center_footnum_" onClick="addtransmitdiv_i_m_g('+wb_wbid+')"><img src="front/image/center-part_foot02.png" id="foot01_img"/>'+wb_transmitaccount+'</a>'; //转发
						newStr += '<a href="javascript:void(0)" id="center_footnum3_i_m_g_'+commentdivnum+'" class="center_footnum_" onClick="addcommentdiv_i_m_g('+wb_wbid+')"><img src="front/image/center-part_foot03.png" id="foot01_img"/>'+wb_commentaccount+'</a>';	//评论
						newStr += '<a href="javascript:void(0)" id="center_footnum4_i_m_g_'+clicklikenum+'" class="center_footnum_" onClick="clicklike_i_m_g('+wb_wbid+')"><img src="front/image/center-part_foot04.png" id="foot01_img"/>'+wb_greateaccount+'</a>';   //点赞
						newStr += '</div>';
						newStr += '</li>';
						newStr += '</div>';
						newStr += '</div>';
						
						
						newStr += '<div id="center_footnum_'+collectiondivnum+'" class="center_footnum">';
						if(datawbids.indexOf(''+weiboid) < 0){
							newStr += '<a href="javascript:void(0)"	id="center_footnum1_'+collectiondivnum+'" class="center_footnum1" onClick="addcollectiondiv(&quot;center_footnum_col_'+collectiondivnum+'&quot;,'+userid+','+weiboid+')"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>';	//收藏
						}else{
							newStr += '<a href="javascript:void(0)"	id="center_footnum1_'+collectiondivnum+'" class="center_footnum1" onClick="addcollectiondiv(&quot;center_footnum_col_'+collectiondivnum+'&quot;,'+userid+','+weiboid+')"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>已收藏</a>';	//收藏
						}
						newStr += '<a href="javascript:void(0)" id="center_footnum2_'+transmitdivnum+'" class="center_footnum2" onClick="addtransmitdiv(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;)"><img src="front/image/center-part_foot02.png" id="foot01_img"/>'+dataMsg.WHREPRINTACCOUNT+'</a>'; //转发
						newStr += '<a href="javascript:void(0)" id="center_footnum3_'+commentdivnum+'" class="center_footnum3" onClick="addcommentdiv(&quot;comment_div_'+commentdivnum+'&quot;,'+weiboid+')"><img src="front/image/center-part_foot03.png" id="foot01_img"/>'+dataMsg.WHCOMMENTACCOUNT+'</a>';		//评论
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
						newStr += '<input name="imgbtn" type="image" src="front/image/transmit_sure.png" id="transmit" onClick="transmitweibo(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;,&quot;transmit_input_'+transmitdivnum+'&quot;,&quot;center_footnum2_'+transmitdivnum+'&quot;,&quot;center_footnum2_'+transmitdivnum+'&quot;,'+userid+','+weiboid+','+wbuid+')">';
						
						newStr += '<div id="transmit_choose" class="transmit_choose" style="display:none;" onMouseUp="hidetransmitdiv(&quot;transmit_choose&quot;)">';
						newStr += '<ul>';
						newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;top:2px;left:6px"/><li class="c1" id="choose1" onClick="changewords()" style="height:12px;position:relative;bottom:4px;top:3px;">公开</li></a><br>';
						newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose2" onClick="changewords1()" style="height:12px;position:relative;bottom:-1px;top:3px;">好友圈</li></a><br>';
						newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose3" onClick="changewords2()" style="height:12px;position:relative;bottom:-1px;top:3px;">仅自己可见</li></a>';
						newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose4" onClick="changewords3s)" style="height:12px;position:relative;bottom:-2px;top:3px;">群可见</li></a>';
						newStr += '</ul>';
						newStr += '</div>';
						newStr += '</div>';
						
						newStr += '<div id="comment_div_'+commentdivnum+'" class="comment_div" style="display:none;">';
						newStr += '<img src="/weibouserimages/'+$("#uimgPath").val()+'" id="comment_img'+commentdivnum+'" style="width:30px;height:30px;margin-left:15px;margin-top:10px;position:relative;">';
						newStr += '<input type="text" id="comment_input'+commentdivnum+'" class="comment_input"/><br>';
						newStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img1.png" id="comment_pace_png"/></a>';
						newStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img2.png" id="comment_pace_png"/></a>';
						newStr += '<input type="checkbox" id="comment_check'+commentdivnum+'" class="comment_check"><span id="comment_check_word">同时转发到我的微博</span>';
						newStr += '<img src="front/image/comment_btn.png" id="comment_btn" onClick="commentsWeibo(&quot;center_footnum3_'+commentdivnum+'&quot;,&quot;comment_div_'+commentdivnum+'&quot;,&quot;comment_input'+commentdivnum+'&quot;,&quot;comment_check'+commentdivnum+'&quot;,'+userid+','+weiboid+')"/>';
						newStr += '</div>';
						
						$("#xixi").append('<div id="center-part-content_01" class="divid_'+clicklikenum+'">'+newStr+'</div>');  

						clicklikenum ++;
				 		commentdivnum ++;
						transmitdivnum ++;
						collectiondivnum ++;
					} 
		    	}
		      } //for()
		    } //if(data)
		  },  //success
		  error:function(textStatus,error){
			  alert("数据加载有误:"+error);
		  }
		
	});
}

/*好友圈*/
function findFriendWeiBo(WBUid){
	$("#xixi").empty();
	var pageSize = 15;
	var pageNum = 1;
	
	$.ajax({
		  url: "weibo/findFriendWeiBo",
		  cache: false,
		  data:{"pageSize":pageSize,"pageNum":pageNum,"WBUid":WBUid},
		  dataType:"json",
		  Type:"GET",
		  success: function(data,textStatus){
		    if(data){
		    	dataStrArrcopy = JSON.stringify(data.weiboList); //json对象转化为json字符串

		    	for(var zz = 0;zz < 6; zz ++){
		    		var dataMsg = data.weiboList[zz];
		    		if(dataMsg != undefined){
		    			
		    		var content = dataMsg.WBTXT; //首先已经确定他的内容不为空了！
		    		var wbuid = dataMsg.WBUID//发表微博的用户id
		    		var weiboid = dataMsg.WBID; //微博id
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
					
					newStr += '<a href="javascript:void(0)" id="center-part_img" class="center-part_img"  style="padding-left:20px;"><img title="'+username+'" src="/weibouserimages/'+userImgPaht+'" style="height:60px;width:60px" style="height:60px;width:60px"/></a>';
					newStr += '<ul id="center-part_ul">';
					newStr += '<li id="center-part_li">'+username+'</li>';
	                newStr += '<li style="height:0px;width:150px;"><a href="javascript:void(0)">'+date+'</a> 来自 '+location+'</li>';
	                newStr += '</ul>';
	                
					//表情处理
					var newContent ='';
					var newContent1 = '';
					faceArr = content.split("[");
					for(var k = 0; k < faceArr.length; k ++){
						if(faceArr[k].split("]]").length > 1){  //主题
							newContent = '[['+faceArr[k]+newContent;
						}else if(faceArr[k] != "" && faceArr[k].split("]]").length == 1 && faceArr[k].split("]").length > 1){ //说明是表情 
								faceArr[k] = '<img src="front/image/face_image/'+faceArr[k].split("]")[0]+'.png" />'+faceArr[k].split("]")[1];
								newContent += faceArr[k];
						}else{
							newContent = newContent;
						}
					}
					
					/*console.info(content);
					console.info(faceArr);
					console.info(newContent); */
					var faceRegx1 = new RegExp('\\n','gi');
					faceArr1 = newContent.split(faceRegx1);
					for(var j = 0; j < faceArr1.length; j ++){
						newContent1 += faceArr1[j]+'<br />';
					}
					newStr += '<p id="center-part_p" style="width:500px;position:relative;margin-left:80px;">'+newContent1+'</p>';
				
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
					newStr += '<a href="javascript:void(0)" id="center_footnum1" onClick="addcollectiondiv(&quot;center_footnum_col&quot;)"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>';	//收藏
					newStr += '<a href="javascript:void(0)" id="center_footnum2" onClick="addtransmitdiv(&quot;center_footnum_transmit&quot;)"><img src="front/image/center-part_foot02.png" id="foot01_img"/>'+dataMsg.WHREPRINTACCOUNT+'</a>'; //转发
					newStr += '<a href="javascript:void(0)" id="center_footnum3" onClick="addcommentdiv(&quot;comment_div'+commentdivnum+'&quot;)"><img src="front/image/center-part_foot03.png" id="foot01_img"/>'+dataMsg.WHCOMMENTACCOUNT+'</a>';		//评论
					newStr += '<a href="javascript:void(0)" id="center_footnum4" onClick="clicklike(this,'+userid+','+weiboid+','+wbuid+')"><img src="front/image/center-part_foot04.png" id="foot01_img"/>'+dataMsg.WHGREATEACCOUNT+'</a>';   //点赞
					newStr += '</div>';
					
					
					newStr += '<div id="center_footnum_col" class="center_footnum1_col" style="display:none;">';
					newStr += '<div id="collection_div_unline">';
					newStr += '<span id="collection_div_title">收藏</span>';
					newStr += '<a href="javascript:void(0)" id="colle_closepng_a" class="colle_closepng_a" onMouseOut="collectiondivcloseimg(&quot;colle_closepng_a&quot;)" onClick="changecollectionsearch(&quot;center_footnum_col&quot;)" onMouseOver="collectiondivcloseimg2(&quot;colle_closepng_a&quot;)"><img src="front/image/superdivclose.png" id="colle_closepng"></a>';
					newStr += '</div>';
					newStr += '<div id="collection_div_tishi">';
					newStr += '<img src="front/image/collectionsuccess.png" id="collection_div_img"/>';
					newStr += '<span id="collection_div_su">收藏成功!</span>';
					newStr += '</div>';
					newStr += '<div id="collection_div_word"><img src="front/image/tishi.png" id="tishi_img"/><font id="tishi_word">添加标签来管理你的收藏</font></div>';
					
					newStr += '<div id="keyword" style="width:390px;height:32px;">';
					newStr += '<input type="text" id="keyword_tip1" style="width:390px;height:32px;"/>';
					
					newStr += '<div style="height:45px;background:#F0F0F0;width:430px;position:relative;top:16px;right:20px;"><input type="image" id="keyword_tip2" src="front/image/keyword_add.png" onClick="collectiontag(&quot;keyword_tip1&quot;,'+userid+','+weiboid+')"/>';
					newStr += '<input type="image" id="keyword_tip2" src="front/image/keyword_cancel.png" onClick="closecollectiondiv(&quot;center_footnum_col&quot;)"/></div>';
					newStr += '</div>';
					newStr += '</div>';
					
					newStr += '<div id="center_footnum_transmit" class="center_footnum2_transmit" style="display:none;">';
					newStr += '<div id="transmit_div_unline">';
					newStr += '<span id="transmit_div_title">转发微博</span>';
					newStr += '<a href="javascript:void(0)" id="transmit_closepng_a" class="transmit_closepng_a" onMouseOut="transmitdivcloseimg(&quot;transmit_closepng_a&quot;)" onClick="changetransmitsearch(&quot;center_footnum_transmit&quot;)" onMouseOver="transmitdivcloseimg2(&quot;transmit_closepng_a&quot;)"><img src="front/image/superdivclose.png" id="colle_closepng"></a>';
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
					newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:26px;position:relative;top:10px;right:-3px;"><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose3" onClick="changewords2()" style="height:12px;position:relative;bottom:-1px;">仅自己可见</li></a>';
					newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:26px;position:relative;top:17px;right:-3px;"><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose4" onClick="changewords3()" style="height:12px;position:relative;bottom:-2px;">群可见</li></a>';
					newStr += '</ul>';
					newStr += '</div>';
					newStr += '</div>';
					
					newStr += '<div id="comment_div'+commentdivnum+'" class="comment_div" style="display:none;">';
					newStr += '<img src="front/image/comment_header_img.png" id="comment_img">';
					newStr += '<input type="text" id="comment_input"/><br>';
					newStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img1.png" id="comment_pace_png"/></a>';
					newStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img2.png" id="comment_pace_png"/></a>';
					newStr += '<input type="checkbox" id="comment_check"><span id="comment_check_word">同时转发到我的微博</span>';
					newStr += '<img src="front/image/comment_btn.png" id="comment_btn" onClick="commentsWeibo('+userid+','+weiboid+',&quot;form_'+commentdivnum+'&quot;)"/>';
					newStr += '</div>';
					
					
					$("#xixi").append('<div id="center-part-content_01" class="divid_'+clicklikenum+'">'+newStr+'</div>');  
					
					num ++;
					clicklikenum ++;
					commentdivnum ++;
					transmitdivnum ++;
					collectiondivnum ++;
		    	}  
		      } //for()
		    } //if(data)
		  },  //success
		  error:function(textStatus,error){
			  alert("数据加载有误:"+error);
		  }
		
	}); //ajax
}

//群微博

//热门微博
function findHotWeiBo(){
	$("#xixi").empty();
	uid = $("#user").val().trim();
	
	if(uid != ""){
		userid = parseInt(uid);
	}
	var pageSize = 15;
	var pageNum = 1;
	
	$.ajax({
		  url: "weibo/findHotWeiBo",
		  cache: false,
		  data:{"pageSize":pageSize,"pageNum":pageNum,"userid":userid},
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
					
						newStr += '<a href="javascript:void(0)" id="center-part_img" class="center-part_img"  style="padding-right:10px;"><img title="'+username+'" src="/weibouserimages/'+userImgPaht+'" style="height:60px;width:60px" style="height:60px;width:60px"/></a>';
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

/* 分类浏览微博 */
function findWeiBoByWBtag(obj){
	$("#xixi").empty();
	var wbtag=obj.innerHTML;
	
	var uid = $("#user").val().trim();
	
	if(uid != ""){
		userid = parseInt(uid);
	}
	
	var pageSize = 15;
	var pageNum = 1;
	
	$.ajax({
		  url: "weibo/findWeiBoByWBtag",
		  cache: false,
		  data:{"pageSize":pageSize,"pageNum":pageNum,"wbtag":encodeURIComponent(wbtag),"userid":userid},
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
					
						newStr += '<a href="javascript:void(0)" id="center-part_img" class="center-part_img"  style="padding-right:10px;"><img title="'+username+'" src="/weibouserimages/'+userImgPaht+'" style="height:60px;width:60px" style="height:60px;width:60px"/></a>';
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
						newStr += '<a href="javascript:void(0)" id="center_footnum3_'+commentdivnum+'" class="center_footnum3" onClick="addcommentdiv(&quot;comment_div_'+commentdivnum+'&quot;,'+weiboid+')"><img src="front/image/center-part_foot03.png" id="foot01_img"/>'+dataMsg.WHCOMMENTACCOUNT+'</a>';		//评论
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

$(window).scroll(function(){  
	var srollPos = $(window).scrollTop();    //滚动条距顶部距离(页面超出窗口的高度)  
	
	//console.log("滚动条到顶部的垂直高度: "+$(document).scrollTop());  
	//console.log("页面的文档高度 ："+$(document).height());  
	//console.log('浏览器的高度：'+$(window).height());  
	
	totalheight = parseFloat($(window).height()) + parseFloat(srollPos);  
	
	if(($(document).height()-range) <= totalheight  && num<=maxnum) { 

		var newDataArr = dataStrArrcopy.split('},{');

		var dataMsgPre = '{'+newDataArr[num-1]+'}';
		
		if(num == newDataArr.length && dataMsgPre != undefined && dataMsgPre != ""){
			dataMsgPre = '{'+newDataArr[num-1].substring(0,newDataArr[num-1].length-1);
		}
		if(dataMsgPre == '{}' || dataMsgPre == '{undefined}' || dataMsgPre =='{'|| dataMsgPre =='}'){
			return;
		}
		
		var dataMsg = JSON.parse(dataMsgPre);
		
		//var dataStrJson =  JSON.parse(dataStrArr)   //将json字符串转换为JSON对象
		
		//console.info(dataStrJson);

		//var dataMsg = data.weiboList[i];
		var content = dataMsg.WBTXT; //首先已经确定他的内容不为空了！
		var wbuid = dataMsg.WBUID;  //发表微博的用户id
		var username = dataMsg.UNAME;  //用户名
		var weiboid = dataMsg.WBID;  //微博id
		var userImgPaht = dataMsg.UIMGPATH; //用户图像路径
		var location = dataMsg.WBLOCATION; //地理位置/电脑用户名 
		
		var yon = dataMsg.YON;  //是否是转发的微博
		
		var videoMap = ''; //视频路径
		var picsMap = ''; //图片路径 
		var musicMap = '';//音乐路径
		
			if(yon.indexOf("N") > -1){
			
		

		newStr += '<a href="javascript:void(0)" id="center-part_img" class="center-part_img" style="padding-left:20px;"><img title="'+username+'" src="/weibouserimages/'+userImgPaht+'" style="height:60px;width:60px"/></a>';
		newStr += '<ul id="center-part_ul">';
		newStr += '<li id="center-part_li">'+username+'</li>';
        newStr += '<li style="height:0px;width:250px;margin-left:16px;"><a href="javascript:void(0)">'+date+'</a> 来自 '+location+'</li>';
        newStr += '</ul>';

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
			newStr += '<a href="javascript:void(0)" id="center-part_img" class="center-part_img" ><img title="'+username+'" style="width:65px;height:65px;border-radius:10px;padding-left:20px;" src="/weibouserimages/'+userImgPaht+'"/></a>';
			newStr += '<ul id="center-part_ul">';
			newStr += '<li id="center-part_li">'+username+'</li>';
        	newStr += '<li style="height:0px;width:250px;margin-left:16px;"><a href="javascript:void(0)">'+date+'</a> 来自 '+location+'</li>';
        	newStr += '</ul>';

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
		
	
			//换行处理
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
			newStr += '<a href="javascript:void(0)" id="center_footnum2_'+transmitdivnum+'" class="center_footnum1" onClick="addtransmitdiv(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;)"><img src="front/image/center-part_foot02.png" id="foot01_img"/>'+dataMsg.WHREPRINTACCOUNT+'</a>';
			newStr += '<a href="javascript:void(0)" id="center_footnum3_'+commentdivnum+'" class="center_footnum1" onClick="addcommentdiv(&quot;comment_div_'+commentdivnum+'&quot;,'+weiboid+')"><img src="front/image/center-part_foot03.png" id="foot01_img"/>'+dataMsg.WHCOMMENTACCOUNT+'</a>';
			newStr += '<a href="javascript:void(0)" id="center_footnum4_'+clicklikenum+'" class="center_footnum1" onClick="clicklike(this,'+userid+','+weiboid+','+wbuid+')"><img src="front/image/center-part_foot04.png" id="foot01_img"/>'+dataMsg.WHGREATEACCOUNT+'</a>';  //点赞在这里处理
			newStr += '</div>';																	//用户id					//微博id				
		
		
			newStr += '<div id="center_footnum_col_'+collectiondivnum+'" class="center_footnum_col" style="display:none;">';
			newStr += '<div id="collection_div_unline>';
			newStr += '<span id="collection_div_title">收藏</span>';
			newStr += '<a href="javascript:void(0)" id="colle_closepng_a" class="colle_closepng_a" onMouseOut="collectiondivcloseimg(&quot;colle_closepng_a&quot;)" onClick="changecollectionsearch(&quot;center_footnum_col_'+collectiondivnum+'&quot;)" onMouseOver="collectiondivcloseimg2(&quot;colle_closepng_a&quot;)"><img src="front/image/superdivclose.png" id="colle_closepng"></a>';
			newStr += '</div>';
			newStr += '<div id="collection_div_tishi">';
			newStr += '<img src="front/image/collectionsuccess.png" id="collection_div_img"/>';
			newStr += '<span id="collection_div_su">收藏成功!</span>';
			newStr += '</div>';
			newStr += '<div id="collection_div_word"><img src="front/image/tishi.png" id="tishi_img"/><font id="tishi_word">添加标签来管理你的收藏</font></div>';
		
			newStr += '<div id="keyword" style="width:390px;height:32px;">';
			newStr += '<input type="text" id="keyword_tip_'+collectiondivnum+'" class="keyword_tip1" style="width:390px;height:32px;"/>';
																																																										//收藏的div									//标签input								//收藏导航栏
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
			newStr += '<input name="imgbtn" type="image" src="front/image/transmit_sure.png" id="transmit" onClick="transmitweibo(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;,&quot;transmit_input_'+transmitdivnum+'&quot;,&quot;center_footnum2_'+transmitdivnum+'&quot;,'+userid+','+weiboid+','+wbuid+')">';
		
			newStr += '<div id="transmit_choose" class="transmit_choose" style="display:none;" onMouseUp="hidetransmitdiv(&quot;transmit_choose&quot;)">';
			newStr += '<ul>';
			newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;top:2px;left:6px"/><li class="c1" id="choose1" onClick="changewords()" style="height:12px;position:relative;bottom:4px;top:3px;"/>公开</li></a><br>';
			newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose2" onClick="changewords1()" style="height:12px;position:relative;bottom:-1px;top:3px;">好友圈</li></a><br>';
			newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose3" onClick="changewords2()" style="height:12px;position:relative;bottom:-1px;top:3px;">仅自己可见</li></a>';
			newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose4" onClick="changewords3()" style="height:12px;position:relative;bottom:-2px;top:3px;">群可见</li></a>';
			newStr += '</ul>';
			newStr += '</div>';
			newStr += '</div>';
		
			newStr += '<div id="comment_div_'+commentdivnum+'" class="comment_div" style="display:none;">';
			newStr += '<img src="front/image/comment_header_img.png" id="comment_img">';
			newStr += '<input type="text" id="comment_input'+commentdivnum+'" class="comment_input"/><br>';
			newStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img1.png" id="comment_pace_png"/></a>';
			newStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img2.png" id="comment_pace_png"/></a>';
			newStr += '<input type="checkbox" id="comment_check'+commentdivnum+'" class="comment_check"><span id="comment_check_word">同时转发到我的微博</span>';
			newStr += '<img src="front/image/comment_btn.png" id="comment_btn" onClick="commentsWeibo(&quot;center_footnum3_'+commentdivnum+'&quot;,&quot;comment_div_'+commentdivnum+'&quot;,&quot;comment_input'+commentdivnum+'&quot;,&quot;comment_check'+commentdivnum+'&quot;,'+userid+','+weiboid+')"/>';
			newStr += '</div>';
		
		
			$("#xixi").append('<div id="center-part-content_01" class="divid_'+clicklikenum+'">'+newStr+'</div>');  
			
 			num ++;  //用于刷新点赞后的点赞数
 			clicklikenum ++;
 			commentdivnum ++;
 			transmitdivnum ++;
 			collectiondivnum ++;
		}else{
			 //转发微博的处理（即如何显示）
			var originweibo = dataOriginwbJson[weiboid];
			
			var wbuname = originweibo.UNAME;  //微博用户名
			var wbutag = originweibo.UTAG;	//学生，java工程师
			var wbuspeciatag = originweibo.USPECIALTAG; //中国 cn
			  
			var wb_wbid = originweibo.WBID; //yuan微博id
			var wb_transmitaccount = originweibo.WHREPRINTACCOUNT;//yuan转发数
			var wb_commentaccount = originweibo.WHCOMMENTACCOUNT;	//yuan评论数
			var wb_greateaccount = originweibo.WHGREATEACCOUNT; //yuan点赞数
			  
			var wb_picsMap = originweibo.WBPIC; //yuan图片路径 
			var wb_videoMap = originweibo.WBVIDEO; //yuan视频路径
			var wb_musicMap = originweibo.WBMUSIC; //yuan音乐路径
			var wb_wbdate = originweibo.WBDATE; //yuan发表日期
			  
			var wb_content = originweibo.WBTXT; //yuan微博的文本内容
			var wb_location = originweibo.WBLOCATION; //yuan微博的发表地址
			
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
		
			newStr += '<a href="javascript:void(0)" id="center-part_img" class="center-part_img"  style="padding-right:10px;"><img title="'+username+'" style="width:65px;height:65px;border-radius:10px;" src="/weibouserimages/'+userImgPaht+'"/></a>';
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
			newStr += '<p id="center-part_p_'+clicklikenum+'" class="center-part_p" style="width:450px;position:relative;margin-left:80px;">'+newContent1+'</p>';
	
			
			//转发的源微博处理
			var weiboUserMsg = '';
			weiboUserMsg += '<a href="javascript:void(0)"><span style="color:red;">@'+wbuname+'</span></a>';
			weiboUserMsg += '&nbsp;<a href="javascript:void(0)"><span style="color:red;">'+wbutag+'</span></a>';
			weiboUserMsg += '&nbsp;<a href="javascript:void(0)"><span style="color:red;"><img src="/weiboContriesFlags/'+wbuspeciatag+'"</span></a>';
			
			newStr += '<p id="center-part_p_'+clicklikenum+'" class="center-part_p" style="width:450px;position:relative;left:29px;">'+weiboUserMsg+'</p>';
			
			//表情处理
			var wb_newContent ='';
			var wb_newContent1 = '';
			var faceArr = wb_content.split("[");
			for(var k = 0; k < faceArr.length; k ++){
				if(faceArr[k].split("]]").length > 1){  //主题
					wb_newContent = '[['+faceArr[k]+wb_newContent;
				}else if(faceArr[k] != "" && faceArr[k].split("]]").length == 1 && faceArr[k].split("]").length > 1){ //说明是表情 
						faceArr[k] = '<img src="front/image/face_image/'+faceArr[k].split("]")[0]+'.png" />'+faceArr[k].split("]")[1];
						wb_newContent += faceArr[k];
				}else{
					wb_newContent += faceArr[k];
				}
			}
			
			
			var faceRegx1 = new RegExp('\\n','gi');
			var faceArr1 = wb_newContent.split(faceRegx1);
			for(var j = 0; j < faceArr1.length; j ++){
				wb_newContent1 += faceArr1[j]+'<br />';
			}
			newStr += '<p id="center-part_p_'+clicklikenum+'" class="center-part_p" style="width:450px;position:relative;left:29px;">'+wb_newContent1+'</p>';
		
			newStr += '<div id="content_img01">';
			//图片处理 
			if (wb_picsMap != "" && wb_picsMap != undefined) {
				var wb_pics = wb_picsMap.split(",");
				//console.info(pics);
				if(wb_pics.length == 1){
					newStr += '<img width="500px;" height="250px;" src="/weibopics/'+wb_pics[0]+'"/>';
				}else if(wb_pics.length == 2){
					for(var l = 0; l < wb_pics.length; l ++){
						newStr += '<img width="245px;" height="250px;" src="/weibopics/'+wb_pics[l]+'"/>';
					}
				}else if(wb_pics.length == 3){
					for(var m = 0; m < wb_pics.length; m ++){
						newStr += '<img width="160px;" height="250px;" src="/weibopics/'+wb_pics[m]+'"/>';
					}
				}else if(wb_pics.length == 4){
					newStr += '<img style="width:500px;height:330px;" src="/weibopics/'+wb_pics[0]+'"/>';
					for(var n = 1; n < wb_pics.length; n ++){
						newStr += '<img style="width:160px;height:80px;padding-right:3px;padding-left:3px;padding-top:3px;" src="/weibopics/'+wb_pics[n]+'"/>';
					}
				}else if(wb_pics.length == 9){
					for(var r = 0; r < wb_pics.length; r ++){
						newStr += '<img width="160px;" height="160px;" src="/weibopics/'+wb_pics[r]+'"/>';
					}
				}else{
					//图片轮换
					
					
				}
			}
			
			
			//视频处理 
			if (wb_videoMap != "" && wb_videoMap != undefined) {
				var wb_video = wb_videoMap.split(",");
				for (var i = 0; i < wb_video.length; i++) {
					newStr += '<video controls="true" src="/weibovideoes/'+wb_video[i]+'" style="width:500px;height:300px;"/>';
				}
			}

			//音乐处理
			if (wb_musicMap != "" && wb_musicMap != undefined) {
				var wb_music = wb_musicMap.split(",");
				for(var i = 0; i < wb_music.length; i ++){
					newStr += '<audio controls="true" src="/weibomusics/'+wb_music[i]+'" style="width:500px;height:25px;"/>';
				}
			}
			
			var wb_string = new Date();
			wb_string.setTime(wb_wbdate);
			var wb_string_date = wb_string.toLocaleString();
			
			newStr += '<div>';
			newStr += '<li style="height:0px;width:250px;float:left;"><a href="javascript:void(0)">'+wb_string_date+'</a> 来自 '+wb_location;
			newStr += '</li>';
			newStr += '<li style="height:0px;width:250px;float:right;">';
			newStr += '<div id="center_footnum_i_m_g_'+collectiondivnum+'" class="center_footnum_">';
			newStr += '<a href="javascript:void(0)" id="center_footnum2_i_m_g_'+transmitdivnum+'" class="center_footnum_" onClick="addtransmitdiv_i_m_g('+wb_wbid+')"><img src="front/image/center-part_foot02.png" id="foot01_img"/>'+wb_transmitaccount+'</a>'; //转发
			newStr += '<a href="javascript:void(0)" id="center_footnum3_i_m_g_'+commentdivnum+'" class="center_footnum_" onClick="addcommentdiv_i_m_g('+wb_wbid+')"><img src="front/image/center-part_foot03.png" id="foot01_img"/>'+wb_commentaccount+'</a>';	//评论
			newStr += '<a href="javascript:void(0)" id="center_footnum4_i_m_g_'+clicklikenum+'" class="center_footnum_" onClick="clicklike_i_m_g('+wb_wbid+')"><img src="front/image/center-part_foot04.png" id="foot01_img"/>'+wb_greateaccount+'</a>';   //点赞
			newStr += '</div>';
			newStr += '</li>';
			newStr += '</div>';
			newStr += '</div>';
			
			
			newStr += '<div id="center_footnum_'+collectiondivnum+'" class="center_footnum">';
			if(datawbids.indexOf(''+weiboid) < 0){
				newStr += '<a href="javascript:void(0)"	id="center_footnum1_'+collectiondivnum+'" class="center_footnum1" onClick="addcollectiondiv(&quot;center_footnum_col_'+collectiondivnum+'&quot;,'+userid+','+weiboid+')"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>';	//收藏
			}else{
				newStr += '<a href="javascript:void(0)"	id="center_footnum1_'+collectiondivnum+'" class="center_footnum1" onClick="addcollectiondiv(&quot;center_footnum_col_'+collectiondivnum+'&quot;,'+userid+','+weiboid+')"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>已收藏</a>';	//收藏
			}
			newStr += '<a href="javascript:void(0)" id="center_footnum2_'+transmitdivnum+'" class="center_footnum2" onClick="addtransmitdiv(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;)"><img src="front/image/center-part_foot02.png" id="foot01_img"/>'+dataMsg.WHREPRINTACCOUNT+'</a>'; //转发
			newStr += '<a href="javascript:void(0)" id="center_footnum3_'+commentdivnum+'" class="center_footnum3" onClick="addcommentdiv(&quot;comment_div_'+commentdivnum+'&quot;,'+weiboid+')"><img src="front/image/center-part_foot03.png" id="foot01_img"/>'+dataMsg.WHCOMMENTACCOUNT+'</a>';		//评论
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
			newStr += '<input name="imgbtn" type="image" src="front/image/transmit_sure.png" id="transmit" onClick="transmitweibo(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;,&quot;transmit_input_'+transmitdivnum+'&quot;,&quot;center_footnum2_'+transmitdivnum+'&quot;,&quot;center_footnum2_'+transmitdivnum+'&quot;,'+userid+','+weiboid+','+wbuid+')">';
			
			newStr += '<div id="transmit_choose" class="transmit_choose" style="display:none;" onMouseUp="hidetransmitdiv(&quot;transmit_choose&quot;)">';
			newStr += '<ul>';
			newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;top:2px;left:6px"/><li class="c1" id="choose1" onClick="changewords()" style="height:12px;position:relative;bottom:4px;top:3px;">公开</li></a><br>';
			newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose2" onClick="changewords1()" style="height:12px;position:relative;bottom:-1px;top:3px;">好友圈</li></a><br>';
			newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose3" onClick="changewords2()" style="height:12px;position:relative;bottom:-1px;top:3px;">仅自己可见</li></a>';
			newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose4" onClick="changewords3s)" style="height:12px;position:relative;bottom:-2px;top:3px;">群可见</li></a>';
			newStr += '</ul>';
			newStr += '</div>';
			newStr += '</div>';
			
			newStr += '<div id="comment_div_'+commentdivnum+'" class="comment_div" style="display:none;">';
			newStr += '<img src="front/image/comment_header_img.png" id="comment_img">';
			newStr += '<input type="text" id="comment_input'+commentdivnum+'" class="comment_input"/><br>';
			newStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img1.png" id="comment_pace_png"/></a>';
			newStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img2.png" id="comment_pace_png"/></a>';
			newStr += '<input type="checkbox" id="comment_check'+commentdivnum+'" class="comment_check"><span id="comment_check_word">同时转发到我的微博</span>';
			newStr += '<img src="front/image/comment_btn.png" id="comment_btn" onClick="commentsWeibo(&quot;center_footnum3_'+commentdivnum+'&quot;,&quot;comment_div_'+commentdivnum+'&quot;,&quot;comment_input'+commentdivnum+'&quot;,&quot;comment_check'+commentdivnum+'&quot;,'+userid+','+weiboid+')"/>';
			newStr += '</div>';
			
			$("#xixi").append('<div id="center-part-content_01" class="divid_'+clicklikenum+'">'+newStr+'</div>');  

			num ++;
			clicklikenum ++;
	 		commentdivnum ++;
			transmitdivnum ++;
			collectiondivnum ++;
		}
	}  
}); 

//点赞功能                      			//用户id //微博id //微博所属用户
function clicklike(obj,userid,wbid,wbuid){
	$.ajax({
		url: "weibo/addclicklike",
		  cache: false,
		  data:{'userid':userid,'wbid':wbid,'wbuid':wbuid},
		  dataType:"json",
		  type:"get",
		  success: function(data,textStatus){
			  if(data.success){
				  obj.innerHTML = '<img src="front/image/center-part_foot04.png" id="foot01_img"/>'+data.greateAccount;
			  }
		  },
		  error:function(error,textStatus){
			  alert("点赞是发生错误："+error);
		  }
	});
};

//收藏功能					//收藏div		标签input   //当前用户id //微博id  //发表微博的用户id
function collectiontag(collectionobj,inputobj,cnav,uid,weiboid,wbuid){
	var input = document.getElementById(inputobj);
	var txt = input.value;   //得到text的值
	
	console.info(cnav);
	alert(txt);
	$.ajax({
		  url: "weibo/addcollection",
		  cache: false,
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		  data:{'uid':uid,'wbid':weiboid,'wbuid':wbuid,'txt':txt},
		  dataType:"json",
		  type:"post",
		  success: function(data,textStatus){
			  if(data.success){
				  $("#"+inputobj).val('');
				  $("#"+collectionobj).hide();
				  $("#"+cnav).html('<img src="front/image/center-part_foot01.png" id="foot01_imgs"/>已收藏');
			  }
		  },
		  error:function(error,textStatus){
			  alert("收藏时发生错误："+error);
		  }
	});
}


//转发													//用户id  发表的微博id 发表微博的用户的id
function transmitweibo(divid,textareaid,origintransmitid,transmitid,uid,wbid,wbuid){
	var inputtxt = $("#"+textareaid).val();
	alert(inputtxt);
	
	$.ajax({
		  url: "weibo/transmitweibo",
		  cache: false,
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		  data:{'uid':uid,'wbid':wbid,'wbuid':wbuid,'txt':inputtxt},
		  dataType:"json",
		  type:"post",
		  success: function(data,textStatus){
			  if(data.success){
				  var weibo = data.weibo[0];  //跟微博或者这要转发的最原始的微博
				  var wbuname = weibo.UNAME;  //微博用户名
				  var wbutag = weibo.UTAG;	//学生，java工程师
				  var wbuspeciatag = weibo.USPECIALTAG; //中国 cn
				  
				  var wb_currTransmitAccount = data.currTransmitAccount;//当前微博的转发数
				  var wb_originTransmitAccount = data.originTransmitAccount;//yuan转发数
				  
				  var wb_wbid = weibo.WBID; //yuan微博id
				  var wb_commentaccount = weibo.WHCOMMENTACCOUNT;	//yuan评论数
				  var wb_greateaccount = weibo.WHGREATEACCOUNT; //yuan点赞数
				  
				  var wb_picsMap = weibo.WBPIC; //yuan图片路径 
				  var wb_videoMap = weibo.WBVIDEO; //yuan视频路径
				  var wb_musicMap = weibo.WBMUSIC; //yuan音乐路径
				  var wb_wbdate = weibo.WBDATE; //yuan发表日期
				  
				  var wb_content = weibo.WBTXT; //yuan微博的文本内容
				  var wb_location = weibo.WBLOCATION; //yuan微博的发表地址
				  
				  
				  var currWBid = data.currWBid;//当前微博的id
				  var date = new Date();  //当前时间
				  var stringDate = date.toLocaleString().substring(date.toLocaleString().indexOf(" "));
				  var location = data.userLocation; //当前地址
				  
				  
				  	var newWeiBoDiv = document.createElement("div");
				  	newWeiBoDiv.id = "center-part-content_01";
				  	newWeiBoDiv.className = "divid_d_"+clicklikenum;
				  
				  	var newWeiBoStr = '';
					newWeiBoStr += '<a href="javascript:void(0)" id="center-part_img" class="center-part_img"><img id="img_'+clicklikenum+'" title="'+$("#username").val()+'" style="width:65px;height:65px;border-radius:10px;padding-left:20px;" src="/weibouserimages/'+$("#uimgPath").val()+'"/></a>';
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
					newWeiBoStr += '<li id="center-part_li">'+$("#username").val()+'</li>';
	                newWeiBoStr += '<li style="height:0px;width:250px;"><a href="javascript:void(0)">今天&nbsp;'+stringDate+'</a> 来自 '+location+'</li>';
	                newWeiBoStr += '</ul>';
				  
	              //表情处理
					var newContent ='';
					var newContent1 = '';
					var faceArr = inputtxt.split("[");
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
					
					
					//转发的源微博处理
					var weiboUserMsg = '';
					weiboUserMsg += '<a href="javascript:void(0)"><span style="color:red;">@'+wbuname+'</span></a>';
					weiboUserMsg += '&nbsp;<a href="javascript:void(0)"><span style="color:red;">'+wbutag+'</span></a>';
					weiboUserMsg += '&nbsp;<a href="javascript:void(0)"><span style="color:red;"><img src="/weiboContriesFlags/'+wbuspeciatag+'"</span></a>';
					
					newWeiBoStr += '<p id="center-part_p_'+clicklikenum+'" class="center-part_p" style="width:450px;position:relative;left:29px;">'+weiboUserMsg+'</p>';
					
					//表情处理
					var wb_newContent ='';
					var wb_newContent1 = '';
					var faceArr = wb_content.split("[");
					for(var k = 0; k < faceArr.length; k ++){
						if(faceArr[k].split("]]").length > 1){  //主题
							wb_newContent = '[['+faceArr[k]+wb_newContent;
						}else if(faceArr[k] != "" && faceArr[k].split("]]").length == 1 && faceArr[k].split("]").length > 1){ //说明是表情 
								faceArr[k] = '<img src="front/image/face_image/'+faceArr[k].split("]")[0]+'.png" />'+faceArr[k].split("]")[1];
								wb_newContent += faceArr[k];
						}else{
							wb_newContent += faceArr[k];
						}
					}
					
					
					var faceRegx1 = new RegExp('\\n','gi');
					var faceArr1 = wb_newContent.split(faceRegx1);
					for(var j = 0; j < faceArr1.length; j ++){
						wb_newContent1 += faceArr1[j]+'<br />';
					}
					newWeiBoStr += '<p id="center-part_p_'+clicklikenum+'" class="center-part_p" style="width:450px;position:relative;left:29px;">'+wb_newContent1+'</p>';
				
					newWeiBoStr += '<div id="content_img01">';
					//图片处理 
					if (wb_picsMap != "" && wb_picsMap != undefined) {
						var wb_pics = wb_picsMap.split(",");
						//console.info(pics);
						if(wb_pics.length == 1){
							newWeiBoStr += '<img width="500px;" height="250px;" src="/weibopics/'+wb_pics[0]+'"/>';
						}else if(wb_pics.length == 2){
							for(var l = 0; l < wb_pics.length; l ++){
								newWeiBoStr += '<img width="245px;" height="250px;" src="/weibopics/'+wb_pics[l]+'"/>';
							}
						}else if(wb_pics.length == 3){
							for(var m = 0; m < wb_pics.length; m ++){
								newWeiBoStr += '<img width="160px;" height="250px;" src="/weibopics/'+wb_pics[m]+'"/>';
							}
						}else if(wb_pics.length == 4){
							newWeiBoStr += '<img style="width:500px;height:330px;" src="/weibopics/'+wb_pics[0]+'"/>';
							for(var n = 1; n < wb_pics.length; n ++){
								newWeiBoStr += '<img style="width:160px;height:80px;padding-right:3px;padding-left:3px;padding-top:3px;" src="/weibopics/'+wb_pics[n]+'"/>';
							}
						}else if(wb_pics.length == 9){
							for(var r = 0; r < wb_pics.length; r ++){
								newWeiBoStr += '<img width="160px;" height="160px;" src="/weibopics/'+wb_pics[r]+'"/>';
							}
						}else{
							//图片轮换
							
							
						}
					}
					
					
					//视频处理 
					if (wb_videoMap != "" && wb_videoMap != undefined) {
						var wb_video = wb_videoMap.split(",");
						for (var i = 0; i < wb_video.length; i++) {
							newWeiBoStr += '<video controls="true" src="/weibovideoes/'+wb_video[i]+'" style="width:500px;height:300px;"/>';
						}
					}

					//音乐处理
					if (wb_musicMap != "" && wb_musicMap != undefined) {
						var wb_music = wb_musicMap.split(",");
						for(var i = 0; i < wb_music.length; i ++){
							newWeiBoStr += '<audio controls="true" src="/weibomusics/'+wb_music[i]+'" style="width:500px;height:25px;"/>';
						}
					}
					
					var wb_string = new Date();
					wb_string.setTime(wb_wbdate);
					var wb_string_date = wb_string.toLocaleString();
					newWeiBoStr += '<div>';
					newWeiBoStr += '<li style="height:0px;width:250px;float:left;"><a href="javascript:void(0)">'+wb_string_date+'</a> 来自 '+wb_location;
					newWeiBoStr += '</li>';
					newWeiBoStr += '<li style="height:0px;width:250px;float:right;">';
					newWeiBoStr += '<div id="center_footnum_i_m_g_'+collectiondivnum+'" class="center_footnum_">';
					newWeiBoStr += '<a href="javascript:void(0)" id="center_footnum2_i_m_g_'+transmitdivnum+'" class="center_footnum_" onClick="addtransmitdiv_i_m_g('+wb_wbid+')"><img src="front/image/center-part_foot02.png" id="foot01_img"/>'+wb_originTransmitAccount+'</a>'; //转发
					newWeiBoStr += '<a href="javascript:void(0)" id="center_footnum3_i_m_g_'+commentdivnum+'" class="center_footnum_" onClick="addcommentdiv_i_m_g('+wb_wbid+')"><img src="front/image/center-part_foot03.png" id="foot01_img"/>'+wb_commentaccount+'</a>';	//评论
					newWeiBoStr += '<a href="javascript:void(0)" id="center_footnum4_i_m_g_'+clicklikenum+'" class="center_footnum_" onClick="clicklike_i_m_g('+wb_wbid+')"><img src="front/image/center-part_foot04.png" id="foot01_img"/>'+wb_greateaccount+'</a>';   //点赞
					newWeiBoStr += '</div>';
					newWeiBoStr += '</li>';
					newWeiBoStr += '</div>';
					newWeiBoStr += '</div>';
					
					
					newWeiBoStr += '<div id="center_footnum_'+collectiondivnum+'" class="center_footnum">';
					newWeiBoStr += '<a href="javascript:void(0)" id="center_footnum1_'+collectiondivnum+'" class="center_footnum1" onClick="addcollectiondiv(&quot;center_footnum_col_'+collectiondivnum+'&quot;,'+userid+','+currWBid+')"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>';	//收藏
					newWeiBoStr += '<a href="javascript:void(0)" id="center_footnum2_'+transmitdivnum+'" class="center_footnum2" onClick="addtransmitdiv(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;)"><img src="front/image/center-part_foot02.png" id="foot01_img"/>0</a>'; //转发
					newWeiBoStr += '<a href="javascript:void(0)" id="center_footnum3_'+commentdivnum+'" class="center_footnum3" onClick="addcommentdiv(&quot;comment_div_'+commentdivnum+'&quot;,'+currWBid+')"><img src="front/image/center-part_foot03.png" id="foot01_img"/>0</a>';		//评论
					newWeiBoStr += '<a href="javascript:void(0)" id="center_footnum4_'+clicklikenum+'" class="center_footnum4" onClick="clicklike(this,'+userid+','+currWBid+','+userid+')"><img src="front/image/center-part_foot04.png" id="foot01_img"/>0</a>';   //点赞
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
					
					newWeiBoStr += '<div style="height:45px;background:#F0F0F0;width:430px;position:relative;top:16px;right:20px;"><input type="image" id="keyword_tip2" src="front/image/keyword_add.png" onClick="collectiontag(&quot;center_footnum_col_'+collectiondivnum+'&quot;,&quot;keyword_tip_'+collectiondivnum+'&quot;,&quot;center_footnum1_'+collectiondivnum+'&quot;,'+userid+','+currWBid+','+userid+')"/>';
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
					newWeiBoStr += '<input name="imgbtn" type="image" src="front/image/transmit_sure.png" id="transmit" onClick="transmitweibo(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;,&quot;transmit_input_'+transmitdivnum+'&quot;,&quot;error_do_not_need&quot;,&quot;center_footnum2_'+transmitdivnum+'&quot;,'+userid+','+currWBid+','+userid+')">';
					
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
					newWeiBoStr += '<input type="text" id="comment_input_'+commentdivnum+'" class="comment_input"/><br>';
					newWeiBoStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img1.png" id="comment_pace_png"/></a>';
					newWeiBoStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img2.png" id="comment_pace_png"/></a>';
					newWeiBoStr += '<input type="checkbox" id="comment_check_'+commentdivnum+'" class="comment_check"><span id="comment_check_word">同时转发到我的微博</span>';
					newWeiBoStr += '<img src="front/image/comment_btn.png" id="comment_btn" onClick="commentsWeibo(&quot;center_footnum3_'+commentdivnum+'&quot;,&quot;comment_div_'+commentdivnum+'&quot;,&quot;comment_input'+commentdivnum+'&quot;,&quot;comment_check'+commentdivnum+'&quot;,'+userid+','+wbid+')"/>';
					newWeiBoStr += '</div>';
					
					newWeiBoDiv.innerHTML = newWeiBoStr;
					$(newWeiBoDiv).insertBefore($("#xixi div").first());
					
					//刷新右边用户信息框
					//刷新微博数
					tempweibocount = document.getElementById("weibocount").value;
					
					weibocount = parseInt(tempweibocount) + 1;
					MsgStr = '';
					MsgStr += '<a href="javascript:void(0)" id="user_img"><img src="/weibouserimages/'+$("#uimgPath").val()+'"style="hight:60px;width:60px"/></a>';
					MsgStr += '<a href="javascript:void(0)" id="user_name">'+$("#username").val()+'</a>';
					MsgStr += '<a href="javascript:void(0)" id="vip_img"><img src="front/image/vip_logo.jpg"/></a>';
					MsgStr += '<div id="levelimg">';
		            MsgStr += '<a href="javascript:void(0)" id="level">Lv.10</a>';
		            MsgStr += '</div>';
		            MsgStr += '<div id="usernum">';
		            MsgStr += '<a href="javascript:void(0)" id="usernumone"><font id="num">'+$("#focuscount").val()+'</font>关注</a>';
		            MsgStr += '<a href="javascript:void(0)" id="usernumone"><font id="num">'+$("#fanedbocount").val()+'</font>粉丝</a>';
		            MsgStr += '<a href="javascript:void(0)" id="usernumone"><font id="num">'+weibocount+'</font>微博</a>';
		            MsgStr += '</div>';
					var MsgDiv = document.getElementById("right-part-content");
					if(undefined != MsgDiv){
						MsgDiv.innerHTML = MsgStr;
					}
					document.getElementById("weibocount").value =weibocount;
					
					$("#"+origintransmitid).html('<img src="front/image/center-part_foot02.png" id="foot01_img"/>'+wb_originTransmitAccount);
					
					$("#"+transmitid).html('<img src="front/image/center-part_foot02.png" id="foot01_img"/>'+wb_currTransmitAccount);
					
					$("#"+textareaid).val('');
					
					$("#"+divid).hide();
					
					clicklikenum ++;
					commentdivnum ++;
					transmitdivnum ++;
					collectiondivnum ++;
					
					window.location.reload();
			  }
		  },
		  error:function(error,textStatus){
			  alert("转发时发生错误："+error);
		  }
	});
}

//回复(评论)
function commentsWeibo(commentnav,commentdiv,textid,checkid,userid,wbid){
	var text = $("#"+textid).val();
	var ischeck = false;
	if($("#"+checkid).is(":checked")){
		ischeck = true;
	}
	
	if(text == '' || text == null || text == undefined){
		alert("内容不能为空");
	}else{
		$.ajax({
		  url: "weibo/commentweibo",
		  cache: false,
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		  data:{'uid':userid,'wbid':wbid,'ischeck':ischeck,'txt':text},
		  dataType:"json",
		  type:"post",
		  success: function(data,textStatus){
			  if(data.success){
				  if(!data.flag){  //不用转发
					  
					  var currCid = data.currCid;
					  
					  $("#"+textid).val('');
					  $("#"+checkid).attr("checked", false);
					  $("#"+commentnav).html('<img src="front/image/center-part_foot03.png" id="foot01_img"/>'+data.commentAccount);
					 
					var str = '';
					str += '<div id="comment_div_three" class="comment_div_three">';
					str += '<a href="javascript:void(0)" class="comment_div_three_a1"><img style="width:30px;height:30px;margin-left:30px;position:relative;" src="/weibouserimages/'+$("#uimgPath").val()+'" id="comment_img"></a>';
					str += '<a href="javascript:void(0)" class="comment_div_three_a">'+$("#username").val()+'  :  </a>';
					
					//表情处理
					var wb_newContent ='';
					var wb_newContent1 = '';
					var faceArr = text.split("[");
					for(var k = 0; k < faceArr.length; k ++){
						if(faceArr[k].split("]]").length > 1){  //主题
							wb_newContent = '[['+faceArr[k]+wb_newContent;
						}else if(faceArr[k] != "" && faceArr[k].split("]]").length == 1 && faceArr[k].split("]").length > 1){ //说明是表情 
								faceArr[k] = '<img src="front/image/face_image/'+faceArr[k].split("]")[0]+'.png" />'+faceArr[k].split("]")[1];
								wb_newContent += faceArr[k];
						}else{
							wb_newContent += faceArr[k];
						}
					}
					var faceRegx1 = new RegExp('\\n','gi');
					var faceArr1 = wb_newContent.split(faceRegx1);
					for(var j = 0; j < faceArr1.length; j ++){
						wb_newContent1 += faceArr1[j]+'<br />';
					}
					str += '<span class="comment_div_three_a">'+wb_newContent1+'</span>';
                	str += '</div>';
                	str += '<div id="comment_div_four" class="comment_div_four">';
                	str += '<span class="comment_div_four_a1">'+data.commentDate+'</span>';
                	str += '<a href="javascript:void(0)" class="comment_div_four_a"><img src="front/image/center-part_foot04.png"/><font class="comment_div_four_font">0</font></a>';
                	str += '<a href="javascript:void(0)" class="comment_div_four_a" onClick="commentDelete()">删除</a>';
                	str += '<a href="javascript:void(0)" class="comment_div_four_a" onClick="commentOthers(&quot;comment_div_five'+commentdivnum+'&quot;,&quot;comment_input_d_'+commentdivnum+'&quot;)">回复</a>';
                	str += '<a href="javascript:void(0)" class="comment_div_four_a" onClick="commentTip()">举报</a>';
                	str += '</div>';
	                str += '<div id="comment_div_five'+commentdivnum+'" class="comment_div_five" style="display:none;">';
	                str += '<img src="/weibouserimages/'+$("#uimgPath").val()+'" id="comment_img'+commentdivnum+'" style="width:30px;height:30px;margin-left:90px;margin-top:10px;position:relative;">';
	                str += '<input type="text" id="comment_input_five'+commentdivnum+'" class="comment_input_five" style="border: 1px solid red;height: 30px;margin-left: 10px;width: 350px"/>';
	                str += '<img src="front/image/comment_btn.png" id="comment_btn_five'+commentdivnum+'" style="float: right;margin-right: 40px;margin-top:20px;" onClick="commentsWeiboAndcommentOthers(&quot;center_footnum3_'+commentdivnum+'&quot;,&quot;'+commentdiv+'&quot;,&quot;comment_div_five'+commentdivnum+'&quot;,&quot;comment_input_five'+commentdivnum+'&quot;,'+userid+','+wbid+','+currCid+')"/>';
	                str += '</div>';
					$("#"+commentdiv).append(str);
					 
				  }else{ //要转发
					  var currCid = data.currCid;
					  
					  var weibo = data.weibo[0];  //跟微博或者这要转发的最原始的微博
					  var wbuname = weibo.UNAME;  //微博用户名
					  var wbutag = weibo.UTAG;	//学生，java工程师
					  var wbuspeciatag = weibo.USPECIALTAG; //中国 cn
					  
					  var wb_currTransmitAccount = data.currTransmitAccount;//当前微博的转发数
					  var wb_originTransmitAccount = data.originTransmitAccount;//yuan转发数
					  
					  var wb_wbid = weibo.WBID; //yuan微博id
					  var wb_commentaccount = weibo.WHCOMMENTACCOUNT;	//yuan评论数
					  var wb_greateaccount = weibo.WHGREATEACCOUNT; //yuan点赞数
					  
					  var wb_picsMap = weibo.WBPIC; //yuan图片路径 
					  var wb_videoMap = weibo.WBVIDEO; //yuan视频路径
					  var wb_musicMap = weibo.WBMUSIC; //yuan音乐路径
					  var wb_wbdate = weibo.WBDATE; //yuan发表日期
					  
					  var wb_content = weibo.WBTXT; //yuan微博的文本内容
					  var wb_location = weibo.WBLOCATION; //yuan微博的发表地址
					  
					  
					  var currWBid = data.currWBid;//当前微博的id
					  var date = new Date();  //当前时间
					  var stringDate = date.toLocaleString().substring(date.toLocaleString().indexOf(" "));
					  var location = data.userLocation; //当前地址
					  
					  
					  	var newWeiBoDiv = document.createElement("div");
					  	newWeiBoDiv.id = "center-part-content_01";
					  	newWeiBoDiv.className = "divid_d_"+clicklikenum;
					  
					  	var newWeiBoStr = '';
						newWeiBoStr += '<a href="javascript:void(0)" id="center-part_img" class="center-part_img"><img id="img_'+clicklikenum+'" title="'+$("#username").val()+'" style="width:65px;height:65px;border-radius:10px;padding-left:20px;" src="/weibouserimages/'+$("#uimgPath").val()+'"/></a>';
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
						newWeiBoStr += '<li id="center-part_li">'+$("#username").val()+'</li>';
		                newWeiBoStr += '<li style="height:0px;width:250px;"><a href="javascript:void(0)">今天&nbsp;'+stringDate+'</a> 来自 '+location+'</li>';
		                newWeiBoStr += '</ul>';
					  
		              //表情处理
						var newContent ='';
						var newContent1 = '';
						var faceArr = text.split("[");
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
						
						
						//转发的源微博处理
						var weiboUserMsg = '';
						weiboUserMsg += '<a href="javascript:void(0)"><span style="color:red;">@'+wbuname+'</span></a>';
						weiboUserMsg += '&nbsp;<a href="javascript:void(0)"><span style="color:red;">'+wbutag+'</span></a>';
						weiboUserMsg += '&nbsp;<a href="javascript:void(0)"><span style="color:red;"><img src="/weiboContriesFlags/'+wbuspeciatag+'"</span></a>';
						
						newWeiBoStr += '<p id="center-part_p_'+clicklikenum+'" class="center-part_p" style="width:450px;position:relative;left:29px;">'+weiboUserMsg+'</p>';
						
						//表情处理
						var wb_newContent ='';
						var wb_newContent1 = '';
						var faceArr = wb_content.split("[");
						for(var k = 0; k < faceArr.length; k ++){
							if(faceArr[k].split("]]").length > 1){  //主题
								wb_newContent = '[['+faceArr[k]+wb_newContent;
							}else if(faceArr[k] != "" && faceArr[k].split("]]").length == 1 && faceArr[k].split("]").length > 1){ //说明是表情 
									faceArr[k] = '<img src="front/image/face_image/'+faceArr[k].split("]")[0]+'.png" />'+faceArr[k].split("]")[1];
									wb_newContent += faceArr[k];
							}else{
								wb_newContent += faceArr[k];
							}
						}
						
						
						var faceRegx1 = new RegExp('\\n','gi');
						var faceArr1 = wb_newContent.split(faceRegx1);
						for(var j = 0; j < faceArr1.length; j ++){
							wb_newContent1 += faceArr1[j]+'<br />';
						}
						newWeiBoStr += '<p id="center-part_p_'+clicklikenum+'" class="center-part_p" style="width:450px;position:relative;left:29px;">'+wb_newContent1+'</p>';
					
						newWeiBoStr += '<div id="content_img01">';
						//图片处理 
						if (wb_picsMap != "" && wb_picsMap != undefined) {
							var wb_pics = wb_picsMap.split(",");
							//console.info(pics);
							if(wb_pics.length == 1){
								newWeiBoStr += '<img width="500px;" height="250px;" src="/weibopics/'+wb_pics[0]+'"/>';
							}else if(wb_pics.length == 2){
								for(var l = 0; l < wb_pics.length; l ++){
									newWeiBoStr += '<img width="245px;" height="250px;" src="/weibopics/'+wb_pics[l]+'"/>';
								}
							}else if(wb_pics.length == 3){
								for(var m = 0; m < wb_pics.length; m ++){
									newWeiBoStr += '<img width="160px;" height="250px;" src="/weibopics/'+wb_pics[m]+'"/>';
								}
							}else if(wb_pics.length == 4){
								newWeiBoStr += '<img style="width:500px;height:330px;" src="/weibopics/'+wb_pics[0]+'"/>';
								for(var n = 1; n < wb_pics.length; n ++){
									newWeiBoStr += '<img style="width:160px;height:80px;padding-right:3px;padding-left:3px;padding-top:3px;" src="/weibopics/'+wb_pics[n]+'"/>';
								}
							}else if(wb_pics.length == 9){
								for(var r = 0; r < wb_pics.length; r ++){
									newWeiBoStr += '<img width="160px;" height="160px;" src="/weibopics/'+wb_pics[r]+'"/>';
								}
							}else{
								//图片轮换
								
								
							}
						}
						
						
						//视频处理 
						if (wb_videoMap != "" && wb_videoMap != undefined) {
							var wb_video = wb_videoMap.split(",");
							for (var i = 0; i < wb_video.length; i++) {
								newWeiBoStr += '<video controls="true" src="/weibovideoes/'+wb_video[i]+'" style="width:500px;height:300px;"/>';
							}
						}

						//音乐处理
						if (wb_musicMap != "" && wb_musicMap != undefined) {
							var wb_music = wb_musicMap.split(",");
							for(var i = 0; i < wb_music.length; i ++){
								newWeiBoStr += '<audio controls="true" src="/weibomusics/'+wb_music[i]+'" style="width:500px;height:25px;"/>';
							}
						}
						
						var wb_string = new Date();
						wb_string.setTime(wb_wbdate);
						var wb_string_date = wb_string.toLocaleString();
						newWeiBoStr += '<div>';
						newWeiBoStr += '<li style="height:0px;width:250px;float:left;"><a href="javascript:void(0)">'+wb_string_date+'</a> 来自 '+wb_location;
						newWeiBoStr += '</li>';
						newWeiBoStr += '<li style="height:0px;width:250px;float:right;">';
						newWeiBoStr += '<div id="center_footnum_i_m_g_'+collectiondivnum+'" class="center_footnum_">';
						newWeiBoStr += '<a href="javascript:void(0)" id="center_footnum2_i_m_g_'+transmitdivnum+'" class="center_footnum_" onClick="addtransmitdiv_i_m_g('+wb_wbid+')"><img src="front/image/center-part_foot02.png" id="foot01_img"/>'+wb_originTransmitAccount+'</a>'; //转发
						newWeiBoStr += '<a href="javascript:void(0)" id="center_footnum3_i_m_g_'+commentdivnum+'" class="center_footnum_" onClick="addcommentdiv_i_m_g('+wb_wbid+')"><img src="front/image/center-part_foot03.png" id="foot01_img"/>'+wb_commentaccount+'</a>';	//评论
						newWeiBoStr += '<a href="javascript:void(0)" id="center_footnum4_i_m_g_'+clicklikenum+'" class="center_footnum_" onClick="clicklike_i_m_g('+wb_wbid+')"><img src="front/image/center-part_foot04.png" id="foot01_img"/>'+wb_greateaccount+'</a>';   //点赞
						newWeiBoStr += '</div>';
						newWeiBoStr += '</li>';
						newWeiBoStr += '</div>';
						newWeiBoStr += '</div>';
						
						
						newWeiBoStr += '<div id="center_footnum_'+collectiondivnum+'" class="center_footnum">';
						newWeiBoStr += '<a href="javascript:void(0)" id="center_footnum1_'+collectiondivnum+'" class="center_footnum1" onClick="addcollectiondiv(&quot;center_footnum_col_'+collectiondivnum+'&quot;,'+userid+','+currWBid+')"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>';	//收藏
						newWeiBoStr += '<a href="javascript:void(0)" id="center_footnum2_'+transmitdivnum+'" class="center_footnum2" onClick="addtransmitdiv(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;)"><img src="front/image/center-part_foot02.png" id="foot01_img"/>0</a>'; //转发
						newWeiBoStr += '<a href="javascript:void(0)" id="center_footnum3_'+commentdivnum+'" class="center_footnum3" onClick="addcommentdiv(&quot;comment_div_'+commentdivnum+'&quot;,'+currWBid+')"><img src="front/image/center-part_foot03.png" id="foot01_img"/>0</a>';		//评论
						newWeiBoStr += '<a href="javascript:void(0)" id="center_footnum4_'+clicklikenum+'" class="center_footnum4" onClick="clicklike(this,'+userid+','+currWBid+','+userid+')"><img src="front/image/center-part_foot04.png" id="foot01_img"/>0</a>';   //点赞
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
						
						newWeiBoStr += '<div style="height:45px;background:#F0F0F0;width:430px;position:relative;top:16px;right:20px;"><input type="image" id="keyword_tip2" src="front/image/keyword_add.png" onClick="collectiontag(&quot;center_footnum_col_'+collectiondivnum+'&quot;,&quot;keyword_tip_'+collectiondivnum+'&quot;,&quot;center_footnum1_'+collectiondivnum+'&quot;,'+userid+','+currWBid+','+userid+')"/>';
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
						newWeiBoStr += '<input name="imgbtn" type="image" src="front/image/transmit_sure.png" id="transmit" onClick="transmitweibo(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;,&quot;transmit_input_'+transmitdivnum+'&quot;,&quot;error_do_not_need&quot;,&quot;center_footnum2_'+transmitdivnum+'&quot;,'+userid+','+currWBid+','+userid+')">';
						
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
						newWeiBoStr += '<img src="/weibouserimages/'+$("#uimgPath").val()+'" id="comment_img'+commentdivnum+'" style="width:30px;height:30px;margin-left:30px;margin-top:10px;position:relative;">';
						newWeiBoStr += '<input type="text" id="comment_input_'+commentdivnum+'" class="comment_input"/><br>';
						newWeiBoStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img1.png" id="comment_pace_png"/></a>';
						newWeiBoStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img2.png" id="comment_pace_png"/></a>';
						newWeiBoStr += '<input type="checkbox" id="comment_check_'+commentdivnum+'" class="comment_check"><span id="comment_check_word">同时转发到我的微博</span>';
						newWeiBoStr += '<img src="front/image/comment_btn.png" id="comment_btn" onClick="commentsWeibo(&quot;center_footnum3_'+commentdivnum+'&quot;'+',&quot;comment_div_'+commentdivnum+'&quot;'+',&quot;comment_input'+commentdivnum+'&quot;'+',&quot;comment_check'+commentdivnum+'&quot;,'+userid+','+wbid+')"/>';
						newWeiBoStr += '</div>';
						
						newWeiBoDiv.innerHTML = newWeiBoStr;
						$(newWeiBoDiv).insertBefore($("#xixi div").first());
						
						
						
						
						$("#"+textid).val('');
						
						$("#"+checkid).attr("checked", false);
						
						$("#"+commentnav).html('<img src="front/image/center-part_foot03.png" id="foot01_img"/>'+data.commentAccount);
						 
						//刷新右边用户信息框
						//刷新微博数
						tempweibocount = document.getElementById("weibocount").value;
						
						weibocount = parseInt(tempweibocount) + 1;
						MsgStr = '';
						MsgStr += '<a href="javascript:void(0)" id="user_img"><img src="/weibouserimages/'+$("#uimgPath").val()+'"style="hight:60px;width:60px"/></a>';
						MsgStr += '<a href="javascript:void(0)" id="user_name">'+$("#username").val()+'</a>';
						MsgStr += '<a href="javascript:void(0)" id="vip_img"><img src="front/image/vip_logo.jpg"/></a>';
						MsgStr += '<div id="levelimg">';
			            MsgStr += '<a href="javascript:void(0)" id="level">Lv.10</a>';
			            MsgStr += '</div>';
			            MsgStr += '<div id="usernum">';
			            MsgStr += '<a href="javascript:void(0)" id="usernumone"><font id="num">'+$("#focuscount").val()+'</font>关注</a>';
			            MsgStr += '<a href="javascript:void(0)" id="usernumone"><font id="num">'+$("#fanedbocount").val()+'</font>粉丝</a>';
			            MsgStr += '<a href="javascript:void(0)" id="usernumone"><font id="num">'+weibocount+'</font>微博</a>';
			            MsgStr += '</div>';
						var MsgDiv = document.getElementById("right-part-content");
						if(undefined != MsgDiv){
							MsgDiv.innerHTML = MsgStr;
						}
						document.getElementById("weibocount").value = weibocount;
						
						//添加评论的内容
						var str = '';
						str += '<div id="comment_div_three" class="comment_div_three">';
						str += '<a href="javascript:void(0)" class="comment_div_three_a1"><img style="width:30px;height:30px;margin-left:30px;position:relative;" src="/weibouserimages/'+$("#uimgPath").val()+'" id="comment_img"></a>';
						str += '<a href="javascript:void(0)" class="comment_div_three_a">'+$("#username").val()+'  :  </a>';
							
						//表情处理
						var wb_newContent ='';
						var wb_newContent1 = '';
						var faceArr = text.split("[");
						for(var k = 0; k < faceArr.length; k ++){
							if(faceArr[k].split("]]").length > 1){  //主题
								wb_newContent = '[['+faceArr[k]+wb_newContent;
							}else if(faceArr[k] != "" && faceArr[k].split("]]").length == 1 && faceArr[k].split("]").length > 1){ //说明是表情 
								faceArr[k] = '<img src="front/image/face_image/'+faceArr[k].split("]")[0]+'.png" />'+faceArr[k].split("]")[1];
								wb_newContent += faceArr[k];
							}else{
								wb_newContent += faceArr[k];
							}
						}
						var faceRegx1 = new RegExp('\\n','gi');
						var faceArr1 = wb_newContent.split(faceRegx1);
						for(var j = 0; j < faceArr1.length; j ++){
							wb_newContent1 += faceArr1[j]+'<br />';
						}
						str += '<span class="comment_div_three_a">'+wb_newContent1+'</span>';
		                str += '</div>';
		                str += '<div id="comment_div_four" class="comment_div_four">';
		                str += '<span class="comment_div_four_a1">'+data.commentDate+'</span>';
		               	str += '<a href="javascript:void(0)" class="comment_div_four_a"><img src="front/image/center-part_foot04.png"/><font class="comment_div_four_font">0</font></a>';
		                str += '<a href="javascript:void(0)" class="comment_div_four_a" onclick="commentDelete()">删除</a>';
		                str += '<a href="javascript:void(0)" class="comment_div_four_a" onClick="commentOthers(&quot;comment_div_five'+commentdivnum+'&quot;,&quot;comment_input_d_'+commentdivnum+'&quot;)">回复</a>';
		                str += '<a href="javascript:void(0)" class="comment_div_four_a" onClick="commentTip()">举报</a>';
		                str += '</div>';
		                str += '<div id="comment_div_five'+commentdivnum+'" class="comment_div_five" style="display:none;">';
		                str += '<img src="/weibouserimages/'+$("#uimgPath").val()+'" id="comment_img'+commentdivnum+'" style="width:30px;height:30px;margin-left:90px;margin-top:10px;position:relative;">';
		                str += '<input type="text" id="comment_input_five'+commentdivnum+'" class="comment_input_five"  style="border: 1px solid red;height: 30px;margin-left: 10px;width: 350px"/>';
		                str += '<img src="front/image/comment_btn.png" id="comment_btn_five'+commentdivnum+'" style="float: right;margin-right: 40px;margin-top:20px;" onClick="commentsWeiboAndcommentOthers(&quot;center_footnum3_'+commentdivnum+'&quot;,&quot;comment_div_'+commentdivnum+'&quot;&quot;comment_div_five'+commentdivnum+'&quot;&quot;comment_input_five'+commentdivnum+'&quot;,'+userid+','+wbid+','+currCid+')"/>';
		                str += '</div>';
		                
						$("#"+commentdiv).append(str);
							
							
						clicklikenum ++;
						commentdivnum ++;
						transmitdivnum ++;
						collectiondivnum ++;
				  }
			  }
		  },
		  error:function(error,textStatus){
			  alert("评论时发生错误："+error);
		  }
	});
	}

}

//评论 评论的评论（不转发，无图片，被我删掉了）												//当前用户id  微博id  评论的id
function commentsWeiboAndcommentOthers(commentnav,commentdiv,commentAndCommentId,inputTextId,uid,wbid,cid){
	var txt = $("#"+inputTextId).val();
	
	$.ajax({
		url: "weibo/commentAndComment",
		cache: false,
		data:{"uid":uid,"wbid":wbid,"cid":cid,'txt':txt},
		dataType:"json",
		type:"POST",
		success: function(data,textStatus){
			
			if(data.success){
				var dateString = data.commentDate;  //评论时间
				var commentAccount = data.commentAccount; //评论后该微博的评论数
				var currCid = data.currCid;	//评论评论的评论的评论id
				var commentUname = data.commentUname; //所属评论的用户名
				
				$("#"+inputTextId).val('');
				
				$("#"+commentAndCommentId).hide();
				
				$("#"+commentnav).html('<img src="front/image/center-part_foot03.png" id="foot01_img"/>'+commentAccount);
				//添加评论的内容
				var str = '';
				str += '<div id="comment_div_three" class="comment_div_three">';
				str += '<a href="javascript:void(0)" class="comment_div_three_a1"><img style="width:30px;height:30px;margin-left:30px;position:relative;" src="/weibouserimages/'+$("#uimgPath").val()+'" id="comment_img"></a>';
				str += '<a href="javascript:void(0)" class="comment_div_three_a">'+$("#username").val()+'  :  </a>';
					
				//表情处理
				var wb_newContent ='';
				var wb_newContent1 = '';
				var faceArr = txt.split("[");
				for(var k = 0; k < faceArr.length; k ++){
					if(faceArr[k].split("]]").length > 1){  //主题
						wb_newContent = '[['+faceArr[k]+wb_newContent;
					}else if(faceArr[k] != "" && faceArr[k].split("]]").length == 1 && faceArr[k].split("]").length > 1){ //说明是表情 
						faceArr[k] = '<img src="front/image/face_image/'+faceArr[k].split("]")[0]+'.png" />'+faceArr[k].split("]")[1];
						wb_newContent += faceArr[k];
					}else{
						wb_newContent += faceArr[k];
					}
				}
				var faceRegx1 = new RegExp('\\n','gi');
				var faceArr1 = wb_newContent.split(faceRegx1);
				for(var j = 0; j < faceArr1.length; j ++){
					wb_newContent1 += faceArr1[j]+'<br />';
				}
				str += '<span class="comment_div_three_a">回复@'+commentUname+'  : '+wb_newContent1+'</span>';
                str += '</div>';
                str += '<div id="comment_div_four" class="comment_div_four">';
                str += '<span class="comment_div_four_a1">'+dateString+'</span>';
               	str += '<a href="javascript:void(0)" class="comment_div_four_a"><img src="front/image/center-part_foot04.png"/><font class="comment_div_four_font">0</font></a>';
                str += '<a href="javascript:void(0)" class="comment_div_four_a" onclick="commentDelete()">删除</a>';
                str += '<a href="javascript:void(0)" class="comment_div_four_a" onClick="commentOthers(&quot;comment_div_five'+commentdivnum+'&quot;,&quot;comment_input_d_'+commentdivnum+'&quot;)">回复</a>';
                str += '<a href="javascript:void(0)" class="comment_div_four_a" onClick="commentTip()">举报</a>';
                str += '</div>';
                str += '<div id="comment_div_five'+commentdivnum+'" class="comment_div_five" style="display:none;">';
                str += '<img src="/weibouserimages/'+$("#uimgPath").val()+'" id="comment_img'+commentdivnum+'" style="width:30px;height:30px;margin-left:90px;margin-top:10px;position:relative;">';
                str += '<input type="text" id="comment_input_five'+commentdivnum+'" class="comment_input_five"  style="border: 1px solid red;height: 30px;margin-left: 10px;width: 350px"/>';
                str += '<img src="front/image/comment_btn.png" id="comment_btn_five'+commentdivnum+'" style="float: right;margin-right: 40px;margin-top:20px;" onClick="commentsWeiboAndcommentOthers(&quot;center_footnum3_'+commentdivnum+'&quot;,&quot;'+commentdiv+'&quot;,&quot;comment_div_five'+commentdivnum+'&quot;,&quot;comment_input_five'+commentdivnum+'&quot;,'+userid+','+wbid+','+currCid+')"/>';
                str += '</div>';
                
				$("#"+commentdiv).append(str);
				
				commentdivnum ++;
			}
			
		},
		error:function(error,textStatus){
			alert("评论评论的评论发生错误："+error);
		}
		
	});
}

function letRandom(){
	$.ajax({
		url:'theme/random',
		dataType:'JSON',
		type:'POST',
		success:function(data){
			//console.info(data);
			$("#hot_topic_content").html("");
			var str="";
			for(var i=0;i<data.length;i++){//data就是一个theme的List（java中） ，用json传过来以后，在js中，就是数组
				var item=data[i];//这里就是数组的元素了  就是一个theme
				//alert(item.tname);
				str+='<li style="margin-bottom:0px;"><a href="javascript:showthemedetails('+item.tid+')" class="hot_topic_detail">'+item.tname+'</a><span class="hot_topic_detail_click">'+item.tview+'</span></li>';
				$("#hot_topic_content").html(str);
			}//要想到，之后如果要在这个上面做点击事件的话，所以先预留一下，只要有id传过来了，这个事件就好做了，
			
			
			/*后端用session，，request，等来保存参数，而且最后还跳了页面，那肯定是到页面上用el表达式取值
			后端用json传值，前端一般用ajax请求，这个时候不会跳页面，而且，json字符串直接作为ajax的success的回调的data
			直接返回了，那就直接用这个json字符串，进行json对象的处理，*/
			
			
			
			
			$("#hot_topic_content").html(str);
			//html(str+$("#hot_topic_content").html(str));
			//在最前面就是： str+原本的内容        在最后面： 原本  +str
		}
	});
}

  
//计算中文字符
function byteLength(str) {
	var byteLen = 0, len = str.length;
	if (!str)
		return 0;
	for (var i = 0; i < len; i++)
		byteLen += str.charCodeAt(i) > 255 ? 1 : 1;

	return byteLen;
}

//微博输入框
$(document).ready(function(){   
	var txt=document.getElementById("txt");
	var str;

	//键盘监听事件
	txt.addEventListener("keyup",function(){
		str=byteLength(txt.value);
		if(str>140){
			document.getElementById("s2").innerHTML='<span style="color:#666">已经超出了'+(str-140)+'个字</span>';	
		}else{
			document.getElementById("s2").innerHTML='<span style="color:#666">您还可以输入'+(140-str)+'个字</span>';	
		}
	});

	//获得焦点事件
	txt.addEventListener("focus",function(){
		str=txt.value;
		if(str.length<=140){
			document.getElementById("s2").innerHTML='<span style="color:#666">您还可以输入'+(140-str.length)+'个字</span>';	
		}else{
			document.getElementById("s2").innerHTML='<span style="color:#666">您还可以输入0个字</span>';	
		}
	});

	//失焦事件
	txt.addEventListener("blur",function(){
		document.getElementById("s2").innerHTML="王宝强，马蓉离婚案";	
	});
});


//改变导航栏的颜色
function searchClick(){
	$('.searchTextBorder').css('border-color','red');	
	$('.searchTextBorder').css('background','#fff');
	$('.searchText').css('background','#fff');
}
function searchBlur(){
	$('.searchTextBorder').css('border-color','#999');	
	$('.searchTextBorder').css('background','#f2f2f2');
	$('.searchText').css('background','#f2f2f2     ');
}

//改变微博输入框下小图标的颜色
function changemoreimg(){
	document.getElementById("moreimg").innerHTML='<img src="front/image/write_img6_1.png"/>'
	}
function changemoreimgs(){
	document.getElementById("moreimg").innerHTML='<img src="front/image/write_img6.png"/>'
	}

//改变颜色 换图片
function changecolor(){
	document.getElementById("nav-icon").innerHTML='<img src="front/image/navigation-iconin.png"/>';
}
function changecolors(){
	document.getElementById("nav-icon").innerHTML='<img src="front/image/navigation_icon.png"/>';
}

//开始隐藏div
function showhidediv(id){
	var sbtitle=document.getElementById(id);
	if(sbtitle){
		if(sbtitle.style.display=='block'){
			sbtitle.style.display='none';
		}else{
			sbtitle.style.display='block';
		}
	}
}


function changeword(obj){
	var oo=$(obj);
	$("#aa").text(oo.html());	//到此是操作屏幕上的内容，    
	//TODO:现在开始操作隐藏域的内容，  隐藏域中   op的值
	//alert(oo.attr("data"));
	$("#form_push_op").attr("value",oo.attr("data"));
}

//换完权限后隐藏div
function hidediv(){
	document.getElementById("choose").style.display='none';
}


function changecentercolor(id){
	document.getElementById(id).innerHTML='<img src="front/image/conter-part_wayimg02.png"/>';
}

function changecentercolors(id){
	document.getElementById(id).innerHTML='<img src="front/image/conter-part_wayimg01.png"/>';
}

function showcenterhidediv(id){
	var sbtitles=document.getElementById(id);
	if(sbtitles){
		if(sbtitles.style.display=='block'){
			sbtitles.style.display='none';
		}else{
			sbtitles.style.display='block';
		}
	}
}

function hidecenterdiv(id){
	document.getElementById(id).style.display='none';
}

function changesupersearch(num){
	var supersearchdiv=$("#supersearch");
	//console.info(supersearchdiv);
//	var navigation=document.getElementById("navigation");
	var navigation=$("#navigation");
	//console.info(navigation);
	if(num==1){
//		alert("ddd");
		//点击展开的事件
		//关闭小框， 显示 大框
		supersearchdiv.show();
		navigation.hide();
	}else{
		//点击缩小的事件
		//关闭大框   显示小框  
		supersearchdiv.hide();
		navigation.show();
	}
}

//高级搜索关闭图片变颜色
function superdivcloseimg2(id){
	document.getElementById(id).innerHTML='<img src="front/image/superdivclose2.png" id="closepng">';
}
function superdivcloseimg(id){
	document.getElementById(id).innerHTML='<img src="front/image/superdivclose.png" id="closepng">';
}

//取消键关闭收藏标签
function closecollectiondiv(id,inputid){
	var cancelbtn2=document.getElementById(id);
	$("#"+inputid).val('');
	if(cancelbtn2){
		if(cancelbtn2.style.display=='block'){
			cancelbtn2.style.display='none';
		}else{
			cancelbtn2.style.display='block';
		}
	}
}

//取消键关闭添加标签(jquery)
/*function closecollectiondiv(id){
	var cancelbtn2=$('.'+id);
	if(cancelbtn2.is(":visible")){
		if(cancelbtn2.is(":visible")){
			cancelbtn2.hide();
			}else{
				cancelbtn2.show();
			}
	}
}*/


//控制收藏标签栏的可见
function addcollectiondiv(id,uid,weiboid){
	var tips2=document.getElementById(id);  //收藏后打开的div
	
	$.ajax({
		url: "weibo/collectionDiv",
		cache: false,
		data:{"uid":uid,"wbid":weiboid},
		dataType:"json",
		Type:"GET",
		success: function(data,textStatus){
			if(data.ishave){
				alert("您已收藏该微博.");
	
			}else if(tips2){
				if(tips2.style.display=='block'){
					tips2.style.display='none';
				}else{
					tips2.style.display='block';
				}
			}
			
		},
		error:function(){
			
		}
		
	});
	
}

//close图标改变颜色
function collectiondivcloseimg2(id){
	document.getElementById(id).innerHTML='<img src="front/image/superdivclose2.png" id="colle_closepng">';
}
function collectiondivcloseimg(id){
	document.getElementById(id).innerHTML='<img src="front/image/superdivclose.png" id="colle_closepng">';
}
//colse图标关闭div
function changecollectionsearch(id,inputid){
	var cancelbtn3=document.getElementById(id);
	$("#"+inputid).val('');
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
function changetransmitsearch(id,txtareaid){
	var cancelbtn4=document.getElementById(id);
	$("#"+txtareaid).val('');
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
	
function commentOthers(commentsWeiboAndOtherDivid,commentsWeiboAndOthertext){
	var commentsWeiboAndOtherDiv = document.getElementById(commentsWeiboAndOtherDivid);

	if(commentsWeiboAndOtherDiv){
		if(commentsWeiboAndOtherDiv.style.display == 'block'){
			$("#"+commentsWeiboAndOthertext).val('');
			commentsWeiboAndOtherDiv.style.display='none';
		}else{
			commentsWeiboAndOtherDiv.style.display='block';
		}
	}
	
}
	//控制评论标签栏的可见   
	function addcommentdiv(commentdivid,wbid){
		var tips3=document.getElementById(commentdivid);
		
		$.ajax({
			url : 'weibo/commentDiv',
			cache: false,
			data:{"wbid":wbid},
			dataType:"json",
			Type:"GET",
			success: function(data,textStatus){
				if(data.success){
					
					var finalCommentMsgs = data.finalCommentMsgs;
					var finalStr = '';
					for(var ii = 0; ii < finalCommentMsgs.length; ii++){
						var finalCommentMsg = finalCommentMsgs[ii];
						var cdate = finalCommentMsg.CDATE;  //时间
						var cgreateAccount = finalCommentMsg.CGREATEACCOUNT; //点赞数
						var contentTxt = finalCommentMsg.CONTENTTXT; //回复的内容
						var Ucomment = finalCommentMsg.UCOMMENT; //回复人名
						var UimgPath = finalCommentMsg.UIMGPATH; //回复人的图像
						var Ucommented = finalCommentMsg.UCOMMENTED; //被回复者的人名
						var cid = finalCommentMsg.CID; //comment id
						var wbid = finalCommentMsg.WBID; //微博id
						var wbuid = finalCommentMsg.WBUID; //微博所属用户的id
						
						finalStr += '<div id="comment_div_three" class="comment_div_three">';
						finalStr += '<a href="javascript:void(0)" class="comment_div_three_a1"><img style="width:30px;height:30px;margin-left:30px;position:relative;" src="/weibouserimages/'+UimgPath+'" id="comment_img"></a>';
						finalStr += '<a href="javascript:void(0)" class="comment_div_three_a">'+Ucomment+'  :  </a>';
						
						//表情处理
						var wb_newContent ='';
						var wb_newContent1 = '';
						var faceArr = contentTxt.split("[");
						for(var k = 0; k < faceArr.length; k ++){
							if(faceArr[k].split("]]").length > 1){  //主题
								wb_newContent = '[['+faceArr[k]+wb_newContent;
							}else if(faceArr[k] != "" && faceArr[k].split("]]").length == 1 && faceArr[k].split("]").length > 1){ //说明是表情 
								faceArr[k] = '<img src="front/image/face_image/'+faceArr[k].split("]")[0]+'.png" />'+faceArr[k].split("]")[1];
								wb_newContent += faceArr[k];
							}else{
								wb_newContent += faceArr[k];
							}
						}
						var faceRegx1 = new RegExp('\\n','gi');
						var faceArr1 = wb_newContent.split(faceRegx1);
						for(var j = 0; j < faceArr1.length; j ++){
							wb_newContent1 += faceArr1[j]+'<br />';
						}
						
						if(Ucommented == null){
							finalStr += '<span class="comment_div_three_a">  : '+wb_newContent1+'</span>';
						}else{
							finalStr += '<span class="comment_div_three_a">回复@'+Ucommented+'  : '+wb_newContent1+'</span>';
						}	
							finalStr += '</div>';
							finalStr += '<div id="comment_div_four" class="comment_div_four">';
							finalStr += '<span class="comment_div_four_a1">'+cdate+'</span>';
							finalStr += '<a href="javascript:void(0)" class="comment_div_four_a"><img src="front/image/center-part_foot04.png"/><font class="comment_div_four_font">'+cgreateAccount+'</font></a>';
							finalStr += '<a href="javascript:void(0)" class="comment_div_four_a" onclick="commentDelete()">删除</a>';
							finalStr += '<a href="javascript:void(0)" class="comment_div_four_a" onClick="commentOthers(&quot;comment_div_five'+commentdivnum+'&quot;,&quot;comment_input_d_'+commentdivnum+'&quot;)">回复</a>';
							finalStr += '<a href="javascript:void(0)" class="comment_div_four_a" onClick="commentTip()">举报</a>';
							finalStr += '</div>';
							finalStr += '<div id="comment_div_five'+commentdivnum+'" class="comment_div_five" style="display:none;">';
							finalStr += '<img src="/weibouserimages/'+$("#uimgPath").val()+'" id="comment_img'+commentdivnum+'" style="width:30px;height:30px;margin-left:90px;margin-top:10px;position:relative;">';
							finalStr += '<input type="text" id="comment_input_five'+commentdivnum+'" class="comment_input_five"  style="border: 1px solid red;height: 30px;margin-left: 10px;width: 350px"/>';
							finalStr += '<img src="front/image/comment_btn.png" id="comment_btn_five'+commentdivnum+'" style="float: right;margin-right: 40px;margin-top:20px;" onClick="commentsWeiboAndcommentOthers(&quot;center_footnum3_'+commentdivnum+'&quot;,&quot;'+commentdivid+'&quot;,&quot;comment_div_five'+commentdivnum+'&quot;,&quot;comment_input_five'+commentdivnum+'&quot;,'+$("#user").val()+','+wbid+','+cid+')"/>';
							finalStr += '</div>';
	                
							$("#"+commentdivid).append(finalStr);
							
							commentdivnum ++;
						}
						if(tips3){
							if(tips3.style.display=='block'){
								tips3.style.display='none';
							}else{
								tips3.style.display='block';
							}
					}	
				}
			}
		});
	}
	
/*function addcommentdiv1(id){
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
}*/

//视频 图片文件的div的可见与隐藏
function showNone(id1,id2){//先隐藏两个元素，然后显示第一个，
	var obj1=$("#"+id1);
	var obj2=$("#"+id2);//传过来的是字符串
	
	if(obj1!=undefined&&obj2!=undefined){
		if(obj2.css("display")=="block"){
			obj2.hide();
		}
		if(obj1.css("display")=="none"){
			obj1.css("display","block");
		}else{
			obj1.css("display","none");
		}
	}
	
	//createInput(id1);
	
}

var countpic = 0;
var countvideo = 0;
/*
* 生成多附件上传框 
*/ 
function createInput(picsdiv){
		countpic++;  
	    var str = '<div name="div">'+  
	    '   '+ '<input type="file" contentEditable="false" id="uploads' + countpic + '' +  
	    '" name="uploads'+ countpic +'" value="" style="width:250px"/><a href="javascript:void(0)" onclick="removeInput(event,'+picsdiv+')" style="font-size:12px;height:25px;line-height:25px;width:25px;margin-left:5px;padding-right:5px;float:right;">删除</a>'+'</div>';  
	    $("#"+picsdiv).append(str);
	    
	    media[countpic] = "uploads"+countpic;
}
/*
* 删除多附件删除框 
*/  
function removeInput(evt, parentId){  
   var el = evt.target == null ? evt.srcElement : evt.target;  
   var div = el.parentNode;  
   //var cont = document.getElementById(parentId);         
   if(parentId.removeChild(div) == null){  
    return false;  
   }  
   return true;  
} 
//表情的div的控制
function showfaceimage(id){
	var tips8=document.getElementById(id);
	if(tips8){
		if(tips8.style.display=='block'){
			tips8.style.display='none';
		}else{
			tips8.style.display='block';
		}
	}
}


//话题的div的控制
function showtopicinput(id){
	var tips9=document.getElementById(id);
	if(tips9){
		if(tips9.style.display=='block'){
			tips9.style.display='none';
		}else{
			tips9.style.display='block';
		}
	}
}
//点击表情以后       
function clickFace(obj){
	$("#face_image").hide();
	//alert($(obj).attr("data"));
	var face=$(obj).attr("data");
	
	var txt=$("#txt");
	txt.val(txt.val()+face);    
}

//点击话题以后   
function clicktopic(obj){
	$("#topic_input").hide();
	//alert($(obj).attr("data"));
	var topic=$(obj).attr("data");
	
	var txt=$("#txt");
	txt.val(txt.val()+topic);    
}

function showcommentfour(id){
	var commentfour=document.getElementById(id);
	if(commentfour){
		if(commentfour.style.display=='block'){
			commentfour.style.display='none';
		}else{
			commentfour.style.display='block';
		}
	}
	
}
