// JavaScript Document
$(document).ready(function(){  
var range = 50;             //距下边界长度/单位px  
var elemt = 500;           //插入元素高度/单位px  
var maxnum = 50;            //设置加载最多次数  
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

function clickunlogin(id1,id2){
	$("#"+id1).css("border-bottom","2px solid red");
	$("#"+id2).css("border-bottom","2px solid #eee");
}

