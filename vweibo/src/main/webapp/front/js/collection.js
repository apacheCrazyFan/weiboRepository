// JavaScript Document

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


function showcenterhidediv(id){
	var sbtitle=document.getElementById(id);
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

function changecentercolor(id){
	document.getElementById(id).innerHTML='<img src="front/image/conter-part_wayimg02.png"/>';
}

function changecentercolors(id){
	document.getElementById(id).innerHTML='<img src="front/image/conter-part_wayimg01.png"/>';
}

//控制添加标签栏的可见
function addlabel(id){
	var tips=document.getElementById(id);
	if(tips){
		if(tips.style.display=='block'){
			tips.style.display='none';
		}else{
			tips.style.display='block';
		}
	}
}

//取消键关闭添加标签
function disapper(id){
	var cancelbtn=document.getElementById(id);
	if(cancelbtn){
		if(cancelbtn.style.display=='block'){
			cancelbtn.style.display='none';
		}else{
			cancelbtn.style.display='block';
		}
	}
}