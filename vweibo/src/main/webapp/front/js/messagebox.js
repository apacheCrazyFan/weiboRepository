function searchClick(){
	$('.searchTextBorder').css('border-color','red');	
	$('.searchTextBorder').css('background','#fff');
	$('.searchText').css('background','#fff');
}
function searchBlur(){
	$('.searchTextBorder').css('border-color','#999');	
	$('.searchTextBorder').css('background','#f2f2f2');
	$('.searchText').css('background','#f2f2f2');
}
function messListClick(messId){
	for(var i=1;i<=4;i++){
		$(".mess_list"+i).css('background','url(../image/messagebox_image/icon_dot.png) no-repeat center left');
		$("#right"+i).hide();	
	}
	$(".mess_list"+messId).css('background','url(../image/messagebox_image/icon_choose.png) no-repeat center left');
	$("#right"+messId).show();	
}

function linkListClick(messId){
	console.info($(".linkMan"+messId).is(":hidden"));
	if($(".linkMan"+messId).is(":hidden")){
		for(var i=0;i<=4;i++){
			$(".linkList"+i).css("background","url(../image/messagebox_image/icon_right.png) no-repeat center left");
			$(".linkMan"+i).hide();	
		}
		$(".linkList"+messId).css("background","url(../image/messagebox_image/icon_bottom.png) no-repeat center left");	
		$(".linkMan"+messId).show();	
	}else if($(".linkMan"+messId).is(":visible")){
		for(var i=0;i<=4;i++){
			$(".linkList"+i).css("background","url(../image/messagebox_image/icon_right.png) no-repeat center left");
			$(".linkMan"+i).hide();	
		}
		$(".linkList"+messId).css("background","url(../image/messagebox_image/icon_right.png) no-repeat center left");
		$(".linkMan"+messId).hide();	
	}
}


function startChat(){
	$('.center0').hide();
	$('.center2').show();	
	for(var i=1;i<=2;i++){
		var w=$('.meC'+i).width();	
		var left=490-w;
		$('.meC'+i).css("margin-left",left+"px");
	}
}

function returnChatList(){
	$('.center0').show();
	$('.center2').hide();	
}
function showLittleWin(winId){
	$(winId).show();
}
function closeWindow(winId){
	$(winId).hide();	
}