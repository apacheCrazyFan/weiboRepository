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


function hotMenuChange(menuId){
	for(var i=0;i<=2;i++){
		$('.hot_menu_'+i).css("border-bottom","2px solid #fff");	
	}	
	$('.hot_menu_'+menuId).css("border-bottom","2px solid #F7691D");
	if(menuId==2){
		$('.hot_content_list').show();
	}else{
		$('.hot_content_list').hide();
	}	
}

function topicMenuChange(menuId){
	for(var i=1;i<=2;i++){
		$('.topic_time_'+i).css("border-bottom","2px solid #999");	
	}
	$('.topic_time_'+menuId).css("border-bottom","2px solid #F7691D");	
}

function findMenuChange(menuId){
	for(var i=0;i<=3;i++){
		$('.find_menu_'+i).css("border-bottom","1px solid #fff");
	}	
	$('.find_menu_'+menuId).css("border-bottom","2px solid #F7691D");
	if(menuId==3){
		$('.find_menu_list').show();
	}else{
		$('.find_menu_list').hide();
	}	
	
}

function videoMenuChange(menuId){
	for(var i=0;i<=6;i++){
		$('.video_menu_'+i).css("border-bottom","1px solid #fff");
	}	
	$('.video_menu_'+menuId).css("border-bottom","2px solid #F7691D");
}
