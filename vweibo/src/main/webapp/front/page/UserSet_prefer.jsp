<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.yc.weibo.DataDic.DataDic"%>
<%@ page import="javax.servlet.ServletContext" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<base href="/vweibo/">
<title>个人设置</title>
<link rel="stylesheet" href="front/css/UserSet_prefer.css">
<script src="front/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript"src="front/js/UserSet_prefer.js"></script>
<script type="text/javascript" src="front/js/jquery.localize.js"></script>

</head>
<body>
	<input type="hidden" value="${sessionScope.user.WBUid}" id="hiddenid">
	<div id="wrap">
    	<div id="left">
        	<span class="idSet" data-localize="d1" >账号设置</span>
            <ul>
            	<li class="line1"></li>
                <li class="myInfo"><img src="front/image/UserSet_image/icon1_1.png"><a data-localize="d2" href="front/page/UserSet.jsp">我的信息</a></li>
                <li class="photo"><img src="front/image/UserSet_image/icon2_1.png"><a  data-localize="d3" href="front/page/UserSet_photo.jsp">头像</a></li>
                <li class="line2"></li>
                <li class="privacy"><img src="front/image/UserSet_image/icon3_1.png"><a data-localize="d4" href="front/page/UserSet_privacy.jsp">隐私设置</a></li>
                <li class="message"><img src="front/image/UserSet_image/icon4_1.png"><a data-localize="d5" href="front/page/UserSet_message.jsp">消息设置</a></li>
                <li class="prefer"><img src="front/image/UserSet_image/icon5_2.png"><a data-localize="d6" href="front/page/UserSet_prefer.jsp">偏好设置</a></li>
                <li class="line3"></li>
            </ul>
        </div>
        <div id="right">
        	<ul>
            	<span class="head_label" data-localize="d6">偏好设置<a href="#" data-localize="d7">预览我的主页</a></span>
                <li class="emailAttention" data-localize="d8">邮件提醒设置<span class="span1">****</span><a href="javascript: compileAndClose('.emailAttention','.emailAttention1',1,1);" data-localize="d9">编辑</a></li>
                <li style="display:none;background:#fff;height:145px" class="emailAttention1" data-localize="d8">邮件提醒设置<a href="javascript: compileAndClose('.emailAttention','.emailAttention1',2,0);" data-localize="d10">收起</a><br/>
                    <div>
                    	<input class="emailAtt1" type="checkbox" name="emailAtt" value="emailAtt1"/><span class="emailAttW1" data-localize="d11">接收微博官方推送的离线消息提醒邮件</span><br/>
                        <input class="emailAtt2" type="checkbox" name="emailAtt" value="emailAtt2"/><span class="emailAttW2" data-localize="d13">接收微博官方推送的精彩热点内容邮件</span><br/>
                        <input class="emailAttBtn" type="image" src="front/image/UserSet_image/savePhoto1.png"/>
                        <input class="closeBtn" type="image" src="front/image/UserSet_image/closebtn1.png" onclick="compileAndClose('.emailAttention','.emailAttention1',2,0)"/>
                    
                    </div>
                </li>
                
                <li class="watermakerSet" data-localize="d13">图片水印设置<span class="span1">****</span><a href="javascript: compileAndClose('.watermakerSet','.watermakerSet1',1,2);" data-localize="d9">编辑</a></li>
                <li style="display:none;background:#fff;height:280px" class="watermakerSet1" data-localize="d13">图片水印设置<a href="javascript: compileAndClose('.watermakerSet','.watermakerSet1',2,0);" data-localize="d10">收起</a><br/>
                    <div>
                        <div class="water_left">
                        	<span class="waterSet_span1" data-localize="d14">设置在图片微博中增加独具个性的微博水印</span><br/>
                            <span class="waterSet_span2" data-localize="d15">水印内容</span><br/>
                            <input class="waterWeiName" type="radio" name="waterContent" value="${user.uname }"  id="waterWeiName"/><span class="waterWeiNameW" data-localize="d16">微博昵称</span><br/>
                            <input class="waterWeiLogo" type="radio" name="waterContent" value="waterWeiLogo"/><span class="waterWeiLogoW" id="waterWeiLogo" data-localize="d17">微博图标</span><br/>
                            <input class="waterWeiAddr" type="radio" name="waterContent" value="weibo.com"/><span class="waterWeiAddrW" id="waterWeiAddr" data-localize="d18">微博地址</span><br/>
                            <span class="waterSet_span3" data-localize="d1">水印位置</span><br/>
                            <input class="bottomRight" type="radio" name="waterLocation" value="bottomRight"/><span class="bottomRightW"  data-localize="d1">底部居右</span>
                            <input class="bottomCenter" type="radio" name="waterLocation" value="bottomCenter"/><span class="bottomCenterW" data-localize="d1">底部居中</span>
                            <input class="centerCenter" type="radio" name="waterLocation" value="centerCenter"/><span class="centerCenterW" data-localize="d1">图片中心</span><br/>
                            <input class="waterBtn" type="image" src="front/image/UserSet_image/savePhoto1.png" onclick="saveWaterMark()"/>
                        	<input class="closeBtn1" type="image" src="front/image/UserSet_image/closebtn1.png" onclick="compileAndClose('.watermakerSet','.watermakerSet1',2,0)"/>
                        </div>
                        <div class="water_right" style="height:220px;width:300px">
                        	<span class="waterSet_span4" data-localize="d1">预览</span>
                        	<div class="waterView"><img src="front/image/UserSet_image/test_pic.jpg" id="waterView"></div>
                        </div>
                    </div>
                    
                </li>
               
                
                <li class="medalSet" data-localize="d1">勋章设置&nbsp;&nbsp;&nbsp;&nbsp;<span class="span1">****</span><a href="javascript: compileAndClose('.medalSet','.medalSet1',1,3);" data-localize="d1">编辑</a></li>
                <li style="display:none;background:#fff;height:180px" class="medalSet1" data-localize="d1">勋章设置<a href="javascript: compileAndClose('.medalSet','.medalSet1',2,0);" data-localize="d1">收起</a><br/>
                    <div>
                    	<span class="medal_span1" data-localize="d1">设置是否在个人主页封面右下角显示勋章图标</span><br/>
                        <input class="showMedal" type="radio" name="isShowMedal" value="showMedal"/><span class="showMedalW" data-localize="d1">显示</span><br/>
                        <input class="noShowMedal" type="radio" name="isShowMedal" value="noShowMedal"/><span class="noShowMedalW" data-localize="d1">不现实</span><br/>
                        <input class="medalBtn" type="image" src="front/image/UserSet_image/savePhoto1.png"/>
                        <input class="closeBtn2" type="image" src="front/image/UserSet_image/closebtn1.png" onclick="compileAndClose('.medalSet','.medalSet1',2,0)"/>
                    </div>
                </li>
                
                <li class="languageSet" data-localize="d1">语言设置&nbsp;&nbsp;&nbsp;&nbsp;<span class="span1">****</span><a href="javascript: compileAndClose('.languageSet','.languageSet1',1,4);">编辑</a></li>
                <li style="display:none;background:#fff;height:240px" class="languageSet1" data-localize="d1">语言设置<a href="javascript: compileAndClose('.languageSet','.languageSet1',2,0);">收起</a><br/>
                    <div>
                        <!-- <input class="simpChinese" type="radio" name="langSet" value="simpChinese"/><span class="simpChineseW">中文(简体)</span><br/>
                        <input class="english" type="radio" name="langSet" value="english"/><span class="englishW">English</span><br/> -->
                       
                       <select id="ddlSomoveLanguage">
							<option value="ch">请选择语言</option>
							<option value="ch">中文</option>
							<option value="en">ENGLISH</option>
						</select>
                        <input class="langBtn" type="image" src="front/image/UserSet_image/savePhoto1.png"/>
                        <input class="closeBtn3" type="image" src="front/image/UserSet_image/closebtn1.png" onclick="compileAndClose('.languageSet','.languageSet1',2,0)"/>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <script type="text/javascript">
function saveWaterMark(){
    	var waterContent="";
    	var radio=document.getElementsByName("waterContent");
    	 for(var i=0;i<radio.length;i++){
     		  if(radio[i].checked==true){
     			 waterContent=radio[i].value;
     		    break;
     		}
    	 }
    	var waterLocation="";
    	var waterLocationRadio=document.getElementsByName("waterLocation");
    	 for(var i=0;i<waterLocationRadio.length;i++){
    		  if(waterLocationRadio[i].checked==true){
    			  waterLocation=waterLocationRadio[i].value;
    		    break;
    		}
   	 }
    	 $.post("user/addWaterMark",{"waterContent":waterContent,"waterLocation":waterLocation,"WBUid":$("#hiddenid").val()},function(data){
    		 alert(data);
    		/*  $("#waterView").attr("src","front/image/UserSet_image/test_pic1.jpg");
    			D:\Tomcat-7.0.30\webapps/weibopics/test_pic1.jpg
    		*/
    		 //var str = '<img src="../weibopics/test_pic1.jpg?" id="waterView">';
    		$("#waterView").attr("src","../weibopics/test_pic1.jpg"+'?'+Math.random());
    	 });
    	
}
		function chgLang(){
			 var language=$('#ddlSomoveLanguage option:selected') .val()
			 if(language=="ch"){
				 //$("[data-localize]").localize("userSet", { language: "ch" });
			 }else{
				 $("[data-localize]").localize("front/page/userSet", { language: "en" });
			 }
		}
		
		$(function(){
			 //$("[data-localize]").localize("application", { language: "ch" });
		})

    
    </script>
</body>
</html>
