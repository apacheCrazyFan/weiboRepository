
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


function startChat(nameId){
	$('.center0').hide();
	$('.center2').show();	
	for(var i=1;i<=2;i++){
		var w=$('.meC'+i).width();	
		var left=490-w;
		$('.meC'+i).css("margin-left",left+"px");
		$.ajax({
			url:"../../../../vweibo/message/getTalkNameFromFuedid",
			type:"POST",
			data:{"fuedid":nameId},
			dataType:"JSON",
			success: function(data){
				alert(data);
			}
		});
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

$(function(){
	var n = 0;
	$.ajax({
		url:"../../../../vweibo/message/getFstatusByFuid",
		type:"POST",
		data:{"fuid":1001},
		dataType:"JSON",
		success: function(data){
			var groupName="";
			//var group=new Array();
			for(var i=0;i<data.length;i++){
				groupName+='<li class="linkList'+(i+1)+'"><a href="javascript:linkListClick('+(i+1)+')">'+data[i].fstatus+'（'+data[i].count+'）</a></li> <div class="linkMan'+(i+1)+'"></div>';
				$.ajax({
					url:"../../../../vweibo/message/getFuedidByFstatus",
					type:"POST",
					data:{"fuid":1001,"fstatus":data[i].fstatus},
					dataType:"JSON",
					success: function(datas){
						n ++;
						var g = "";
						for(var j=0;j<datas.length;j++){
							g+=' <a href="javascript:startChat('+datas[j].fuedid+')">'+datas[j].uname+'</a>';
						}
						$(".linkMan"+n).html(g);
					}
				});
			}
			$(".linkmanList").html(groupName);
		},
		error:function (data) {
			alert("error:"+data); 
		}
		
	});
});