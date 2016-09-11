//JavaScript Document

$(document).ready(function(){  
	var range = 50;             //距下边界长度/单位px  
	var elemt = 500;           //插入元素高度/单位px  
	var maxnum = 3;            //设置加载最多次数  
	var num = 1;  
	var totalheight = 0; 
	for(var i=0;i<4;i++){
		$("#center-part").append('<div id="center-part-content"></div>');  
	}  
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



//图片放大镜

