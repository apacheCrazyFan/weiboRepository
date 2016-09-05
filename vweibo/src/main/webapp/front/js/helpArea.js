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
	$('.question_list'+listId).css('border-right','1px solid #fff');
	$('.question_list'+listId).css('border-top','2px solid #3cf');
	$('.question_list'+listId).css('border-left','1px solid #3cf');
	$('.question_list'+listId).css('border-bottom','2px solid #3cf');
	$('.question_list'+listId).css('color','#000');
	$('.question_list'+listId).css('height','30px');
	$('.question_list'+listId).css('width','165px');
	$('.list_detail'+listId).show();
}
function listOut(listId){
	$('.question_list'+listId).css('background','#f5f5f5');
	$('.question_list'+listId).css('border-right','1px solid #ccc');
	$('.question_list'+listId).css('border-top','3px solid #f5f5f5');
	$('.question_list'+listId).css('border-left','2px solid #f5f5f5');
	$('.question_list'+listId).css('border-bottom','1px solid #ccc');
	$('.question_list'+listId).css('color','#000');
	$('.question_list'+listId).css('height','30px');
	$('.question_list'+listId).css('width','163px');
	$('.list_detail'+listId).hide();
}