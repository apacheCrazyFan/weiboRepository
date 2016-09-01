<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<base href="/vweibo/">
<title>无标题文档</title>
<link rel="stylesheet" href="front/css/UserSet_prefer.css">
<script src="front/js/jquery-1.11.1.min.js"></script>
<script src="front/UserSet_prefer.min.js"></script>

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
                <li class="message"><img src="front/image/UserSet_image/icon4_1.png"><a href="front/page/UserSet_message.jsp">消息设置</a></li>
                <li class="prefer"><img src="front/image/UserSet_image/icon5_2.png"><a href="front/page/UserSet_prefer.jsp">偏好设置</a></li>
                <li class="line3"></li>
            </ul>
        </div>
        <div id="right">
        	<ul>
            	<span class="head_label">偏好设置<a href="#">预览我的主页</a></span>
                <li class="emailAttention">邮件提醒设置<span class="span1">****</span><a href="javascript: compileAndClose('.emailAttention','.emailAttention1',1,1);">编辑</a></li>
                <li style="display:none;background:#fff;height:145px" class="emailAttention1">邮件提醒设置<a href="javascript: compileAndClose('.emailAttention','.emailAttention1',2,0);">收起</a><br/>
                    <div>
                    	<input class="emailAtt1" type="checkbox" name="emailAtt" value="emailAtt1"/><span class="emailAttW1">接收微博官方推送的离线消息提醒邮件</span><br/>
                        <input class="emailAtt2" type="checkbox" name="emailAtt" value="emailAtt2"/><span class="emailAttW2">接收微博官方推送的精彩热点内容邮件</span><br/>
                        <input class="emailAttBtn" type="image" src="front/image/UserSet_image/savePhoto1.png"/>
                        <input class="closeBtn" type="image" src="front/image/UserSet_image/closebtn1.png"/>
                    
                    </div>
                </li>
                
                <li class="watermakerSet">图片水印设置<span class="span1">****</span><a href="javascript: compileAndClose('.watermakerSet','.watermakerSet1',1,2);">编辑</a></li>
                <li style="display:none;background:#fff;height:280px" class="watermakerSet1">图片水印设置<a href="javascript: compileAndClose('.watermakerSet','.watermakerSet1',2,0);">收起</a><br/>
                    <div>
                        <div class="water_left">
                        	<span class="waterSet_span1">设置在图片微博中增加独具个性的微博水印</span><br/>
                            <span class="waterSet_span2">水印内容</span><br/>
                            <input class="waterWeiName" type="checkbox" name="waterContent" value="waterWeiName"/><span class="waterWeiNameW">微博昵称</span><br/>
                            <input class="waterWeiLogo" type="checkbox" name="waterContent" value="waterWeiLogo"/><span class="waterWeiLogoW">微博图标</span><br/>
                            <input class="waterWeiAddr" type="checkbox" name="waterContent" value="waterWeiAddr"/><span class="waterWeiAddrW">微博地址</span><br/>
                            <span class="waterSet_span3">水印位置</span><br/>
                            <input class="bottomRight" type="radio" name="waterLocation" value="bottomRight"/><span class="bottomRightW">底部居右</span>
                            <input class="bottomCenter" type="radio" name="waterLocation" value="bottomCenter"/><span class="bottomCenterW">底部居中</span>
                            <input class="centerCenter" type="radio" name="waterLocation" value="centerCenter"/><span class="centerCenterW">图片中心</span><br/>
                            <input class="waterBtn" type="image" src="front/image/UserSet_image/savePhoto1.png"/>
                        	<input class="closeBtn1" type="image" src="front/image/UserSet_image/closebtn1.png"/>
                        </div>
                        <div class="water_right" style="height:220px;width:300px">
                        	<span class="waterSet_span4">预览</span>
                        	<div class="waterView"><img src="front/image/UserSet_image/test_pic.jpg"></div>
                        </div>
                    </div>
                </li>
                
                
                <li class="medalSet">勋章设置&nbsp;&nbsp;&nbsp;&nbsp;<span class="span1">****</span><a href="javascript: compileAndClose('.medalSet','.medalSet1',1,3);">编辑</a></li>
                <li style="display:none;background:#fff;height:180px" class="medalSet1">勋章设置<a href="javascript: compileAndClose('.medalSet','.medalSet1',2,0);">收起</a><br/>
                    <div>
                    	<span class="medal_span1">设置是否在个人主页封面右下角显示勋章图标</span><br/>
                        <input class="showMedal" type="radio" name="isShowMedal" value="showMedal"/><span class="showMedalW">显示</span><br/>
                        <input class="noShowMedal" type="radio" name="isShowMedal" value="noShowMedal"/><span class="noShowMedalW">不现实</span><br/>
                        <input class="medalBtn" type="image" src="front/image/UserSet_image/savePhoto1.png"/>
                        <input class="closeBtn2" type="image" src="front/image/UserSet_image/closebtn1.png"/>
                    </div>
                </li>
                
                <li class="languageSet">语言设置&nbsp;&nbsp;&nbsp;&nbsp;<span class="span1">****</span><a href="javascript: compileAndClose('.languageSet','.languageSet1',1,4);">编辑</a></li>
                <li style="display:none;background:#fff;height:240px" class="languageSet1">语言设置<a href="javascript: compileAndClose('.languageSet','.languageSet1',2,0);">收起</a><br/>
                    <div>
                   		<span class="language_span1">设置是否在个人主页封面右下角显示勋章图标</span><br/>                        
                        <input class="simpChinese" type="radio" name="langSet" value="simpChinese"/><span class="simpChineseW">中文(简体)</span><br/>
                        <input class="taiWChinese" type="radio" name="langSet" value="taiWChinese"/><span class="taiWChineseW">中文(台湾)</span><br/>
                        <input class="hongChinese" type="radio" name="langSet" value="hongChinese"/><span class="hongChineseW">中文(香港)</span><br/>
                        <input class="english" type="radio" name="langSet" value="english"/><span class="englishW">English</span><br/>
                        <input class="langBtn" type="image" src="front/image/UserSet_image/savePhoto1.png"/>
                        <input class="closeBtn3" type="image" src="front/image/UserSet_image/closebtn1.png"/>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</body>
</html>
