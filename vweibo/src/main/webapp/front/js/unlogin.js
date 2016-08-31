// JavaScript Document
$(document).ready(function(){  
var range = 50;             //距下边界长度/单位px  
var elemt = 500;           //插入元素高度/单位px  
var maxnum = 5;            //设置加载最多次数  
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
 
function changecentercolor(id){
	document.getElementById(id).innerHTML='<img src="image/conter-part_wayimg02.png"/>';
}

function changecentercolors(id){
	document.getElementById(id).innerHTML='<img src="image/conter-part_wayimg01.png"/>';
}

function showcenterhidediv(id){
var sbtitle=document.getElementById(id);
//alert(sbtitle.style.display);
if(sbtitle){
   if(sbtitle.style.display=='block'){
   sbtitle.style.display='none';
   }else{
   sbtitle.style.display='block';
   }
}
}

function hidecenterdiv(id){
	document.getElementById(id).style.display='none';
	}
