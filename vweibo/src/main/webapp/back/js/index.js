var base = "back/manager/";
$(function(){
		
	$("#center_area").tabs('add',{
		title:'首页',
		href:base+'backWelcome.html'
	});
	
	$(".easyui-tree").tree({//这里之前写错了，id要唯一，要不取值的时候，永远只会拿到第一个id的元素，这里是
		//给tree增加点击事件，
		onClick:function(node){
			var text=node.text;  //获取选中节点的文本值
			var tabs=$("#center_area");
			if(text=="人物标签管理"){
				if(tabs.tabs('exists','人物标签管理')){//如果存在，则选中
					tabs.tabs('select','人物标签管理');
				}else{
					tabs.tabs('add',{
						title:"人物标签管理",
						href:base+"userTags.html",
						closable:true
					});
				}
			}else if(text=="微博标签管理"){
				if(tabs.tabs('exists','微博标签管理')){//如果存在，则选中
					tabs.tabs('select','微博标签管理');
				}else{
					tabs.tabs('add',{
						title:"微博标签管理",
						href:base+"weiboTags.html",
						closable:true
					});
				}
			}else if(text=="话题标签管理"){
				if(tabs.tabs('exists','话题标签管理')){//如果存在，则选中
					tabs.tabs('select','话题标签管理');
				}else{
					tabs.tabs('add',{
						title:"话题标签管理",
						href:base+"theme.html",
						closable:true
					});
				}
			}else if(text=="微博管理"){
				if(tabs.tabs('exists','微博管理')){//如果存在，则选中
					tabs.tabs('select','微博管理');
				}else{
					tabs.tabs('add',{
						title:"微博管理",
						href:base+"weibo.html",
						closable:true
					});
				}
			}else if(text=="用户管理"){
				if(tabs.tabs('exists','用户管理')){//如果存在，则选中
					tabs.tabs('select','用户管理');
				}else{
					tabs.tabs('add',{
						title:"用户管理",
						href:base+"weiboUser.html",
						closable:true
					});
				}
			}/*else if(text=="会员管理"){
				if(tabs.tabs('exists','会员管理')){//如果存在，则选中
					tabs.tabs('select','会员管理');
				}else{
					tabs.tabs('add',{
						title:"会员管理",
						href:"user.html",
						closable:true
					});
				}
			}*/
		}
	});
});