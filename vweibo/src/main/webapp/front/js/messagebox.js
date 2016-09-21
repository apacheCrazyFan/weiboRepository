var hisid=0;
var myid=0;
var i ;
var read;
$(function(){
	var url=window.location.href;
	myid=url.substring(61);
	var n = 0;
	$.ajax({
		url:"../../../../vweibo/message/getFstatusByFuid",
		type:"POST",
		data:{"fuid":myid},
		dataType:"JSON",
		success: function(data){
			var groupName="";
			//var group=new Array();
			for(var i=0;i<data.length;i++){
				groupName+='<li class="linkList'+(i+1)+'"><a href="javascript:linkListClick('+(i+1)+')">'+data[i].fstatus+'（'+data[i].count+'）</a><span class="remind'+(i+1)+'">•</span></li> <div class="linkMan'+(i+1)+'"></div>';
				$.ajax({
					url:"../../../../vweibo/message/getFuedidByFstatus",
					type:"POST",
					data:{"fuid":myid,"fstatus":data[i].fstatus},
					dataType:"JSON",
					success: function(datas){
						n ++;
						var g = "";
						for(var j=0;j<datas.length;j++){
							g+=' <a href="javascript:startChat('+datas[j].fuedid+')">'+datas[j].uname+'<span style="color:red;font-size:18px" class="detailremind'+datas[j].fuedid+'">•</span></a>';
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
	
	read= setInterval(function() { 
			var str="";
			$.ajax({
				url:"../../../../vweibo/message/checkPMIfRead",
				type:"POST",
				data:{"pm2user":myid},
				dataType:"JSON",
				success: function(data){
					if(data!=null){
						for(var i=0;i<data.length;i++)
						$('.detailremind'+data[i].pm1user).show();
					}
				}
			});
		},1000);
});
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
	clearInterval(i);
	var length=0;
	$('.center0').hide();
	$('.center2').show();	
	i= setInterval(function() { 
		var str="";
		$.ajax({
			url:"../../../../vweibo/message/getMessageByPMUser",
			type:"POST",
			data:{"pm1user":myid,"pm2user":nameId},
			dataType:"JSON",
			success: function(data){
				for(var i=0;i<data.length;i++){
					length=data.length;
					if(data[i].pm1user==myid){
						str+='<div class="meSpeak"><img src="../image/messagebox_image/head_image.png"/><span class="meC'+i+'">'+data[i].pmcontent+'</span></div>';
						$('.chatContent').html(str);
					}else if(data[i].pm1user==nameId){
						str+='<div class="heSpeak"><img src="../image/messagebox_image/head_image.png"/><span>'+data[i].pmcontent+'</span></div>';
						$('.chatContent').html(str);
					}
				}
				for(var i=0;i<=length;i++){
					var w=$('.meC'+i).width();	
					var left=490-w;
					$('.meC'+i).css("margin-left",left+"px");
					$.ajax({
						url:"../../../../vweibo/message/getTalkNameFromFuedid",
						type:"POST",
						data:{"fuedid":nameId},
						dataType:"JSON",
						success: function(data){
							for(var i=0;i<data.length;i++){
								$('.talkToWho').html(data[i].uname);
							}
						}
					});
				}
			}
		});
	}, 1000); 
	hisid=nameId;
	
	$.ajax({
		url:"../../../../vweibo/message/PMIsRead",
		type:"POST",
		data:{"pm1user":hisid,"pm2user":myid},
		dataType:"JSON",
		success: function(data){
			if(data==1){
				$('.detailremind'+hisid).hide();
			}
		}
	});
}
function sendMessage(){
	var content=$('.chatText').val();
	if(content==""||content==null){
		alert("输入的内容不能为空！！！");
	}else{
		$.ajax({
			url:"../../../../vweibo/message/talkToPmUser",
			type:"POST",
			data:{"pm1user":myid,"pm2user":hisid,"pmcontent":content},
			dataType:"JSON",
			success: function(data){
				
			}
		});
		$('.chatText').val("");
	}
}
function returnChatList(){
	$('.center0').show();
	$('.center2').hide();	
	clearInterval(i);
}
function showLittleWin(winId){
	$(winId).show();
}
function closeWindow(winId){
	$(winId).hide();	
}

