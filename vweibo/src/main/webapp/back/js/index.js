var base = "back/manager/";
$(function(){
		
	$("#center_area").tabs('add',{
		title:'首页',
		href:base+'backWelcome.html'
	});
	
	$("#menu_tree").tree({
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
			}/*else if(text=="管理员管理"){
				if(tabs.tabs('exists','管理员管理')){//如果存在，则选中
					tabs.tabs('select','管理员管理');
				}else{
					tabs.tabs('add',{
						title:"管理员管理",
						href:"manager.html",
						closable:true
					});
				}
			}else if(text=="新闻类型管理"){
				if(tabs.tabs('exists','新闻类型管理')){//如果存在，则选中
					tabs.tabs('select','新闻类型管理');
				}else{
					tabs.tabs('add',{
						title:"新闻类型管理",
						href:"types.html",
						closable:true
					});
				}
			}else if(text=="个人信息"){
				if(tabs.tabs('exists','个人信息')){//如果存在，则选中
					tabs.tabs('select','个人信息');
				}else{
					tabs.tabs('add',{
						title:"个人信息",
						href:"person.html",
						closable:true
					});
				}
			}else if(text=="会员管理"){
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