function messListClick(id){
	for(var i=1;i<=4;i++){
		$(".mess_list"+i).css('background','url(../image/messagebox_image/icon_dot.png) no-repeat center left');
		$("#right"+i).hide();	
	}
	$(".mess_list"+id).css('background','url(../image/messagebox_image/icon_choose.png) no-repeat center left');
	$("#right"+id).show();	
}

function linkListClick(id){
	console.info($(".linkMan"+id).is(":hidden"));
	if($(".linkMan"+id).is(":hidden")){
		for(var i=0;i<=4;i++){
			$(".linkList"+i).css("background","url(../image/messagebox_image/icon_right.png) no-repeat center left");
			$(".linkMan"+i).hide();	
		}
		$(".linkList"+id).css("background","url(../image/messagebox_image/icon_bottom.png) no-repeat center left");	
		$(".linkMan"+id).show();	
	}else if($(".linkMan"+id).is(":visible")){
		for(var i=0;i<=4;i++){
			$(".linkList"+i).css("background","url(../image/messagebox_image/icon_right.png) no-repeat center left");
			$(".linkMan"+i).hide();	
		}
		$(".linkList"+id).css("background","url(../image/messagebox_image/icon_right.png) no-repeat center left");
		$(".linkMan"+id).hide();	
	}
}
