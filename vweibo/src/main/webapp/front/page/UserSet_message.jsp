<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<base href="/vweibo/"/>
<title>无标题文档</title>
<link rel="stylesheet" href="front/css/UserSet_message.css">
<script src="front/js/jquery-1.11.1.min.js"></script>
<script src="front/js/UserSet_message.js"></script>

</head>

<body>
	<div id="wrap">
    	<div id="left">
        	<span class="idSet">账号设置</span>
            <ul>
            	<li class="line1"></li>
                <li class="myInfo"><img src="front/image/UserSet_image/icon1_1.png"><a href="front/page/UserSet.jsp">我的信息</a></li>
                <li class="photo"><img src="front/image/UserSet_image/icon2_1.png"><a href="front/page/UserSet_photo.jsp">头像</a></li>
                <li class="line2"></li>
                <li class="privacy"><img src="front/image/UserSet_image/icon3_1.png"><a href="front/page/UserSet_privacy.jsp">隐私设置</a></li>
                <li class="message"><img src="front/image/UserSet_image/icon4_2.png"><a href="front/page/UserSet_message.jsp">消息设置</a></li>
                <li class="prefer"><img src="front/image/UserSet_image/icon5_1.png"><a href="front/page/UserSet_prefer.jsp">偏好设置</a></li>
                <li class="line3"></li>
            </ul>
        </div>
        <div id="right">
        	<ul>
            	<span class="head_label">消息设置<a href="#">预览我的主页</a></span>
                <li class="aiteMe">@我的&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="span1">****</span><a href="javascript: compileAndClose('.aiteMe','.aiteMe1',1,1);">编辑</a></li>
                <li style="display:none;background:#fff;height:300px" class="aiteMe1">@我的<a href="javascript: compileAndClose('.aiteMe','.aiteMe1',2,0);">收起</a><br/>
                    <div>
                    	<span class="aiteMe_span1">我可以收到哪些人的@消息</span><br/>
                        <input class="getAllMess" type="radio" name="getWhoMess" value="getAllMess"/><span>所有人</span><br/>
                        <input class="getAttMess" type="radio" name="getWhoMess" value="getAttMess"/><span>我关注的人</span><br/>
                        <span class="aiteMe_span2">我将收到这些人的@小黄签提醒</span><br/>
                        <input class="getAllRemind" type="radio" name="getWhoRemind" value="getAllRemind"/><span>所有人</span><br/>
                        <input class="getAttRemind" type="radio" name="getWhoRemind" value="getAttRemind"/><span>我关注的人</span><br/>
                        <input class="noRemind" type="radio" name="getWhoRemind" value="noRemind"/><span>不提醒</span><br/>
                        <input class="aiteMeBtn" type="image" src="front/image/UserSet_image/savePhoto1.png"/>
                        <input class="closeBtn" type="image" src="front/image/UserSet_image/closebtn1.png" onclick="compileAndClose('.aiteMe','.aiteMe1',2,0)"/>
                    </div>
                </li>
                
                <li class="comment">评论&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="span1">****</span><a href="javascript: compileAndClose('.comment','.comment1',1,2);">编辑</a></li>
                <li style="display:none;background:#fff;height:500px" class="comment1">评论<a href="javascript: compileAndClose('.comment','.comment1',2,0);">收起</a><br/>
                    <div>
                        <span class="comment_span1">允许那些人评论我</span><br/>
                        <input class="getAllComm" type="radio" name="getWhoComm" value="getAllComm"/><span>所有人</span><br/>
                        <input class="getAttComm" type="radio" name="getWhoComm" value="getAttComm"/><span>我关注的人</span><br/>
                        <input class="getFanComm" type="radio" name="getWhoComm" value="getFanComm"/><span>仅粉丝</span><br/>
                        <span class="comment_span2">是否允许其他人在我的微博评论中发图片</span><br/>
                        <input class="yesSendPic" type="radio" name="sendPic" value="tesSendPic"/><span>允许</span><br/>
                        <input class="noSendPic" type="radio" name="sendPic" value="noSendPic"/><span>不允许(关闭后，其他人将不能在你的微博下发带图片的评论)</span><br/>
                        <span class="comment_span3">我将收到这些人的评论小黄签提醒</span><br/>
                        <input class="getAllCommRemind" type="radio" name="getWhoCommRemind" value="getAllCommRemind"/><span>所有人</span><br/>
                        <input class="getAttCommRemind" type="radio" name="getWhoCommRemind" value="getAttCommRemind"/><span>我关注的人</span><br/>
                        <input class="noCommRemind" type="radio" name="getWhoCommRemind" value="noCommRemind"/><span>不提醒</span><br/>
                        <span class="comment_span4">我参与的(开启后，若评论了一条微博，我将收到“关注的人”对这条微博的评论)</span><br/>
                        <input class="openParticipant" type="radio" name="participant" value="openParticipant"/><span>开启</span><br/>
                        <input class="closeParticipant" type="radio" name="participant" value="closeParticipant"/><span>不开启<span><br/>
                        <input class="commentBtn" type="image" src="front/image/UserSet_image/savePhoto1.png"/>
                        <input class="closeBtn" type="image" src="front/image/UserSet_image/closebtn1.png" onclick="compileAndClose('.comment','.comment1',2,0)"/>
                        
                    </div>
                </li>
                
                
                <li class="praise">赞&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="span1">****</span><a href="javascript: compileAndClose('.praise','.praise1',1,3);">编辑</a></li>
                <li style="display:none;background:#fff;height:275px" class="praise1">赞<a href="javascript: compileAndClose('.praise','.praise1',2,0);">收起</a><br/>
                    <div>
                    	<span class="praise_span1">我是否接收赞提醒</span><br/>
                        <input class="yesPraiseRem" type="radio" name="receivePraiseRem" value="yesPraiseRem"/><span>提醒</span><br/>
                 		<input class="noPraiseRem" type="radio" name="receivePraiseRem" value="noPraiseRem"/><span>不提醒</span><br/>
                        <span class="praise_span2">我参与的(开启后，若赞了一条微博，我将收到“关注的人”对这条微博的赞)</span><br/>
                        <input class="openParPraise" type="radio" name="parPraise" value="openParPraise"/><span>开启</span><br/>
                        <input class="closeParPraise" type="radio" name"parPraise" value="closeParPraise"/><span>不开启<span><br/>
                        <input class="praiseBtn" type="image" src="front/image/UserSet_image/savePhoto1.png"/>
                        <input class="closeBtn" type="image" src="front/image/UserSet_image/closebtn1.png" onclick="compileAndClose('.praise','.praise1',2,0)"/>
                    </div>
                </li>
                
                <li class="privacyLetter">私信&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="span1">****</span><a href="javascript: compileAndClose('.privacyLetter','.privacyLetter1',1,4);">编辑</a></li>
                <li style="display:none;background:#fff;height:275px" class="privacyLetter1">私信<a href="javascript: compileAndClose('.privacyLetter','.privacyLetter1',2,0);">收起</a><br/>
                    <div>
                    	<span class="priLetter_span1">我可以收到那些人的私信</span><br/>
                        <input class="getAllPriLetter" type="radio" name="getWhoPriLetter" value="getAllPriLetter"/><span>所有人</span><br/>
                 		<input class="getAttPriLetter" type="radio" name="getWhoPriLetter" value="getAttPriLetter"/><span>我关注的人(非我关注人的私信请进入未关注人私信查看)</span><br/>
                        <span class="priLetter_span2">我是否接受收私信提醒</span><br/>
                        <input class="yesPriLetterRem" type="radio" name="getPriLetterRem" value="yesPriLetterRem"/><span>提醒</span><br/>
                        <input class="noPriLetterRem" type="radio" name="getPriLetterRem" value="noPriLetterRem"/><span>不提醒<span><br/>
                        <input class="priLetterBtn" type="image" src="front/image/UserSet_image/savePhoto1.png"/>
                        <input class="closeBtn" type="image" src="front/image/UserSet_image/closebtn1.png" onclick="compileAndClose('.privacyLetter','.privacyLetter1',2,0)"/>
                    </div>
                </li>
                
                <li class="noAttPriLetter">未关注人私信<span class="span1">****</span><a href="javascript: compileAndClose('.noAttPriLetter','.noAttPriLetter1',1,5);">编辑</a></li>
                <li style="display:none;background:#fff;height:180px" class="noAttPriLetter1">未关注人私信<a href="javascript: compileAndClose('.noAttPriLetter','.noAttPriLetter1',2,0);">收起</a><br/>
                    <div>
                        <span class="noAttPriLetter_span1">我是否接受收私信提醒</span><br/>
                        <input class="yesNoAttPriLetterRem" type="radio" name="getNoAttPriLetterRem" value="yesNoAttPriLetterRem"/><span>提醒</span><br/>
                        <input class="noNoAttPriLetterRem" type="radio" name="getNoAttPriLetterRem" value="noNoAttPriLetterRem"/><span>不提醒<span><br/>
                        <input class="noAttPriLetterBtn" type="image" src="front/image/UserSet_image/savePhoto1.png"/>
                        <input class="closeBtn" type="image" src="front/image/UserSet_image/closebtn1.png" onclick="compileAndClose('.noAttPriLetter','.noAttPriLetter1',2,0)"/>
                    </div>
                </li>
                
                <li class="newFanse">新粉丝&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="span1">****</span><a href="javascript: compileAndClose('.newFanse','.newFanse1',1,6);">编辑</a></li>
                <li style="display:none;background:#fff;height:210px" class="newFanse1">新粉丝<a href="javascript: compileAndClose('.newFanse','.newFanse1',2,0);">收起</a><br/>
                    <div>
                       <span class="newFanse_span1">我将收到这些人的新粉丝小黄签提醒</span><br/>
                        <input class="getAllNewFanRem" type="radio" name="getWhoNewFanRem" value="getAllNewFanRem"/><span>所有人</span><br/>
                        <input class="getAttNewFanRem" type="radio" name="getWhoNewFanRem" value="getAttNewFanRem"/><span>我关注的人</span><br/>
                        <input class="noNewFanRem" type="radio" name="getWhoNewFanRem" value="noNewFanRem"/><span>不提醒</span><br/>
                        <input class="newFanseBtn" type="image" src="front/image/UserSet_image/savePhoto1.png"/>
                        <input class="closeBtn" type="image" src="front/image/UserSet_image/closebtn1.png" onclick="compileAndClose('.newFanse','.newFanse1',2,0)"/>
                    
                    </div>
                </li>
                
                <li class="friendCircle">好友圈&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="span1">****</span><a href="javascript: compileAndClose('.friendCircle','.friendCircle1',1,7);">编辑</a></li>
                <li style="display:none;background:#fff;height:180px" class="friendCircle1">好友圈<a href="javascript: compileAndClose('.friendCircle','.friendCircle1',2,0);">收起</a><br/>
                    <div>
                        <span class="friendCircle_span1">我是否接受好友圈小黄签提醒</span><br/>
                        <input class="yesFriCircleRem" type="radio" name="getFriCircleRem" value="yesFriCircleRem"/><span>提醒</span><br/>
                        <input class="noFriCircleRem" type="radio" name="getFriCircleRem" value="noFriCircleRem"/><span>不提醒<span><br/>
                        <input class="friendCircleBtn" type="image" src="front/image/UserSet_image/savePhoto1.png"/>
                        <input class="closeBtn" type="image" src="front/image/UserSet_image/closebtn1.png" onclick="compileAndClose('.friendCircle','.friendCircle1',2,0)"/>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</body>
</html>
