<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>发现-热门微博</title>
<link rel="shortcut icon" href="../image/title_logo.png">
<link rel="stylesheet" href="../css/helpArea.css">
<script src="../js/jquery-1.11.1.min.js"></script>
<script src="../js/helpArea.js"></script>
</head>

<body>
	<div id="header">
    	<img class="head_logo" src="../image/found_image/head_logo_sh_mini.png"/>
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
    	<img class="logo1" src="../image/helpArea_image/logoArea_logo.png">
        <img class="logo2" src="../image/helpArea_image/logoArea_logo1.png">
    </div>
    <div id="wrap">
    	<div id="wrap1">
        	<div id="left">
            	<div class="left_head">
                	<span class="left_headW">问题分类</span>
                </div>
                <ul>
                	<li class="question_list1" onMouseOver="listOver(1)" onMouseOut="listOut(1)">@享悦使用<span class="span1"> > </span>
                    	<span class="list_detail1">
                        	<a href="javascript:ques_list_click(1)" class="ques_list1">注册享悦</a>
                            <a href="javascript:ques_list_click(2)" class="ques_list2">访问</a>
                            <a href="javascript:ques_list_click(3)" class="ques_list3">享悦收藏</a>
                        </span>
                    </li>
                    <li class="question_list2" onMouseOver="listOver(2)" onMouseOut="listOut(2)">@账号异常<span class="span2"> > </span>
                    	<span class="list_detail2">
                        	<a href="javascript:ques_list_click(4)" class="ques_list4">关于密码</a>
                        </span>
                    </li>
                    <li class="question_list3" onMouseOver="listOver(3)" onMouseOut="listOut(3)">@享悦会员<span class="span3"> > </span>
                    	<span class="list_detail3">
                        	<a href="javascript:ques_list_click(5)" class="ques_list5">开通会员</a>
                        </span>
                    </li>
                    <li class="question_list4" onMouseOver="listOver(4)" onMouseOut="listOut(4)">@推荐发现<span class="span4"> > </span>
                    	<span class="list_detail4">
                        	<a href="javascript:ques_list_click(6)" class="ques_list6">微话题</a>
                            <a href="javascript:ques_list_click(7)" class="ques_list7">热门微博</a>
                        </span>
                    </li>
                </ul>
            </div>
            <div id="right">
                <div class="content1">
                	<a>如何注册享悦账号？</a>
                    <div>
                    	<p>输入常用邮箱地址，设置密码、昵称，填写相应个人资料即可。注册享悦后需要激活操作：用户可以点击顶部黄签的“立即激活”进入注册邮箱，点击邮箱中的激活链接即可，如果未收到激活链接或链接已过期，可点击“重新发送确认邮件”获取链接进行激活，超过30天未激活邮箱的用户无法正常使用享悦。</p>
                    </div>
                    <a>为什么在注册账号时，要填写验证码？</a>
                    <div>
                    	<p>为了给广大网友提供一个绿色的享悦使用环境，注册输入验证码可以防止用户恶意注册同时也可以防止部分用户刷粉影响正常用户使用享悦的行为。只需要在注册的时候填写验证码即可。</p>
                    </div>
                </div>
                
                <div class="content2">
                	<a>享悦是否能看到访客记录？</a>
                    <div>
                    	<p>享悦没有看到访客记录的功能，所以您无法查看哪些用户访问过您的享悦，同样，您访问他人的享悦页面时对方也不会知晓。</p>
                    </div>
                </div>
                
               	<div class="content3">
                	<a>为什么要收藏享悦？</a>
                    <div>
                    	<p>享悦更新快，看到喜欢的内容收藏起来，方便您日后继续查看。</p>
                    </div>
                    <a>收藏是否有上限？</a>
                    <div>
                    	<p>享悦收藏目前没有上限，您可以放心将您喜欢的享悦内容进行收藏。每条享悦下都有“收藏”按钮，点击即可收藏此条享悦。</p>
                    </div>
                </div>
                
                <div class="content4">
                	<a>忘记密码怎么办？</a>
                    <div>
                    	<p>密码密码密码密码密码密码密码密码密码密码密码密码密码密码密码。</p>
                    </div>
                    <a>怎样的密码更安全？</a>
                    <div>
                    	<p>
                            以下为相对比较安全的创建密码的方法:<br/><br/>
                            1、由字母、数字、符号组合而成（至少两种组合，例如：5685dghr）；<br/>
                            2、长度在10位以上；<br/>
                            3、尽量不要有规律（123456、111111这类密码是非常不安全的）；<br/>
                            4、尽量不使用自己姓名、生日、电话、手机号等比较公开的信息作为密码；<br/>
                            5、密码不要与登录名一样或包含登录名中的内容。
						</p>
                    </div>
                </div>
                
                <div class="content5">
                	<a>如何成为享悦会员？</a>
                    <div>
                    	<p>您在享悦每发一条动态，转发一条内容，点赞或者评论等，都会增加您的活跃度，每满10*(x+1)个活跃度升一级皇冠，等到第Y级皇冠后将成为享悦会员。</p>
                    </div>
                    <a>会员有哪些特权？</a>
                    <div>
                    	<p>享悦会员的特权有...</p>
                    </div>
                </div>
                
                <div class="content6">
                	<a>什么是微话题？</a>
                    <div>
                    	<p>微话题是根据近期热点等多种渠道，经过编辑补充内容和 制作的与该话题有关的专题页面。用户可以进入该页面发表享悦进行讨论，同时微话题页面也会自动收录还有该话题的相关享悦内容。</p>
                    </div>
                    <a>如何发布微话题？</a>
                    <div>
                    	<p>在享悦中发布#话题词#，生成一条包含该话题词的享悦内容，点击带有超链接的#话题词#，即可进入该话题词的话题页面，此话题就已发布成功。</p>
                    </div>
                </div>
                <div class="content7">
                	<a>从哪里可以进入热门热门微博？</a>
                    <div>
                    	<p>点击微博首页上方的发现 ，进入后即可看到热门微博。</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="footer"></div>
</body>
</html>
