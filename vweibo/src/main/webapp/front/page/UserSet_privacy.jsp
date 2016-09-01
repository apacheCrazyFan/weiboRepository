<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<link rel="stylesheet" href="../css/UserSet_privacy.css">
<script src="../js/jquery-1.11.1.min.js"></script>
<script src="../js/UserSet_privacy.js"></script>

</head>

<body>
	<div id="wrap">
    	<div id="left">
        	<span class="idSet">账号设置</span>
            <ul>
            	<li class="line1"></li>
                <li class="myInfo"><img src="../image/UserSet_image/icon1_1.png"><a href="UserSet.jsp">我的信息</a></li>
                <li class="photo"><img src="../image/UserSet_image/icon2_1.png"><a href="UserSet_photo.jsp">头像</a></li>
                <li class="line2"></li>
                <li class="privacy"><img src="../image/UserSet_image/icon3_2.png"><a href="UserSet_privacy.jsp">隐私设置</a></li>
                <li class="message"><img src="../image/UserSet_image/icon4_1.png"><a href="UserSet_message.jsp">消息设置</a></li>
                <li class="prefer"><img src="../image/UserSet_image/icon5_1.png"><a href="../image/UserSet_image/UserSet_../image/UserSet_image/.jsp">偏好设置</a></li>
                <li class="line3"></li>
            </ul>
        </div>
        <div id="right">
        	<ul>
            	<span class="head_label">隐私设置<a href="#">预览我的主页</a></span>
                <li class="howToFindMe">何种方式找到我&nbsp;&nbsp;&nbsp;&nbsp;<span class="span1">****</span><a href="javascript: compileAndClose('.howToFindMe','.howToFindMe1',1,1);">编辑</a></li>
                <li style="display:none;background:#fff;height:140px" class="howToFindMe1">何种方式找到我<a href="javascript: compileAndClose('.howToFindMe','.howToFindMe1',2,0);">收起</a><br/>
                    <div>
                    	<input class="findMeByEmail" type="checkbox" name="findMe" value="byEmail"/><span class="findMeByEmailW">电子邮件</span><br/>
                        <input class="findMeByNumber" type="checkbox" name="findMe" value="byNumber"/><span class="findMeByNumberW">手机号码</span><br/>
                        <input class="saveFindMe" type="image" src="../image/UserSet_image/savePhoto1.png"/>
                        <input class="closeComplie" type="image" src="../image/UserSet_image/closebtn1.png" />
                    </div>
                </li>
                
                <li class="whetherRecoFriend">是否推荐通讯录好友<span class="span1">****</span><a href="javascript: compileAndClose('.whetherRecoFriend','.whetherRecoFriend1',1,2);">编辑</a></li>
                <li style="display:none;background:#fff;height:155px" class="whetherRecoFriend1">是否推荐通讯录好友<a href="javascript: compileAndClose('.whetherRecoFriend','.whetherRecoFriend1',2,0);">收起</a><br/>
                    <div>
                        <span class="spanFriend">是否接受微博给我推荐手机通讯录中的好友</span><br/>
                        <input class="yesToReco" type="radio" name="whetherReco" value="yesReco"/><span class="yesToRecoW">是</span><br/>
                        <input class="noToReco" type="radio" name="whetherReco" value="noReco"/><span class="noToRecoW">否</span><br/>
                        <input class="saveReco" type="image" src="../image/UserSet_image/savePhoto1.png"/>
                        <input class="closeComplie" type="image" src="../image/UserSet_image/closebtn1.png" />
                    </div>
                </li>
                
                
                <li class="myLocation">我的位置&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="span1">****</span><a href="javascript: compileAndClose('.myLocation','.myLocation1',1,3);">编辑</a></li>
                <li style="display:none;background:#fff;height:155px" class="myLocation1">我的位置<a href="javascript: compileAndClose('.myLocation','.myLocation1',2,0);">收起</a><br/>
                    <div>
                    	<span class="spanLocation">是否允许微博保存并显示你所处的地理位置信息，包括所有的第三方工具，客户端</span><br/>
                        <input class="yesToLoca" type="radio" name="seeLoca" value="yesLoca"/><span class="yesToLocaW">可见</span><br/>
                        <input class="noToLoca" type="radio" name="noSeeloca" value="noLoca"/><span class="noToLocaW">不可见</span><br/>
                        <input class="saveLoca" type="image" src="../image/UserSet_image/savePhoto1.png"/>
                        <input class="closeComplie" type="image" src="../image/UserSet_image/closebtn1.png" />
                    </div>
                </li>
                
                <li class="blacklist">黑名单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="span1">****</span><a href="javascript: compileAndClose('.blacklist','.blacklist1',1,4);">编辑</a></li>
                <li style="display:none;background:#fff;height:337px" class="blacklist1">黑名单<a href="javascript: compileAndClose('.blacklist','.blacklist1',2,0);">收起</a><br/>
                    <div>
                        <span class="spanBlacklist">被加入黑名单的用户将无法关注你、评论你。如果你已经关注他，也会自动解除关系。</span>
                        <span class="howToAddBlack">如何加入黑名单？</span>
                        <span class="addBlack1">1)鼠标点击“更多”菜单，点击“加入黑名单”；</span>
                        <span class="addBlack2">2)确认加入黑名单。</span>
                        <img src="../image/UserSet_image/privacy_blacklist.jpg" class="pic_blacklist"/>
                    </div>
                </li>
                
                <li class="shieldPriLetter">屏蔽私信&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="span1">****</span><a href="javascript: compileAndClose('.shieldPriLetter','.shieldPriLetter1',1,5);">编辑</a></li>
                <li style="display:none;background:#fff;height:337px" class="shieldPriLetter1">屏蔽私信<a href="javascript: compileAndClose('.shieldPriLetter','.shieldPriLetter1',2,0);">收起</a><br/>
                    <div>
                        <span class="spanPriLetter">你可以屏蔽某些用户发来的私信，被屏蔽后，他们发来的私信不会进入私信箱。</span>
                        <span class="howToPriLetter">如何屏蔽私信？</span>
                        <span class="addPriLetter1">1)鼠标点击消息右侧“下拉图标”，点击“屏蔽私信”；</span>
                        <span class="addPriLetter2">2)确认屏蔽私信。</span>
                        <img src="../image/UserSet_image/privacy_shieldPriLetter.jpg" class="pic_priLetter"/>
                    </div>
                </li>
                
                <li class="shieldGroupWeibo">屏蔽群微博&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="span1">****</span><a href="javascript: compileAndClose('.shieldGroupWeibo','.shieldGroupWeibo1',1,6);">编辑</a></li>
                <li style="display:none;background:#fff;height:337px" class="shieldGroupWeibo1">屏蔽群微博<a href="javascript: compileAndClose('.shieldGroupWeibo','.shieldGroupWeibo1',2,0);">收起</a><br/>
                    <div>
                        <span class="spanGroup">你可以解除屏蔽已加入群组的群微博。点击“解除屏蔽”即可恢复接收该群组发来的群微博。</span>
                        <span class="howToGroup">如何屏蔽群微博？</span>
                        <span class="addGroup1">1)鼠标点击“下拉图标”弹出层屏蔽菜单，点击“屏蔽来自XX的微博”；</span>
                        <span class="addGroup2">2)确认屏蔽来自该群的微博。</span>
                        <img src="../image/UserSet_image/privacy_shieldGroupWeibo.jpg" class="pic_Group"/>
                    </div>
                </li>
                
                <li class="shieldUserId">屏蔽账号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="span1">****</span><a href="javascript: compileAndClose('.shieldUserId','.shieldUserId1',1,7);">编辑</a></li>
                <li style="display:none;background:#fff;height:360px" class="shieldUserId1">屏蔽账号<a href="javascript: compileAndClose('.shieldUserId','.shieldUserId1',2,0);">收起</a><br/>
                    <div>
                        <span class="spanId">你可以将自己关注的帐号加入屏蔽名单。屏蔽后，系统将在你的首页自动屏蔽对方的新微博。点击"解除"即可恢复接收。
<br/><br/>温馨提示：本功能仅会员可用，如果长期使用，请开通微博会员。</span>
                        <span class="howToId">如何屏蔽帐号？</span>
                        <span class="addId1">1)鼠标点击“下拉图标”弹出层屏蔽菜单，点击“屏蔽XX的微博”；</span>
                        <span class="addId2">2)确认屏蔽帐号。</span>
                        <img src="../image/UserSet_image/privacy_shieldUserId.jpg" class="pic_Id"/>
                    </div>
                </li>
                
                <li class="shieldKeyword">屏蔽关键词&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="span1">****</span><a href="javascript: compileAndClose('.shieldKeyword','.shieldKeyword1',1,8);">编辑</a></li>
                <li style="display:none;background:#fff;height:360px" class="shieldKeyword1">屏蔽关键词<a href="javascript: compileAndClose('.shieldKeyword','.shieldKeyword1',2,0);">收起</a><br/>
                    <div>
                        <span class="spanKeyword">你可以将自己关注的帐号加入屏蔽名单。屏蔽后，系统将在你的首页自动屏蔽对方的新微博。点击"解除"即可恢复接收。
<br/><br/>温馨提示：本功能仅会员可用，如果长期使用，请开通微博会员。</span>
                        <span class="howToKeyword">如何屏蔽帐号？</span>
                        <span class="addKeyword1">1)鼠标点击“下拉图标”弹出层屏蔽菜单，点击“屏蔽XX的微博”；</span>
                        <span class="addKeyword2">2)确认屏蔽帐号。</span>
                        <img src="../image/UserSet_image/privacy_shieldKeyword.jpg" class="pic_Keyword"/>
                    </div>
                </li>
                
                <li class="shieldSource">屏蔽来源&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="span1">****</span><a href="javascript: compileAndClose('.shieldSource','.shieldSource1',1,9);">编辑</a></li>
                <li style="display:none;background:#fff;height:400px" class="shieldSource1">屏蔽来源<a href="javascript: compileAndClose('.shieldSource','.shieldSource1',2,0);">收起</a><br/>
                   <div>
                   		<span class="whatIsSource" onMouseOver="whatIsSource()" onMouseOut="closeWhatIsSource()">什么是来源？<img src="../image/UserSet_image/icon_sourceQ.jpg"></span><br/>
                        <div class="pic_whatIsSource"><img src="../image/UserSet_image/whatIsSource.jpg"></div>
                        <span class="spanSource">你可以屏蔽来自第三方应用或游戏的微博。例如屏蔽来自微城市的微博。<br/> 
						屏蔽后，系统将在你的首页自动屏蔽来自该来源的新微博。
						<br/><br/>温馨提示：本功能仅会员可用，请开通微博会员后使用。</span>
                        <span class="howToSource">如何屏蔽来源？</span>
                        <span class="addSource1">1)鼠标点击"下拉图标"弹出层屏蔽菜单，点击"屏蔽XX的微博"；</span>
                        <span class="addSource2">2)确认屏蔽来源。</span>
                        <img src="../image/UserSet_image/privacy_shieldSource.jpg" class="pic_Source"/>
                    </div>
                </li>
                
                <li class="shieldWeibo">屏蔽微博&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="span1">****</span><a href="javascript: compileAndClose('.shieldWeibo','.shieldWeibo1',1,10);">编辑</a></li>
                <li style="display:none;background:#fff;height:380px" class="shieldWeibo1">屏蔽微博<a href="javascript: compileAndClose('.shieldWeibo','.shieldWeibo1',2,0);">收起</a><br/>
                    <div>
                        <span class="spanWeibo">如果信息流中的某条微博打扰了您，您可以对该条微博进行屏蔽操作。 
						<br/><br/>屏蔽后，该条微博将在您的首页消失。温馨提示：该功能为会员功能，如果使用本功能，请您开通微博会员。</span>
                        <span class="howToWeibo">如何屏蔽微博？</span>
                        <span class="addWeibo1">1)鼠标点击“下拉图标”弹出层屏蔽菜单，点击“屏蔽这条微博”；</span>
                        <span class="addWeibo2">2)确认屏蔽该条微博。</span>
                        <img src="../image/UserSet_image/privacy_shieldWeibo.jpg" class="pic_Weibo"/>
                    </div>
                </li>
                
               
            </ul>
        </div>
    </div>
</body>
</html>
