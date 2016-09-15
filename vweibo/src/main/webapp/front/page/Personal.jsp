<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/vweibo/"/>
<meta content="text/html; charset=utf-8 pageEncoding=utf-8"/>
<title>我的首页 微博-随时随地发现新鲜事</title>

<link type="text/css" rel="stylesheet" href="front/css/Personal.css"/>

</head>
<script type="text/javascript" src="front/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="front/js/personal.js"></script>
<body>
<input type="hidden" value="${sessionScope.user.WBUid}" id="hiddenid">
	<div class="head" id="head">
    	<div id="logo" class="headSon"><img src="front/image/helpArea_image/logoArea_logo.png"/></div>
  
        <div id="search" class="headSon">
        	<ul>
            	<li><input type="text" id="search-text" placeholder="大家正在搜：像贵妃一样怀个孕"/></li>
                <li><a href="#"><img src="front/image/icon_search.png" id="search-icon"/></a></li>
            </ul>

        </div>
        
        <div id="something" class="headSon">
       		<ul class="headDetails" id="headDetails">      
          		<li class="a"><a href="#?PersonalIndex="><img src="front/image/index.png"/></a></li>
            	<li class="a"><a href="#?Find="><img src="front/image/found.png"/></a></li>
            	<li class="a"><a href="#?Game="><img src="front/image/game.png"/></a></li>
            	<li id="weiboname"><a href="front/page/afterlogin.jsp">
           			<img src="front/image/people.png"/>${sessionScope.user.uname}
                	</a></li>
        </ul>
        </div>
  
        
        <div id="MsgAndSetting" class="headSon">
        	<ul class="headDetails" id="headDetails">
            	<li><a href="MSG"><img src="front/image/chat.png"/></a></li>
            	<li><a href="SETTING"><img src="front/image/set.png"/></a></li>
                <li><a href="WRITE"><img src="front/image/write.png"/></a></li>
        	</ul>
        </div>   
    </div>
    
    <div id="content">
    	<div id="content_m1">
        	<div id="picANDmsg">
            	<div id="picANDmsg_center">
                	<dl>
                    	<dt id="meitu"><img src="/weibouserimages/${sessionScope.user.uimgPath}"/></dt>
                        <dd><p style="font-size: 22px;color: b">${sessionScope.user.uname}</p></dd>
                    </dl>
                </div>
            </div>
            <div id="navy">
            	<ul>
                	<li id="myindex"><a href="#?myindex">我的主页</a></li>
                    <li><a href="#?mypicture" onClick="javascript:changeContent(this)">我的相册</a></li>
                	<li><a href="#?mymanagercenter" >管理中心</a></li>
                </ul>
            </div>
        </div>
    	<div id="content_m2">
        	<div id="content_m2_left">
            	<div id="left_left1" class="left">
                	<dl>
                    	<dt>${ sessionScope.groupnumber.FOCUSNUM }</dt>
                        <dd><a href="#">关注</a></dd>
                    </dl>
                    <dl>
                        <dt>${ sessionScope.groupnumber.FANSNUM }</dt>
                        <dd><a href="#">粉丝</a></dd>
                    </dl>
                    <dl>
                        <dt>${ sessionScope.groupnumber.WEIBONUM }</dt>
                        <dd><a href="#">微博</a></dd>
                    </dl>
                </div>
                
                <div id="left_left2" class="left">
                	<li id="applyFor"><a href="#">申请认证</a></li>
                    <li id="personalProgree"><p>个人资料完成度100%</p>
                    	<p>进度条</p>
                    </li>
                    <li id="editPersonal"><a href="#">编辑个人资料>></a></li>
                </div>
                
                <div id="left_left3" class="left">
                	<li id="album"><a href="#">相册</a></li>
                    <li id="albumDetails"><img src="front/image/myAlbumDetails.png"/></li>
                    <li id="albumMore"><a href="#">查看更多>></a></li>
                </div>
                
              	<div id="left_left4" class="left">
                	<li id="myWeiboHot"><p>我的微博人气</p></li>
                    <li id="myWeiboHotDetails">
                    	<div id="dataDiv">
                        	<table id="myWeiboView_head" cellpadding="0px" cellspacing="0px">
                    			<tr id="Tth">
                        			<th>主页访问</th>
                           			<th>转发评论</th>
                        		</tr>
                    		</table>                   	
                    		<table id="myWeiboView_content" cellpadding="0px" cellspacing="0px">
                        		<tr id="Ttr1">
                        			<td><div>   </div></td><!-- 一周被访问，评论次数-->
                        		</tr>
                        		<tr id="Ttr2">
                        			<td><div>   </div></td><!-- 一周被访问，评论次数生成的折线图-->
                        		</tr>                  
                    		</table>
                        </div>                  		
                 	</li>
                    <li><p>在你的互粉好友中排第<span style="color:#F03;font-size:16px;">2</span>位</p></li>
                </div>
                
            </div>
            <div id="content_m2_right">
            	<ul id="myCollections" >
            		
            	</ul>
            </div>
        </div>
    </div>
    
    <div id="foot">
    
    </div>
    
    
	
</body>

<script type="text/javascript">
	var WBUid=$("#hiddenid").val();
	$(function(){
		$.post("weibo/myCollections",{"WBUid":WBUid},function(data){
			var str="";
			for(var i=0;i<data.length;i++){
				var txt=data[i].WBtxt.split("[");
				var newtxt="";
				for(var g=0;g<txt.length;g++){
					if(txt[g].indexOf("]")>0){
						newtxt+="";
					}else{
						newtxt+=txt[g];
					}
				}
				var newContent ='';
				var newContent1 = '';
				faceArr = data[i].WBtxt.split("[");
				for(var k = 0; k < faceArr.length; k ++){
					if(faceArr[k] != "" && faceArr[k].split("]]").length == 1 && faceArr[k].split("]").length > 1){ //说明是表情 
						faceArr[k] = '<img src="front/image/face_image/'+faceArr[k].split("]")[0]+'.png" />'+faceArr[k].split("]")[1];
						newContent += faceArr[k];
					}
					if(faceArr[k].split("]]").length > 1){
						newContent+= '[['+faceArr[k];
					}
				}
				
				
				str+='<li>'+(i+1)+'.&nbsp;&nbsp;<a href="javascript:findWeiBo('+data[i].WBid+')">'+newtxt+newContent+'</a></li>';
			}
			$("#myCollections").append(str);
		},"json")
	});

</script>
</html>