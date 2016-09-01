// JavaScript Document

//改变导航栏的图片颜色
function changeheaderimg1(id){
	document.getElementById(id).innerHTML='<img src="front/image/index2.png"/>';
	}
function changeheaderimgs1(id){
	document.getElementById(id).innerHTML='<img src="front/image/index.png"/>'
	}
	
function changeheaderimg2(id){
	document.getElementById(id).innerHTML='<img src="front/image/found2.png"/>';
	}
function changeheaderimgs2(id){
	document.getElementById(id).innerHTML='<img src="front/image/found.png"/>'
	}

function changeheaderimg3(id){
	document.getElementById(id).innerHTML='<img src="front/image/game2.png"/>';
	}
function changeheaderimgs3(id){
	document.getElementById(id).innerHTML='<img src="front/image/game.png"/>'
	}
	
function changeheaderimg4(id){
	document.getElementById(id).innerHTML='<img src="front/image/people2.png"/><span id="username1" style="color:red">王大大大啊aa</span>';
	}
function changeheaderimgs4(id){
	document.getElementById(id).innerHTML='<img src="front/image/people.png"/><span id="username1">王大大大啊aa</span>'
	}
function changeheaderimg5(id){
	document.getElementById(id).innerHTML='<img src="front/image/chat2.png"/>';
	}
function changeheaderimgs5(id){
	document.getElementById(id).innerHTML='<img src="front/image/chat.png"/>'
	}
function changeheaderimg6(id){
	document.getElementById(id).innerHTML='<img src="front/image/set2.png"/>';
	}
function changeheaderimgs6(id){
	document.getElementById(id).innerHTML='<img src="front/image/set.png"/>'
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