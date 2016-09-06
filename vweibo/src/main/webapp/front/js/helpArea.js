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

function listOver(listId){
	$('.question_list'+listId).css('background','#fff');	
	$('.question_list'+listId).css('border-bottom','2px solid #3cf');
	$('.question_list'+listId).css('border-right','1px solid #fff');	
	$('.question_list'+listId).css('height','30px');	
	$('.span'+listId).hide();
	$('.list_detail'+listId).show();
}
function listOut(listId){
	$('.question_list'+listId).css('background','#f5f5f5');	
	$('.question_list'+listId).css('border-bottom','1px solid #ccc');	
	$('.question_list'+listId).css('border-right','1px solid #ccc');
	$('.question_list'+listId).css('height','31px');
	$('.span'+listId).show();
	$('.list_detail'+listId).hide();
}

function ques_list_click(listId){
	for(var i=1;i<=7;i++){
		$('.content'+i).hide();	
	}	
	$('.content'+listId).show();
}